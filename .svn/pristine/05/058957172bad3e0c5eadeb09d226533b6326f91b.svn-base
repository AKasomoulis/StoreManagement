package gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLinkPK;

import java.util.List;

public interface StoreProductLinkDao extends Dao<StoreProductLink, StoreProductLinkPK>{
	public List<Object[]> getProductsFromStore(String storeName);
	public List<Object[]> getStoresWithProduct(ProductPK productPK);

}
