package gr.uoa.di.storemanagement.web.product;

import gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao.LastMovementsDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;
import gr.uoa.di.storemanagement.datalayer.entities.product.PriceCalculation;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.rights.Rights;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private HttpSession session;
	private User user;
	
	private String name;
	private String serialNumber;
	private String description;
	private String type;
	private int weight;
	private int dimensions;
	private int mass;
	private int price;
	private int quantity;
	
	private String storeName;
	private String supplierName;
	
	private List<String> stores;
	private List<String> suppliers;

	private ProductPK productPK;
	private ProductDaoImpl productDao;
	private Product product;
	private LastMovements lm;
	private StoreDaoImpl storeDao;
	private SupplierDaoImpl supplierDao;
	private LastMovementsDaoImpl lDao;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession(true);
		user = (User)session.getAttribute("user");

		if (user != null) {
			
			if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) {

			
				/* Get product information*/
				name = request.getParameter("name");
				if (name == null) name = "";
				
				description = request.getParameter("description");
				if (description == null) description = "";
				
				serialNumber = request.getParameter("serialNumber");
				if (serialNumber == null) serialNumber = "";
				
				type = request.getParameter("type");
				if (type == null) type = "";
				
				weight = 0;
				mass = 0;
				dimensions = 0;
				
				storeName = request.getParameter("prstore");
				if (storeName == null) storeName = "";
		
				supplierName = request.getParameter("prsupplier");
				if (supplierName == null) supplierName = "";
		
				if (request.getParameter("weight") == null || request.getParameter("weight").equals("")) {
					weight = -1;
				}
				else {
					weight = Integer.parseInt(request.getParameter("weight"));
				}
		
				if (request.getParameter("dimensions") == null || request.getParameter("dimensions").equals("")) {
					dimensions = -1;
				}
				else {
					dimensions = Integer.parseInt(request.getParameter("dimensions"));
				}
				
				if (request.getParameter("mass") == null || request.getParameter("mass").equals("")) {
					mass = -1;
				}
				else {
					mass = Integer.parseInt(request.getParameter("mass"));
				}
				
				if (request.getParameter("price") == null || request.getParameter("price").equals("")) {
					price = -1;
				}
				else {
					price = Integer.parseInt(request.getParameter("price"));
				}
				
				if (request.getParameter("quantity") == null || request.getParameter("quantity").equals("")) {
					quantity = -1;
				}
				else {
					quantity = Integer.parseInt(request.getParameter("quantity"));
				}
				
		
		
				stores = (List<String>) request.getAttribute("storeNames");
				suppliers = (List<String>) request.getAttribute("supplierNames");
				
		//		dimensions = Integer.getInteger(request.getParameter("dimensions"));
		//		mass = Integer.getInteger(request.getParameter("mass"));
				
				if (!name.equals("") && !description.equals("") && !serialNumber.equals("") 
						&& (price != -1) && (quantity != -1)) {
					productPK = new ProductPK();
					productPK.setName(name);
					productPK.setSerialNumber(serialNumber);
					
					productDao = new ProductDaoImpl();
					storeDao = new StoreDaoImpl();
					supplierDao = new SupplierDaoImpl();
					
					// if a product with this name, and s/n does not exist
					if (productDao.read(productPK) == null) {
						
						// create the product
						product = new Product();
						product.setName(name);
						product.setSerialNumber(serialNumber);
						product.setDescription(description);
						product.setDimensions(dimensions);
						product.setType(type);
						product.setMass(mass);
						product.setWeight(weight);
						product.setQuantity(quantity);
						product.setPrice(PriceCalculation.getInstance().calculate(price));
						
						productDao.create(product);
						
						// update the last movements
						lDao = new LastMovementsDaoImpl();
						lm = new LastMovements();
						lm.setFromStore("-");
						lm.setProductName(name);
						lm.setSerialNumber(serialNumber);
						lm.setToStore(storeName);
						lm.setKindOfMovement("insertion");
						lm.setQuantity(quantity);
						lm.setTime(Calendar.getInstance().getTime());
						lDao.create(lm);				
						
						// create the product store link
						ProductStoreDaoImpl psDao = new ProductStoreDaoImpl();
						ProductStore ps = new ProductStore();
						ps.setLt(description);
						ps.setProductName(name);
						ps.setQuantity(quantity);
						ps.setSerialNumber(serialNumber);
						ps.setStoreName(storeName);
						ps.setSupplierName(supplierName);
						psDao.create(ps);
						
						// create the product supplier link
						ProductSupplierDaoImpl psupDao = new ProductSupplierDaoImpl();
						ProductSupplier psup = new ProductSupplier();
						psup.setPrice(price);
						psup.setProductName(name);
						psup.setSerialNumber(serialNumber);
						psup.setSupplierName(supplierName);
						psupDao.create(psup);
						
						url = "/AllProducts";
					}
					else {
						request.setAttribute("error", "product exists");
		
						request.setAttribute("name", "");
						request.setAttribute("serialNumber", "");
						request.setAttribute("description", description);
						request.setAttribute("type", type);
						request.setAttribute("weight", weight);
						request.setAttribute("dimensions", dimensions);
						request.setAttribute("mass", mass);
						request.setAttribute("price", price);
						request.setAttribute("quantity", quantity);
						request.setAttribute("storeNames", stores);
						request.setAttribute("supplierNames", suppliers);
						url = "/WEB-INF/addProduct.jsp";
					}
				}
				// null values
				else {
					request.setAttribute("error", "null value");
		
					request.setAttribute("name", name);
					request.setAttribute("serialNumber", serialNumber);
					request.setAttribute("description", description);
					request.setAttribute("type", type);
					request.setAttribute("weight", weight);
					request.setAttribute("dimensions", dimensions);
					request.setAttribute("mass", mass);
					request.setAttribute("price", price);
					request.setAttribute("quantity", quantity);
					request.setAttribute("storeNames", stores);
					request.setAttribute("supplierNames", suppliers);
					url = "/AddProductA";
					
		//			response.getWriter().println("name:" + name);
		//			response.getWriter().println("serialNumber:" + serialNumber);
		//			response.getWriter().println("description:" + description);
		//			response.getWriter().println("type:" + type);
		//			response.getWriter().println("quantity:" + quantity);
		//			response.getWriter().println("price:" + price);
		//			response.getWriter().println("mass:" + mass);
		//			response.getWriter().println("weight:" + weight);
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
