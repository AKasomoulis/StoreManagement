package gr.uoa.di.storemanagement.web;

import gr.uoa.di.storemanagement.rights.SupplierVerificationCode;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GenerateVerificationCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String supplierName;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		supplierName = request.getParameter("supplierName");
		
		if (supplierName != null) {
			SupplierVerificationCode.generate(supplierName);
			
			url = "/SupplierInfo?supphidden=" + supplierName;			
		}
		else {
			url = "/error.html";
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
