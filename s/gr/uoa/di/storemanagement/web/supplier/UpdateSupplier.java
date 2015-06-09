package gr.uoa.di.storemanagement.web.supplier;

import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;
	private User user;
	
	private String name;
	private String address;
	private String description;
	private SupplierDaoImpl suppDao;
	private Supplier supplier;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights())) {
		
				/* Get all supplier's information*/
				name = (String)request.getParameter("hidden2");
				if (name == null) name = "";
		
				address = (String) request.getParameter("suppaddress");
				if (address == null) address = "";
		
				description = (String) request.getParameter("suppdescription");
				if (description == null) description = "";
				
				/* If there is no null information*/
				if (!name.equals("") && !address.equals("") && !description.equals("")) {
					
					suppDao = new SupplierDaoImpl();
					supplier = new Supplier();
					
					supplier = suppDao.read(name);
					
					supplier.setAddress(address);
					supplier.setDescription(description);
					
					/* Update supplier in database*/
					suppDao.update(supplier);
					
					url = "/AllUsers";
				}
				else {
					url = "/AllUsers";
				}
			
			}
			else {
				url = "/WEB-INF/noRights.jsp";
			}
		}
		else {
			url = "/WEB-INF/notLoggedIn.jsp";
		}

		/* Redirection to jsp*/
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
