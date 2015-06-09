package gr.uoa.di.storemanagement.web.store;

import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
		
	private String url;
	private String storeName;
	private String location;
	private String status;
	private String description;
	private StoreDaoImpl storeDao;
	private Store store;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteStore(user.getRole().getRights())) {
					
				storeName = (String)  request.getParameter("hidden3");
				
				location = (String) request.getParameter("stlocation");
				if (location == null) location = "";
				
				status = (String) request.getParameter("ststatus");
				if (status == null) status = "";
				
				description = (String) request.getParameter("stdescription");
				if (description == null) description = "";
				
				if (!location.equals("") && 
		//				!status.equals("") && 
						!description.equals("")) {
					
					storeDao = new StoreDaoImpl();
					
					store = new Store();
					store = storeDao.read(storeName);
					
					store.setName(storeName);
					store.setLocation(location);
					store.setDescription(description);
					if (status.equals("isOpen"))
						store.setIsOpen(1);
					else if (status.equals("isNotOpen"))
						store.setIsOpen(0);
					
					storeDao.update(store);
					url = "/AllStores";	
					
				}
				else {
					url = "/AllStores";	
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
