package gr.uoa.di.storemanagement.web.store;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private String storeName;
	private StoreDaoImpl storeDao;
	private Store store;

	private List<ProductStore> productStoreList;
	private ProductStoreDaoImpl psDao;
	private ProductSupplierDaoImpl psupDao;
	
	private ProductDaoImpl productDao;
	private ProductPK productPK;
	private Product product;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		psDao = new ProductStoreDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		productDao = new ProductDaoImpl();
		storeDao = new StoreDaoImpl();
	
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteStore(user.getRole().getRights())) {
				
				/* Get all store information */
				storeName = (String) request.getParameter("stname");
				
				if (storeName != null) {
				
					store = storeDao.read(storeName);
					
					if (store != null) {
						/* Delete store from database */
						storeDao.delete(store);
						
						productStoreList = psDao.getEverythingFromStore(storeName);
						
						if (!productStoreList.isEmpty()) {
							
							for (ProductStore ps : productStoreList) {
								
								if (psDao.numberOfStoresWithThisProductAndThisSupplier(ps.getProductName(), ps.getSerialNumber(), ps.getSupplierName()) == 1) {
									psupDao.deleteIt(ps.getProductName(), ps.getSerialNumber(), ps.getSupplierName());							
								}
								
								// if this product exists only in this store, delete it 
								if (psDao.numberOfStoresWithThisProduct(ps.getProductName(), ps.getSerialNumber()) == 1) {
				
									productPK = new ProductPK();
									productPK.setName(ps.getProductName());
									productPK.setSerialNumber(ps.getSerialNumber());
									
									product = productDao.read(productPK);
									
									productDao.delete(product);
								}
				
								psDao.delete(ps);
								
							}
						}
						
						url = "/AllStores";		
					}
					else {
						url = "/WEB-INF/currentStore.jsp";	
					}
				}
				else {
					url = "/error.html";
				}
			}
			else {
				url = "/WEB-INF/noRights.jsp";
			}
		}
		else {
			url = "/WEB-INF/notLoggedIn.jsp";
		}
		
		/* Redirection to jsp or servlet*/
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
