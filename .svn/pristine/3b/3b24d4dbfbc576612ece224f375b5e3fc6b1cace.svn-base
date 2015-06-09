package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserSupplierDaoImpl;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private UserSupplier userSupplier;
	private UserSupplierDaoImpl userSupplierDao;
	private UserDaoImpl userDao;
	private String username;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		userDao = new UserDaoImpl();
		userSupplierDao = new UserSupplierDaoImpl();
		
		user = new User();
		userSupplier = new UserSupplier();
		
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (user.getRole().getRoleName().equals("Admin")) {
				
				/* Get user's username*/
				username = (String)request.getParameter("hidden");
				
				if (username != null) {
				
					/* If user is supplier's representative delete it*/
					if (userSupplierDao.UserSuppExists(username)) {
						userSupplier = userSupplierDao.read(username);
						userSupplierDao.delete(userSupplier);
					}		
					
					/* Read user from database*/
					user = userDao.read(username);
					
					/* Delete it*/
					userDao.delete(user);
					
					/* Redirection to jsp*/
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
