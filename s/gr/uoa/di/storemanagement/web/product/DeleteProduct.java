package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDaoImpl productDao;
	private ProductStoreDaoImpl psDao;
	private List<ProductStore> productStoreList;
	
	private ProductSupplierDaoImpl psupDao;
	
	private ProductPK pk; 
	private Product product;
	
	private String productName;
	private String serialNumber;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDao = new ProductDaoImpl();
		psDao = new ProductStoreDaoImpl();
		psupDao = new ProductSupplierDaoImpl();
		
		productName = (String) request.getParameter("prname2");
		serialNumber = (String) request.getParameter("prserialnumber2");
		
		if (productName != null && serialNumber != null) { 
		
			pk = new ProductPK();
			pk.setName(productName);
			pk.setSerialNumber(serialNumber);
		
			product = productDao.read(pk);
			
			if (product == null) {
				// error page;
			}
			else {
				productStoreList = psDao.getEverythingFromProduct(pk);
				
				if (!productStoreList.isEmpty()) {
	
					for (ProductStore ps : productStoreList) {
						psDao.delete(ps);
					}				
					
				}
				
				psupDao.deleteIt(productName, serialNumber);
				
				productDao.delete(product);
			}
			url = "/AllProducts";
		}
		else {
			url = "/error.html";
		}
		
		/* Redirection to jsp or servlet */
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
