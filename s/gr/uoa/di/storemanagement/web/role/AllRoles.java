package gr.uoa.di.storemanagement.web.role;

import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
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


public class AllRoles extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;
	private User user;
	
	private RoleDaoImpl roleDao;
	private List<String> roles;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			// if this user has the rights to view this page
			if (user.getRole().getRoleName().equals("Admin")) {
		
				roleDao = new RoleDaoImpl();
				
				/* Get all roles from database*/
				roles = roleDao.getAllRoles();
				
				/* Set roles in request*/
				request.setAttribute("roles", roles);
				
				/* Redirection to jsp*/
				url = "/WEB-INF/adminRoles.jsp";
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
