package gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao;


import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplierPK;

import java.util.List;

public interface ProductSupplierDao extends Dao<ProductSupplier, ProductSupplierPK> {
	public List<ProductSupplier> getEverythingFromSupplier(String supplierName);
	public List<ProductSupplier> getEverythingFromProduct(ProductPK productPK);
	
	public ProductSupplier readIt(String productName, String serialNumber, String supplierName);
	public void deleteIt(String storeName, String serialNumber);
	public Long numberOfSuppliersWithThisProduct(String productName, String serialNumber);

	public int getProductPriceFromSupplier(String productName, String productSerialNumber, String supplierName) ;
	public void setProductPriceFromSupplier(String productName, String serialNumber, String supplierName, int supplierPrice);
}
