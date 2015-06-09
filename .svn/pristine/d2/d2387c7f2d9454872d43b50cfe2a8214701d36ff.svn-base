package gr.uoa.di.storemanagement.web.supplier;

import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink.dao.SupplierProductLinkDaoImpl;
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

public class SupplierInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private SupplierDaoImpl suppDao;
	private Supplier supplierInfo;
	private String name;
	private ProductSupplierDaoImpl suppProductDao;
	private List<Object[]> supplierProducts;

	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		suppDao = new SupplierDaoImpl();
		
		suppProductDao = new ProductSupplierDaoImpl();
		
		supplierInfo = new Supplier();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights()) || Rights.getInstance().canReadUser(user.getRole().getRights())) {			
				
				/* Get supplier name*/
				name = (String)request.getParameter("supphidden");
				
				if (name != null) {
										
					/* Get supplier from database*/
					supplierInfo = suppDao.read(name);
					
					/* Set supplier in request*/
					request.setAttribute("supplierinfo", supplierInfo);
					
					/* Get supplier's products from database*/
					supplierProducts = suppProductDao.getProductsFromSupplier(name);
					request.setAttribute("supplierproducts", supplierProducts);
					
					/* Redirection to jsp*/
					url = "/WEB-INF/currentSupplier.jsp";
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
