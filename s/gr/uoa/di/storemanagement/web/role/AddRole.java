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


public class AddRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private String roleName;
	private String rightsStore;
	private String rightsUser;
	private String rightsProduct;
	private int roleRights;
	private Role role;
	private RoleDaoImpl roleDao;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* Get all information*/
		roleName = request.getParameter("name");
		if (roleName == null) roleName = "";
		
		rightsStore = request.getParameter("rightsStore");
		if (rightsStore == null) rightsStore = "";
		
		rightsUser = request.getParameter("rightsUser");
		if (rightsUser == null) rightsUser = "";
		
		rightsProduct = request.getParameter("rightsProduct");
		if (rightsProduct == null) rightsProduct = "";
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (user.getRole().getRoleName().equals("Admin")) {
		
				/* If there is no null information*/
				if (!roleName.equals("") && !rightsStore.equals("") && !rightsUser.equals("") && !rightsProduct.equals("")) {
					
					role = new Role();
					roleDao = new RoleDaoImpl();
					
					role.setRoleName(roleName);
					
					if (rightsStore.equals("NONE"))
						//	rights += Rights.getInstance().noneRightStore(rights);
							roleRights += 0;
						else if (rightsStore.equals("WRITE"))
							roleRights = Rights.getInstance().doWriteStore(roleRights);
						//	rights += 200;
						else if (rightsStore.equals("READ"))
							roleRights = Rights.getInstance().doReadStore(roleRights);
						//	rights += 100;
						
						if (rightsUser.equals("NONE"))
						//	rights = Rights.getInstance().noneRightUser(rights);
							roleRights += 0;
						else if (rightsUser.equals("WRITE"))
							roleRights = Rights.getInstance().doWriteUser(roleRights);
						//	rights += 20;
						else if (rightsUser.equals("READ"))
							roleRights = Rights.getInstance().doReadUser(roleRights);
						//	rights += 10;
						
						if (rightsProduct.equals("NONE"))
						//	rights = Rights.getInstance().noneRightProduct(rights);
							roleRights += 0;
						else if (rightsProduct.equals("WRITE"))
							roleRights = Rights.getInstance().doWriteProduct(roleRights);
						//	rights += 2;
						else if (rightsProduct.equals("READ"))
							roleRights = Rights.getInstance().doReadProduct(roleRights);
						//	rights += 1;
						
						role.setRights(roleRights);
						
						/* If role doesn't exist in database insert it*/
						if (!roleDao.roleExists(roleName)) {
							roleDao.create(role);
							url = "/AllRoles";
						}
						else {
							/* Error message in jsp - role exists*/
							request.setAttribute("error", "role exists");
							
							request.setAttribute("name", "");
							request.setAttribute("rstore", rightsStore);
							request.setAttribute("ruser", rightsUser);
							request.setAttribute("rproduct", rightsProduct);
							
							url = "/WEB-INF/addRole.jsp";
						}
					
				}
				else {
					/* Error in jsp - empty field*/
					request.setAttribute("error", "null value");
					
					request.setAttribute("name", roleName);
					request.setAttribute("rstore", rightsStore);
					request.setAttribute("ruser", rightsUser);
					request.setAttribute("rproduct", rightsProduct);
					
					url = "/WEB-INF/addRole.jsp";
				}
			}
			else {
				url = "/WEB-INF/noRights.jsp";
			}
		}
		else {
			url = "/WEB-INF/notLoggedIn.jsp";
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
