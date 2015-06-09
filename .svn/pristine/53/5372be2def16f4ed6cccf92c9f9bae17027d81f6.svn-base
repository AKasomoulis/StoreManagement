package gr.uoa.di.storemanagement.web.cart;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String name;
	private String serialNumber;
	private ProductPK productPK;
	private ProductDaoImpl productDao;
	private Product product;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		productPK = new ProductPK();
		productDao = new ProductDaoImpl();
		product = new Product();
		
		name = request.getParameter("hiddenname");
		serialNumber = request.getParameter("hiddenserial");
		
		if (name != null && serialNumber != null) {
			productPK.setName(name);
			productPK.setSerialNumber(serialNumber);
			
			product = productDao.read(productPK);
			
			request.setAttribute("product",product);
			
			url = "/addToCart.jsp";		
		}
		else {
			url = "/error.html";
		}
		
		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
