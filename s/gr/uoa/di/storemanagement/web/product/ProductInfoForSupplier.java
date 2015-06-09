package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserSupplierDaoImpl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductInfoForSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private String productName;
	private String productSerialNumber;
	private String supplierName;
	private String username;
	private int supplierPrice;
	
	private Product product;
	
	private ProductDaoImpl pDao;
	private ProductStoreDaoImpl psDao;
	private ProductSupplierDaoImpl psupDao;
	private StoreDaoImpl sDao;
	private List<ProductStore> productStoreList;
	private List<String> stores;
	
	private UserSupplierDaoImpl uDao;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	
	
	/*
	List<ProductStore> storeLink;
	List<String> stores;
	String myStore = null;
	
	storeLink = (List<ProductStore>) request.getAttribute("storeproducts");
	stores = (List<String>) request.getAttribute("stores");
	*/
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		uDao = new UserSupplierDaoImpl();
		pDao = new ProductDaoImpl();
		psDao = new ProductStoreDaoImpl();
		sDao = new StoreDaoImpl();
		psupDao = new ProductSupplierDaoImpl();

		session = request.getSession();
		user = (User) session.getAttribute("user");
		
		// if there is an active session - user is logged in
		if (user != null) {
		
			username = user.getUsername();
			
			/* Get product's name and serial number*/
			productName = (String) request.getParameter("hidden");
			productSerialNumber = (String) request.getParameter("hidden1");
			
			// if this user has not visited this page arbitrary
			if (productName != null && productSerialNumber != null) {
			
				supplierName = uDao.getSupplierName(username);
				
				if (supplierName != null) {
			
					product = pDao.readIt(productName, productSerialNumber);
					request.setAttribute("productinfo", product);
					
					productStoreList = psDao.getEverythingFromProductWithSupplier(productName, productSerialNumber, supplierName);
					request.setAttribute("storeproducts", productStoreList);
					
					supplierPrice = psupDao.getProductPriceFromSupplier(productName, productSerialNumber, supplierName);
					request.setAttribute("supplierprice", supplierPrice);
					
					stores = sDao.getAllStoreNames();
					request.setAttribute("stores", stores);
					
					url = "/WEB-INF/currentProductForSupplier.jsp";
				}
				else {
					url = "/WEB-INF/noRights.jsp";
				}
			}
			else {
				url = "/error.html";
			}
		}
		else {
			url = "/WEB-INF/notLoggedIn.jsp";
		}
		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
