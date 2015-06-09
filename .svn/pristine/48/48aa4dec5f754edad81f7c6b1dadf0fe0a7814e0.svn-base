package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserSupplierDaoImpl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;

	private String username;
	private String supplierName;

	private User user;
	private UserSupplier us;
	private UserSupplierDaoImpl userSupDao;
	private ProductSupplierDaoImpl psupDao;
	// [0] : productName and [1]: serialNumber
	private List<Object[]> products;
	private List<String> productNames;

	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		psupDao = new ProductSupplierDaoImpl();
		userSupDao = new UserSupplierDaoImpl();

		session = request.getSession();

		user = (User) session.getAttribute("user");

		if (user == null) {
			url = "/WEB-INF/notLoggedIn.jsp";
		} 
		else {
			supplierName = userSupDao.getSupplierName(user.getUsername());

			if (supplierName == null) {
				
				url = "/WEB-INF/noRights.jsp";
				
			}
			else {

				products = psupDao.getProductsFromSupplier(supplierName);
	
				request.setAttribute("products", products);
	
				/* Redirection to jsp */
				url = "/WEB-INF/myProducts.jsp";
			
			}
		}
		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
