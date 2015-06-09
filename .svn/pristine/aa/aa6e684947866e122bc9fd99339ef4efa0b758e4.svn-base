package gr.uoa.di.storemanagement.web;

import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;
import gr.uoa.di.storemanagement.utilities.CookieUtilities;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String checkedSignedIn;
	
	private User user;
	private UserForApproval userfa;
	private Role role;
	private String username;
	private String password;
	private UserForApprovalDaoImpl usAppDao;
	private UserDaoImpl userDao;
	private boolean correctUsername;
	
	private String url = null;
	private HttpSession session;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession(true);

		/* Get username and password */
		username = request.getParameter("username");
		if (username == null) username = "";
		password = request.getParameter("password");
		if (password == null) password = "";

		usAppDao = new UserForApprovalDaoImpl();
		userDao = new UserDaoImpl();

		correctUsername = false;

		/* If there in no null info*/
		if (!username.equals("") && !password.equals("")) {
			
			/* Check if this user is the administrator*/
			if (userDao.isAdmin(username)) {
				
				/* Check the password*/
				if (userDao.checkPassForUser(username, password)) {
					
					role = new Role();
					user = new User();
					user = userDao.read(username);
					role = user.getRole();
					session.setAttribute("user", user);
					url = "/loading.jsp";

					correctUsername = true;
					
//					url = "/adminGeneral.jsp";
//					session.setAttribute("username", username);
//					session.setAttribute("rolename", role.getRoleName());
//					session.setAttribute("rolerights", role.getRights());		
				}
				else {
					request.setAttribute("error","invalid password");
					request.setAttribute("username", username);
					url = "/WEB-INF/index.jsp";
				}

			}
			/* Check if this user is waiting validation*/
			else if (usAppDao.userExists(username)) {
			
				/* Check the password*/
				if (usAppDao.checkPassForUserApproval(username, password)) {
					
					role = new Role();
					userfa = new UserForApproval();
					userfa = usAppDao.read(username);
					role = userfa.getRole();
					session.setAttribute("user1", userfa);
					url = "/notconfirmed.jsp";

					correctUsername = true;
					
//					session.setAttribute("username", username);
//					session.setAttribute("rolename", role.getRoleName());
//					session.setAttribute("rolerights", role.getRights());	

				}
				else {
					request.setAttribute("error","invalid password");
					request.setAttribute("username", username);
					url = "/WEB-INF/index.jsp";
					
				}
			}
			/* Check is this is a validated user*/
			else if (userDao.userExists(username)) {
				
				/* Check the password*/
				if (userDao.checkPassForUser(username, password)) {
					

					role = new Role();
					user = new User();
					user = userDao.read(username);
					role = user.getRole();
					session.setAttribute("user", user);
					url = "/loading.jsp";

					correctUsername = true;
					
//					url = "/adminGeneral.jsp";
//					session.setAttribute("username", username);
//					session.setAttribute("rolename", role.getRoleName());
//					session.setAttribute("rolerights", role.getRights());	
					
				}
				else {
					request.setAttribute("error","invalid password");
					request.setAttribute("username", username);
					url = "/WEB-INF/index.jsp";
				}
			}
			else {
				request.setAttribute("error", "unknown user");
				url = "/WEB-INF/index.jsp";
			}	
		}
		else {
			request.setAttribute("error", "null value");
			url = "/WEB-INF/index.jsp";
		}
		
		
		checkedSignedIn = request.getParameter("signedInChecked");
		if (correctUsername && checkedSignedIn != null) {
			Cookie c = new Cookie("username", username);
			response.addCookie(c);
		}
		else {
			if (CookieUtilities.getCookieValue(request, "username", null) != null) {
				Cookie c = new Cookie("username", username);
				c.setMaxAge(0);
				response.addCookie(c);
			}
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
