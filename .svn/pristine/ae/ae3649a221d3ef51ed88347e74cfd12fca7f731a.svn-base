package gr.uoa.di.storemanagement.web.store;


import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
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

public class AllStores extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	private HttpSession session;
	private User user;
	
	private StoreDaoImpl storeDao;
	private List<Object[]> stores;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		storeDao = new StoreDaoImpl();
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canReadStore(user.getRole().getRights()) || Rights.getInstance().canWriteStore(user.getRole().getRights())) {
		
				/* Get all stores from database */
				stores = storeDao.getAllStores();
				request.setAttribute("stores", stores);
				
				/* Redirection to jsp*/
				url = "/WEB-INF/adminStores.jsp";
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
