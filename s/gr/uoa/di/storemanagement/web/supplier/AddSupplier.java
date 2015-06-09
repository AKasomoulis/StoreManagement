package gr.uoa.di.storemanagement.web.supplier;

import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;
import gr.uoa.di.storemanagement.rights.SupplierVerificationCode;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private Supplier supplier;
	private SupplierDaoImpl suppDao;
	private String name;
	private String description;
	private String address;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights())) {
			
				/* Get all supplier's information*/
				name = request.getParameter("name");
				if (name == null) name = "";
				
				address = request.getParameter("address");
				if (address == null) address = "";
				
				description = request.getParameter("description");
				if (description == null) description = "";
				
				/* If there is no null information*/
				if (!name.equals("") && !address.equals("") && !description.equals("")) {
					
					suppDao = new SupplierDaoImpl();
					
					/* If there is no supplier with that information in database*/
					if (!suppDao.supplierExists(name)) {
						
						supplier = new Supplier();
						supplier.setCompanyName(name);
						supplier.setAddress(address);
						supplier.setDescription(description);
						supplier.setVerificationCode("0");
						
						/* Insert it*/
						suppDao.create(supplier);
						
						SupplierVerificationCode.generate(name);
						
						url = "/AllUsers";
					}
					else {
						/* Else error message in jsp - supplier exists*/
						request.setAttribute("error", "supplier exists");
						
						request.setAttribute("name", "");
						request.setAttribute("address", address);
						request.setAttribute("description", description);
						url = "/WEB-INF/addSupplier.jsp";
					}
					
				}
				else {
					/* Else error message in jsp - empty field*/
					request.setAttribute("error", "null value");
		
					request.setAttribute("name", name);
					request.setAttribute("address", address);
					request.setAttribute("description", description);
					url = "/WEB-INF/addSupplier.jsp";
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
