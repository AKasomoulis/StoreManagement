package gr.uoa.di.storemanagement.web.store;

import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
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

public class AddStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private String url;
	private String name;
	private String description;
	private String status;
	private int isOpen;
	private String location;
	private StoreDaoImpl stDao;
	private Store st;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteStore(user.getRole().getRights())) {
				
				/* Get all information*/
				name = request.getParameter("name");
				if (name == null) name = "";
				
				description = request.getParameter("description");
				if (description == null) description = "";
				
				status = request.getParameter("status");
				if (status == null) status = "";
				
				if (status == null)
					isOpen = 0;
				else if (status.equals("isOpen"))
					isOpen = 1;
				else if (status.equals("isNotOpen"))
					isOpen = 0;
						
				location = request.getParameter("location");
				if (location == null) location = "";
				
				/* If there is no null information*/
				if (!name.equals("") && !description.equals("") && !status.equals("") && !location.equals("")) {
					stDao = new StoreDaoImpl();
					st = new  Store();
					st.setName(name);
					st.setDescription(description);
					st.setIsOpen(isOpen);
					st.setLocation(location);
					
					/* If there is no store with that information in database insert it*/
					if (!stDao.storeExists(st)) {
						stDao.create(st);
						url = "/AllStores";
					}
					else {
						/* Error message in jsp - store exists*/
						request.setAttribute("error", "store exists");
		
						request.setAttribute("name", "");
						request.setAttribute("description", description);
						request.setAttribute("location", location);
						url = "/WEB-INF/addStore.jsp";
					}
						
				}
				else {
					/* Error message in jsp - empty field*/
					request.setAttribute("error", "null value");
		
					request.setAttribute("name", name);
					request.setAttribute("description", description);
					request.setAttribute("status", status);
					request.setAttribute("location", location);
					url = "/WEB-INF/addStore.jsp";
				}
			}
			else {
				url = "/WEB-INF/noRights.jsp";
			}
		}
		else {
			url = "/WEB-INF/notLoggedIn.jsp";
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
