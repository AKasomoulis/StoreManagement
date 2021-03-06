package gr.uoa.di.storemanagement.datalayer.entities.store.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;

import java.util.List;
import java.util.UUID;


public interface StoreDao  extends Dao<Store, String> {
	public boolean storeExists(Store st);
	public boolean storeExists(String storeName);

	public List<Object[]> getAllStores();
	public List<String> getAllStoreNames();

	public Long getNumberOfAllStores();
	public Long getNumberOfOpenedStores();
}
