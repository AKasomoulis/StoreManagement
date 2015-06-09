package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink.SupplierProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private ProductDaoImpl productDao;
	private String productName, productSerialNumber;
	private Product product;
	private ProductPK productPK;
	private Set<StoreProductLink> storeProducts;
	private Set<SupplierProductLink> supplierProducts;
	
	private LastMovementsDaoImpl lmDao;
	private List<LastMovements> lmList;
	
	private ProductStoreDaoImpl psDao;
	private List<ProductStore> productStore;
	
	private ProductSupplierDaoImpl psupDao;
	private List<ProductSupplier> productSupplier;
	
	private StoreDaoImpl storeDao;
	private SupplierDaoImpl supplierDao;
	private List<String> stores;
	private List<String> suppliers;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		productDao = new ProductDaoImpl();
		storeDao = new StoreDaoImpl();
		supplierDao = new SupplierDaoImpl();
		psDao = new ProductStoreDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		lmDao = new LastMovementsDaoImpl();
						
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			/* Get product's name and serial number*/
			productName = (String) request.getParameter("hidden");
			productSerialNumber = (String) request.getParameter("hidden1");
				
			// if this user has not visited this page arbitrary
			if (productName != null && productSerialNumber != null) {
				
				// if this user has the rights to view this page
				if (Rights.getInstance().canReadProduct(user.getRole().getRights())) {
				
					productPK = new ProductPK();
					productPK.setName(productName);
					productPK.setSerialNumber(productSerialNumber);
					
					product = productDao.read(productPK);
					request.setAttribute("productinfo", product);
					
					productStore = psDao.getEverythingFromProduct(productPK);
					request.setAttribute("storeproducts", productStore);
			
					productSupplier = psupDao.getEverythingFromProduct(productPK);
					request.setAttribute("supplierproducts", productSupplier);
					
					stores = storeDao.getAllStoreNames();
					request.setAttribute("stores", stores);
					
					suppliers = supplierDao.getAllSupplierNames();
					request.setAttribute("suppliers", suppliers);
					
					lmList = lmDao.getLastMovementsByProduct(productName, productSerialNumber, 5);
					request.setAttribute("lastmovements", lmList);
					
					url = "/WEB-INF/currentProduct.jsp";
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
