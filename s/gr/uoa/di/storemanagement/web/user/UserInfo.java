package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
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


public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private User userInfo;
	private UserDaoImpl userDao;
	private String username;
	private List<String> roleNames;
	private RoleDaoImpl roleDao;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;

       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		userDao = new UserDaoImpl();
		
		userInfo = new User();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights()) || Rights.getInstance().canReadUser(user.getRole().getRights())) {
		
				/* Get current user's username*/
				username = (String)request.getParameter("userhidden");
				
				if (username != null) {
				
					/* Get all user's information from database*/
					userInfo = userDao.read(username);
				
					/* Set that information in request*/
					request.setAttribute("user1", userInfo);
					
					roleDao = new RoleDaoImpl();
					
					/* Get all role names from database*/
					roleNames = roleDao.getAllRoles();
					
					/* Set role names in request*/
					request.setAttribute("rolenames", roleNames);
					
					/* Redirection to jsp*/
					url = "/WEB-INF/currentUser.jsp";
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
