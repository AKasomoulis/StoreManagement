package gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink;

import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLinkPK;

import java.io.Serializable;

public class SupplierProductLinkPK implements Serializable {
private static final long serialVersionUID = 7248177294975403198L;
	
	private String supplierName = null;
	private String productName = null;
	private String productSerialNumber = null;
	
	@Override
	public boolean equals(Object other)
	{
		if (this == other)
	        return true;
	    if (!(other instanceof SupplierProductLinkPK))
	        return false;
	    SupplierProductLinkPK castOther = (SupplierProductLinkPK) other;
	    return supplierName.equals(castOther.supplierName) && 
	    		productName.equals(castOther.productName) && 
	    		productSerialNumber.equals(castOther.productSerialNumber);
	}
	
	@Override
	public int hashCode() 
	{
	    final int prime = 31;
	    int hash = 17;
	    hash = hash * prime + productSerialNumber.hashCode();
	    return hash;
	}
}