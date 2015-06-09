package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateMyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private HttpSession session;
	private String username;
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	private Role role;
	private String roleName;
	private RoleDaoImpl roleDao;
	private User user;
	private UserDaoImpl userDao;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
	
			/* Get user's information*/
			username = (String)request.getParameter("hidden1");
			
			roleName = (String)request.getParameter("hidden2");
			
			firstName = (String) request.getParameter("firstname");
			if (firstName == null) firstName = "";
			
			lastName = (String) request.getParameter("lastname");
			if (lastName == null) lastName = "";
			
			password = (String) request.getParameter("password");
			if (password == null) password = "";
			
			email = (String) request.getParameter("email");
			if (email == null) email = "";
			
			/* If there is no null information*/
			if (!firstName.equals("") && !lastName.equals("") && !password.equals("") && !email.equals("") && !roleName.equals("")) {
				
				roleDao = new RoleDaoImpl();
				role = new Role();
				
				role = roleDao.read(roleName);		
				
				userDao = new UserDaoImpl();
				user = userDao.read(username);
				
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setPassword(password);
				user.setEmail(email);
				user.setRole(role);
				
				session = request.getSession(true);
				session.setAttribute("user", user);
				
				/* Update user in database*/
				userDao.update(user);
				
				url = "/userGeneral.jsp";
			
			}
			else {
				url = "/MyProfile.jsp";
			}
		}
		else {
			url = "/notLoggedIn.jsp";
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
