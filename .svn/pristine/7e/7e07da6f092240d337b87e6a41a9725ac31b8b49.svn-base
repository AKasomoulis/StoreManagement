package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteMyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;
	private User user;
	
	private UserDaoImpl userDao;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user = new User();
		userDao = new UserDaoImpl();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {			
			
			// if this user is not an administrator
			if (!user.getRole().getRoleName().equals("Admin")) {

				userDao.delete(user);

				session.removeAttribute("user");
			}
			url = "/Index";

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
