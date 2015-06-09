package gr.uoa.di.storemanagement.web.user;

import gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;


public class AllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private RoleDaoImpl roleDao;
	private UserForApprovalDaoImpl usAppDao;
	private UserDaoImpl userDao;
	private SupplierDaoImpl supplierDao;
	private List<String> roleNames;
	private List<Object[]> approvedUsers;
	private List<Object[]> suppliers;
	private List<Object[]> notApprovedUsers;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		roleDao = new RoleDaoImpl();
		usAppDao = new UserForApprovalDaoImpl();
		userDao = new UserDaoImpl();
		supplierDao = new SupplierDaoImpl();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteUser(user.getRole().getRights()) || Rights.getInstance().canReadUser(user.getRole().getRights())) {
			
				/* Get all role names from database*/
				roleNames = roleDao.getAllRoles();
				request.setAttribute("rolenames", roleNames);
				
				/* Get all users from database*/
				approvedUsers = userDao.getAllUsers();
				request.setAttribute("approvedUsers", approvedUsers);
				
				/* Get all suppliers from database*/
				suppliers = supplierDao.getAllSuppliers();
				request.setAttribute("suppliers", suppliers);
				
				/* Get all not approved users from database*/
				notApprovedUsers = usAppDao.getAllUsers();
				request.setAttribute("notApprovedUsers", notApprovedUsers);
					
				/* Redirection to servlet*/
				url = "/WEB-INF/adminUsers.jsp";
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
