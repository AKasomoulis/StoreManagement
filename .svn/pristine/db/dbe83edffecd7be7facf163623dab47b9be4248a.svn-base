package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
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

public class AddProductA extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private StoreDaoImpl storeDao;
	private List<String> stores;

	private SupplierDaoImpl supplierDao;
	private List<String> suppliers;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		storeDao = new StoreDaoImpl();
		supplierDao = new SupplierDaoImpl();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		if (user != null) {
			
			if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) {

				/* Get all store names from database*/
				stores = storeDao.getAllStoreNames();
				
				/* Get all supplier names from database*/
				suppliers = supplierDao.getAllSupplierNames();
				
				/* Set store names in request*/
				request.setAttribute("storeNames", stores);
				
				/* Set supplier names in request*/
				request.setAttribute("supplierNames", suppliers);
				
				/* Redirection to jsp*/
				url = "/WEB-INF/addProduct.jsp";
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
