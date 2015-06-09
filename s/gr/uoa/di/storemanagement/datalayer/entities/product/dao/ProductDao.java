package gr.uoa.di.storemanagement.datalayer.entities.product.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;

import java.util.List;

public interface ProductDao  extends Dao<Product, ProductPK> {
	public List<Product> findProductsByName(String name);
	public List<Product> findProductsByDescription(String description);
	public boolean ProductExists(Product pr);
	public List<Object[]> getAllProducts();
	
	public void deleteIt(String productName, String serialNumber);
	public void changeQuantityBy(String productName, String serialNumber, int changedQuantity);
	
	public List<Object[]> searchByName(String searchQuery) ;
	public List<Object[]> searchByNameWholeWord(String searchQuery) ;
	public List<Object[]> searchByDescription(String searchQuery) ;
	public List<Object[]> searchBySerialNumber(String searchQuery) ;
	
	public Long getNumberOfTotalProducts();
}
