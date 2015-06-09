package gr.uoa.di.storemanagement.web.role;

import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
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

public class RoleInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private RoleDaoImpl roleDao;
	private Role roleInfo;
	private String roleName;
	
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
				
				roleInfo = new Role();
				
				/* Get role's name*/
				roleName = (String)request.getParameter("hidden");
				
				if (roleName != null) {
				
					/* Get role from database*/
					roleInfo = roleDao.read(roleName);
					
					/* Set that role in request*/
					request.setAttribute("roleInfo", roleInfo);
			
					/* Redirection to jsp*/
					url = "/WEB-INF/currentRole.jsp";
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
