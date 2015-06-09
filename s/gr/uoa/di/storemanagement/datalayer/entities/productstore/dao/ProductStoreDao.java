package gr.uoa.di.storemanagement.datalayer.entities.productstore.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStorePK;

import java.util.List;

public interface ProductStoreDao extends Dao<ProductStore, ProductStorePK> {
	public List<Object[]> getProductsFromStore(String storeName);
	public List<Object[]> getStoresWithProduct(ProductPK productPK);

	public List<ProductStore> getEverythingFromStore(String storeName);
	public List<ProductStore> getEverythingFromProduct(ProductPK productPK);
	public List<ProductStore> getEverythingFromProductWithSupplier(ProductPK productPK, String supplierName);
	public List<ProductStore> getEverythingFromProductWithSupplier(String productName, String serialNumber, String supplierName);

	public Long numberOfStoresWithThisProduct(ProductPK productPK);
	public Long numberOfStoresWithThisProduct(String productName, String serialNumber); 
	public Long numberOfStoresWithThisProductAndThisSupplier(String productName, String serialNumber, String supplierName);
	
	public void deleteEverythingWithThisProductAndThisSupplier(String productName, String serialNumber, String supplierName);
	public void deleteIt(String productName, String serialNumber, String supplierName);
}