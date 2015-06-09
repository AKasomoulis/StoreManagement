package gr.uoa.di.storemanagement.web.store;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.dao.StoreProductLinkDaoImpl;
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


public class StoreInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private StoreDaoImpl storeDao;
	private ProductStoreDaoImpl psDao;
	private String storeName;
	private Store storeInfo;
	private List<Object[]> storeProducts;
	
	private LastMovementsDaoImpl lmDao;
	private List<LastMovements> lmList;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		storeDao = new StoreDaoImpl();
		lmDao = new LastMovementsDaoImpl();
		
		psDao = new ProductStoreDaoImpl();

		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		// if there is an active session - user is logged in
		if (user != null) {
			
			// if this user has the rights to view this page
			if (Rights.getInstance().canReadStore(user.getRole().getRights())) {
			
				/* Get store's name*/
				storeName = (String) request.getParameter("hidden");
				
				if (storeName != null) {
				
					/* Get store from database*/
					storeInfo = storeDao.read(storeName);
					
					/* Set store in request*/
					request.setAttribute("storeinfo", storeInfo);
					
					/* Get store's products*/
					storeProducts = psDao.getProductsFromStore(storeName);
					
					/* Set store's products in request*/
					request.setAttribute("storeproducts", storeProducts);
					
					lmList = lmDao.getLastMovementsByStore(storeName, 10);
					request.setAttribute("lastmovements", lmList);
					
					/* Redirection to jsp*/
					url = "/WEB-INF/currentStore.jsp";
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
