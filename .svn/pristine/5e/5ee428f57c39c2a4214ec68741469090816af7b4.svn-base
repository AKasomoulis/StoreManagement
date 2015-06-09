package gr.uoa.di.storemanagement.web.supplier;

import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private ProductDaoImpl productDao;
	private ProductStoreDaoImpl psDao;
	
	private ProductSupplierDaoImpl psupDao;
	private List<ProductSupplier> psupList;
	
	private SupplierDaoImpl suppDao;
	private Supplier supplier;
	private String name;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		suppDao = new SupplierDaoImpl();
		psDao = new ProductStoreDaoImpl();
		productDao = new ProductDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		psupList = new ArrayList<ProductSupplier>();
		supplier = new Supplier();
		
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights())) {
			
				/* Get supplier's name*/
				name = (String)request.getParameter("hidden3");
				
				if (name != null) {
					
					/* Get supplier from database*/
					supplier = suppDao.read(name);
					
					psupList = psupDao.getEverythingFromSupplier(name);
					
					if (psupList != null) {
					
						if (!psupList.isEmpty()) {
						
							for (ProductSupplier ps : psupList) {
								
								// delete everything from ProductStore table
								psDao.deleteEverythingWithThisProductAndThisSupplier(ps.getProductName(), ps.getSerialNumber(), ps.getSupplierName());
								
								// delete everything from ProductSupplier table
								psupDao.deleteIt(ps.getProductName(), ps.getSerialNumber(), name);
								
								// if there is no other one suppling this product
								if (psupDao.numberOfSuppliersWithThisProduct(ps.getProductName(), ps.getSerialNumber()) == 0) {
									
									// delete it!
									productDao.deleteIt(ps.getProductName(), ps.getSerialNumber());
									
								}
								
							}
						}
					}
					
					/* Delete supplier*/
					suppDao.delete(supplier);
					
					/* Redirection to servlet*/
					url = "/AllUsers";
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
		
		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
