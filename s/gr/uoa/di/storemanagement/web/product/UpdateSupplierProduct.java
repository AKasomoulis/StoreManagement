package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.product.PriceCalculation;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserSupplierDaoImpl;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateSupplierProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private HttpSession session;
	private User user;	
	private String productName;
	private String serialNumber;
	private String description;
	private int dimensions;
	private int mass;
	private String type;
	private int weight;
	private int supplierPrice;
	private String supplierName;
	private int newQuantity;
	private int changedQuantity;
	
	private Product product;
	private List<ProductStore> productStoresList;
	private ProductStore newProductStore;
	private LastMovements lm;
	
	private UserSupplierDaoImpl userSupDao;
	private StoreDaoImpl storeDao;
	private SupplierDaoImpl supplierDao;
	private ProductDaoImpl productDao;
	private ProductStoreDaoImpl psDao;
	private ProductSupplierDaoImpl psupDao;
	private LastMovementsDaoImpl lDao;

	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		storeDao = new StoreDaoImpl();
		productDao = new ProductDaoImpl();
		userSupDao = new UserSupplierDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canReadProduct(user.getRole().getRights())) {
		
				productName = request.getParameter("prname");
				if (productName == null) productName = "";
		
				serialNumber = request.getParameter("prserialnumber");
				if (serialNumber == null) serialNumber = "";
				
				description = request.getParameter("prdescription");
				if (description == null) description = "";
				
				if (request.getParameter("prdimension") != "" && request.getParameter("prdimension") != null) {
					dimensions = Integer.parseInt(request.getParameter("prdimension"));
				}
				else {
					dimensions = -1;
				}
				
				if (request.getParameter("prmass") != "" && request.getParameter("prmass") != null) {
					mass = Integer.parseInt(request.getParameter("prmass"));
				}
				else {
					mass = -1;
				}
				
				if (request.getParameter("prweight") != "" && request.getParameter("prweight") != null) {
					weight = Integer.parseInt(request.getParameter("prweight"));
				}
				else {
					weight = -1;
				}
				
				type = request.getParameter("prtype");
				if (type == null) type = "";
				
		
				if (request.getParameter("supplierPrice") == null || request.getParameter("supplierPrice").equals("")) {
					supplierPrice = 0;
				}
				else {
					supplierPrice = Integer.valueOf(request.getParameter("supplierPrice"));
				}
				
				product = productDao.readIt(productName, serialNumber);
				
				if (product == null) {
					url = "/error.html";	
				}
				else {
					psDao = new ProductStoreDaoImpl();
					psupDao = new ProductSupplierDaoImpl();
					lDao = new LastMovementsDaoImpl();
					
				
					// get current supplier name
					session = request.getSession();
					user = (User) session.getAttribute("user");
					supplierName = userSupDao.getSupplierName(user.getUsername());
		
					psupDao.setProductPriceFromSupplier(productName, serialNumber, supplierName, supplierPrice);
					product.setPrice(PriceCalculation.getInstance().calculate(supplierPrice));
					productDao.update(product);
					
					productStoresList = psDao.getEverythingFromProductWithSupplier(productName, serialNumber, supplierName);
					
					for (ProductStore ps : productStoresList) {
						
						if (request.getParameter("checkbox" + ps.getStoreName()) != null) {
							if (request.getParameter("newQuantity" + ps.getStoreName()) != null) {
													
								if (request.getParameter("newQuantity" + ps.getStoreName()).equals("")) 
									newQuantity = 0;
								else 
									newQuantity = Integer.valueOf(request.getParameter("newQuantity" + ps.getStoreName()));
														
								// change total quantity on this product
								changedQuantity = newQuantity - ps.getQuantity();
								productDao.changeQuantityBy(ps.getProductName(), ps.getSerialNumber(), changedQuantity);
								
								// update last movement
								if (changedQuantity != 0) {
									lm = new LastMovements();
		
									if (changedQuantity > 0) {
										lm.setKindOfMovement("insertion");
										lm.setQuantity(changedQuantity);
									}
									else {
										lm.setKindOfMovement("export");
										lm.setQuantity((-1) * changedQuantity);
									}
									lm.setFromStore("-");
									lm.setToStore(ps.getStoreName());
									lm.setProductName(ps.getProductName());
									lm.setSerialNumber(ps.getSerialNumber());
									lm.setTime(Calendar.getInstance().getTime());
									lDao.create(lm);
								}
		
								// change supplier's quantity on this product
								if (newQuantity == 0) {
									psDao.delete(ps);
								}
								else {
									ps.setQuantity(newQuantity);
									psDao.update(ps);
								}
							
							}
						}
						
					}
					
					if (psDao.numberOfStoresWithThisProductAndThisSupplier(productName, serialNumber, supplierName) == 0) {
						psupDao.deleteIt(productName, serialNumber, supplierName);
						
						if (psDao.numberOfStoresWithThisProduct(productName, serialNumber) == 0) {
							productDao.deleteIt(productName, serialNumber);
						}
					}
					
				}
				
				url = "/MyProduct";
			}
			else {
				url = "/WEB-INF/noRights.jsp";
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
