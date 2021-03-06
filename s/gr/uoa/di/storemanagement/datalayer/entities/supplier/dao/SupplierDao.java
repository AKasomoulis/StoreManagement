package gr.uoa.di.storemanagement.datalayer.entities.supplier.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;

import java.util.List;
import java.util.UUID;


public interface SupplierDao  extends Dao<Supplier, String> {
	public List<Object[]> getAllSuppliers();
	public List<String> getAllSupplierNames();
	
	public boolean supplierExists(String name);
	public String getVerificationCode(String name);
	public String checkoutCode(String code);
	
	public Long getNumberOfTotalSuppliers();
}
