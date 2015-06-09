package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.product.PriceCalculation;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
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

public class AllProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private User user;
	
	private ProductSupplierDaoImpl psupDao;
	private ProductDaoImpl productDao;
	private List<Object[]> products;
	private String search;
	private String searchQuery;

	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDao = new ProductDaoImpl();
		psupDao = new ProductSupplierDaoImpl();

		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		if (user != null) {
			if (Rights.getInstance().canReadProduct(user.getRole().getRights())) {
				if (request.getParameter("searchText") == null) {
		
					products = productDao.getAllProducts();
		
				} 
				else {
					search = request.getParameter("search");
					searchQuery = request.getParameter("searchText");
		
					if (search.equals("searchByName")) {
		
						products = productDao.searchByName(searchQuery);
		
					}
					else if (search.equals("searchByDescription")) {
						
						products = productDao.searchByDescription(searchQuery);
						
					}
					else if (search.equals("searchBySerialNumber")) {
						
						products = productDao.searchBySerialNumber(searchQuery);
						
					}
					else if (search.equals("searchBySupplier")) {
						
						products = psupDao.searchBySupplier(searchQuery);
						
					}
		
				}
		
				request.setAttribute("fee", PriceCalculation.getInstance().getFee());
				request.setAttribute("discount", PriceCalculation.getInstance().getDiscount());
				request.setAttribute("otherFee", PriceCalculation.getInstance().getOtherFee());
				request.setAttribute("products", products);
				
				/* Redirection to jsp */
				url = "/WEB-INF/adminProducts.jsp";
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
