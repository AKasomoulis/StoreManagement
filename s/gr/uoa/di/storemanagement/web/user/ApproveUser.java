package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ApproveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private UserForApprovalDaoImpl userfaDao;
	private UserDaoImpl userDao;
	private UserForApproval usfa;
	private String username;
	private String roleName;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userfaDao = new UserForApprovalDaoImpl();
		
		usfa = new UserForApproval();
		
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (user.getRole().getRoleName().equals("Admin")) {
	
				/* Get not approved user's username*/
				username = (String)request.getParameter("hidden");
				
				if (username != null) {				
					/* Read not approved user from database*/
					usfa = userfaDao.read(username);
					
					/* Delete from UserForApproval table*/
					userfaDao.delete(usfa);
					
					userDao = new UserDaoImpl();
					
					user = new User();
					
					user.setUsername(usfa.getUsername());
					user.setFirstName(usfa.getFirstName());
					user.setLastName(usfa.getLastName());
					user.setPassword(usfa.getPassword());
					user.setEmail(usfa.getEmail());
					user.setRole(usfa.getRole());
					
					/* Insert it in user table*/
					userDao.create(user);
					
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
