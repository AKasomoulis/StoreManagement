package gr.uoa.di.storemanagement.web.cart;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MyCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HttpSession session;
	private Product product;
	private String strAmmount;
	private String strQuantity;
	private int ammount;
	private int quantity;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private ArrayList<Object[]> cartList;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		session = request.getSession(true);
		
        synchronized (session) {
		
			product = new Product();
			
			cartList = (ArrayList<Object[]>)session.getAttribute("cartList");
			
			session.setAttribute("cartList", cartList);
			
        }
		
		url="/AllProducts";
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
