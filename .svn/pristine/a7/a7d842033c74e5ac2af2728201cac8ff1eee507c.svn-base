package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStorePK;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplierPK;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HttpSession session;
	private User user;
	
	private ProductPK productPK;
	
	private ProductDaoImpl productDao;
	private Product product;

	private Store oldStore;
	private Store newStore;
	private StoreDaoImpl storeDao;
	private SupplierDaoImpl supplierDao;
	private LastMovementsDaoImpl lDao;
	
	private ProductSupplierDaoImpl psupDao;
	private ProductStoreDaoImpl psDao;
	private List<ProductStore> productStore;
	
	private ProductStore old;
	private ProductStore toBeRemoved;
	private ProductStore toBeAdded;
	private ProductStore toGetUpdated;
	private ProductStorePK pk;
	private LastMovements lm;
	
	private String productName;
	private String serialNumber;
	private String description;
	private int dimensions;
	private int mass;
	private String type;
	private int weight;
	
	private String newStoreName;
	private int newQuantity;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		storeDao = new StoreDaoImpl();
		productDao = new ProductDaoImpl();
		lDao = new LastMovementsDaoImpl();
		
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
		
		productPK = new ProductPK();
		productPK.setName(productName);
		productPK.setSerialNumber(serialNumber);
		
		product = new Product();
		product = productDao.read(productPK);
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");		

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) {
		
				if (product == null) {
					url = "/error.html";	
				}
				else {
					psDao = new ProductStoreDaoImpl();
					productStore = psDao.getEverythingFromProduct(productPK);
					
					Iterator itr = productStore.iterator();
					
					while (itr.hasNext()) {
						
						old = (ProductStore) itr.next();
						if (request.getParameter("checkbox" + old.getStoreName()) != null) {
							
							newStoreName = request.getParameter("selectNewStore" + old.getStoreName());
							newQuantity = Integer.valueOf(request.getParameter("newQuantity" + old.getStoreName()));
							
							oldStore = storeDao.read(old.getStoreName());
							newStore = storeDao.read(newStoreName);
							
							if (newQuantity == 0) {
								//do nothing
							}
							else if (newQuantity == old.getQuantity()) {
								// delete the old store-product link
								toBeRemoved = new ProductStore();
								toBeRemoved.setProductName(old.getProductName());
								toBeRemoved.setSerialNumber(old.getSerialNumber());
								toBeRemoved.setStoreName(old.getStoreName());
								psDao.delete(toBeRemoved);
								
								pk = new ProductStorePK();
								pk.setProductName(old.getProductName());
								pk.setSerialNumber(old.getSerialNumber());
								pk.setStoreName(newStoreName);
		
								toBeAdded = psDao.read(pk);
													
								// if newStore already has some products, update quantity
								if (toBeAdded != null) {
									toBeAdded.setQuantity(toBeAdded.getQuantity() + newQuantity);
									
									psDao.update(toBeAdded);
									
									// delete the old supplier-product link if this supplier stops suppling this product
									if (psDao.numberOfStoresWithThisProductAndThisSupplier(old.getProductName(), old.getSerialNumber(), old.getSupplierName()) == 0 ) {
										psupDao = new ProductSupplierDaoImpl();
																	
										psupDao.deleteIt(old.getProductName(), old.getSerialNumber(), old.getSupplierName());							
									}
		
								}
								// otherwise add this newStore
								else {
									toBeAdded = new ProductStore();
		
									toBeAdded.setProductName(productName);
									toBeAdded.setSerialNumber(serialNumber);
									toBeAdded.setStoreName(newStoreName);
									toBeAdded.setQuantity(newQuantity);
									toBeAdded.setLt("neo re poustrako..");
									toBeAdded.setSupplierName(old.getSupplierName());
		
									psDao.create(toBeAdded);
								}
							}
							else if (newQuantity < old.getQuantity()) {
								toGetUpdated = new ProductStore();
		
								pk = new ProductStorePK();
								pk.setProductName(old.getProductName());
								pk.setSerialNumber(old.getSerialNumber());
								pk.setStoreName(old.getStoreName());
		
								toGetUpdated = psDao.read(pk);
								toGetUpdated.setQuantity(old.getQuantity() - newQuantity);
								psDao.update(toGetUpdated);
								
								// newStore has to be added or updated?
								pk.setStoreName(newStoreName);
								toBeAdded = psDao.read(pk);
								
								// if newStore already has some products, update quantity
								if (toBeAdded != null) {
									toBeAdded.setQuantity(toBeAdded.getQuantity() + newQuantity);
									
									psDao.update(toBeAdded);
								}
								// otherwise add this newStore
								else {
									toBeAdded = new ProductStore();
		
									toBeAdded.setProductName(productName);
									toBeAdded.setSerialNumber(serialNumber);
									toBeAdded.setStoreName(newStoreName);
									toBeAdded.setQuantity(newQuantity);
									toBeAdded.setLt("neo re poustrako..");
									toBeAdded.setSupplierName(old.getSupplierName());
		
									psDao.create(toBeAdded);
								}
		
								
								// update last product movements
								if (newQuantity != 0) {
									lm = new LastMovements();
									lm.setProductName(productName);
									lm.setSerialNumber(serialNumber);
									lm.setFromStore(oldStore.getName());
									lm.setToStore(newStore.getName());
									lm.setKindOfMovement("movement");
									lm.setQuantity(newQuantity);
									lm.setTime(Calendar.getInstance().getTime());
									lDao.create(lm);
								}
								
							}
						}
					}
					
					product.setDescription(description);
					product.setDimensions(dimensions);
					product.setMass(mass);
					product.setWeight(weight);
					product.setType(type);
					productDao.update(product);
					
					url = "/AllProducts";
				}
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
