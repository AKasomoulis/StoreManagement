package gr.uoa.di.storemanagement.datalayer.entities.productuser.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.productuser.ProductUser;

public interface ProductUserDao extends Dao<ProductUser, Integer> {
	public boolean orderExists(ProductUser order);
}