package gr.uoa.di.storemanagement.datalayer.entities.storeproductlink;

import java.io.Serializable;

public class StoreProductLinkPK implements Serializable
{
	private static final long serialVersionUID = 7248177294975403198L;
	
	private String storeName = null;
	private String productName = null;
	private String productSerialNumber = null;
	
	@Override
	public boolean equals(Object other)
	{
		if (this == other)
	        return true;
	    if (!(other instanceof StoreProductLinkPK))
	        return false;
	    StoreProductLinkPK castOther = (StoreProductLinkPK) other;
	    System.out.println("name1: " + storeName + " - name2: " + castOther.storeName);
	    System.out.println("productname1: " + productName + " - productname2: " + castOther.productName);
	    System.out.println("s/n1: " + productSerialNumber + " - s/s2: " + castOther.productSerialNumber);
	    return storeName.equals(castOther.storeName) && 
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

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setProductSerialNumber(String productSerialNumber) {
		this.productSerialNumber = productSerialNumber;
	}
}