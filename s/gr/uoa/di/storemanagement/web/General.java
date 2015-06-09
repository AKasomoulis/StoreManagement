package gr.uoa.di.storemanagement.web;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class General extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;
	private User user;
	
	private ProductDaoImpl pDao;
	private SupplierDaoImpl sDao;
	private UserDaoImpl uDao;
	private StoreDaoImpl storeDao;
	
	private Long totalUsers;
	private Long totalSuppliers;
	private Long totalProducts;
	private Long openedStores;
	private Long closedStores;
	
	private List<LastMovements> lastMovements;
	private List<LastMovements> lastInsertions;
	private List<LastMovements> lastExports;
	private LastMovementsDaoImpl lmDao;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pDao = new ProductDaoImpl();
		sDao = new SupplierDaoImpl();
		uDao = new UserDaoImpl();
		lmDao = new LastMovementsDaoImpl();
		storeDao = new StoreDaoImpl();		
		

		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		if (user != null) {		
		
			if (user.getRole().getRoleName().equals("Admin")) {				
			
				totalUsers = uDao.getNumberOfTotalUsers();
				request.setAttribute("totalusers", totalUsers);
		
				totalSuppliers = sDao.getNumberOfTotalSuppliers();
				request.setAttribute("totalsuppliers", totalSuppliers);
		
				totalProducts = pDao.getNumberOfTotalProducts();
				request.setAttribute("totalproducts", totalProducts);
				
				openedStores = storeDao.getNumberOfOpenedStores();
				request.setAttribute("openedstores", openedStores);
		
				closedStores = storeDao.getNumberOfAllStores() - openedStores;
				request.setAttribute("closedstores", closedStores);
				
				lastMovements = lmDao.getLastMovementsByKindOfMovements("movement", 10);
				request.setAttribute("lastmovements", lastMovements);
				
				lastInsertions = lmDao.getLastMovementsByKindOfMovements("insertion", 10);
				request.setAttribute("lastinsertions", lastInsertions);
				
				lastExports = lmDao.getLastMovementsByKindOfMovements("export", 10);
				request.setAttribute("lastexports", lastExports);
				
				url = "/WEB-INF/adminGeneral.jsp";
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
