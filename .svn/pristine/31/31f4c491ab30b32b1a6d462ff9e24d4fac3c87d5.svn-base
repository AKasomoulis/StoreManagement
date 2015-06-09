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


public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private ArrayList<Object[]> cartList;
	private String strLine;
	private int line;
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		session = request.getSession(true);
		
		cartList = (ArrayList<Object[]>)session.getAttribute("cartList");
		
		strLine = request.getParameter("hiddeni");
		line = Integer.parseInt(strLine);
		
		cartList.remove(line);
		
		session.setAttribute("cartList", cartList);
		
		/* Redirection to jsp*/
		url = "/myCart.jsp";
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
