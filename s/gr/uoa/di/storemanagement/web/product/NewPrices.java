package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.product.PriceCalculation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NewPrices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private double fee;
	private double discount;
	private double otherFee;
	private String from;
	
	private ServletContext context;
	private RequestDispatcher dispatcher;
	private String url;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if ((request.getParameter("fee") == null) || (request.getParameter("discount") == null) || (request.getParameter("otherFee") == null) || (request.getParameter("from") == null)) {
			url = "/error.html";
		}
		else {
			
			fee = Double.valueOf(request.getParameter("fee"));
			discount = Double.valueOf(request.getParameter("discount"));
			otherFee = Double.valueOf(request.getParameter("otherFee"));
			from = request.getParameter("from");
		
			if (from.equals("fromNowOn")) {
				PriceCalculation.getInstance().setNewFeeFromNowOn(fee);
				PriceCalculation.getInstance().setNewDiscountFromNowOn(discount);
				PriceCalculation.getInstance().setNewOtherFeeFromNowOn(otherFee);
			}
			else if (from.equals("forEveryProduct")) {
				PriceCalculation.getInstance().setNewFee(fee);
				PriceCalculation.getInstance().setNewOtherFee(otherFee);
				PriceCalculation.getInstance().setNewDiscount(discount);
			}
			
			
			url = "/AllProducts";
		}

		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
