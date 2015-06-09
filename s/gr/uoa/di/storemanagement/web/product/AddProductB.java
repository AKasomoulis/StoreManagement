package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddProductB
 */
public class AddProductB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;
	private User user;
	
	private String storeName;
	private StoreDaoImpl storeDao;
	private List<String> storeList;

	private SupplierDaoImpl supplierDao;
	private List<String> suppliers;

	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		supplierDao = new SupplierDaoImpl();
		storeDao = new StoreDaoImpl();
		storeList = new ArrayList<String>();

		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) {
			
				storeName = request.getParameter("storename");
				
				if (storeName != null) {
	
					if (storeDao.read(storeName) != null) {
						storeList.add(storeName);
						suppliers = supplierDao.getAllSupplierNames();
	
						request.setAttribute("storeNames", storeList);
						request.setAttribute("supplierNames", suppliers);
	
						url = "/WEB-INF/addProduct.jsp";
					} 
					else {
						url = "/error.html";
					}			
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
