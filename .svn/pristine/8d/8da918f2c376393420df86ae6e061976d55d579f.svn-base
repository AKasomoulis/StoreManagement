package gr.uoa.di.storemanagement.datalayer.entities.productstore;

import java.io.Serializable;

public class ProductStorePK implements Serializable {
	private static final long serialVersionUID = 1L;

	private String productName = null;
	private String storeName = null;
	private String serialNumber = null;
	

	@Override
	public boolean equals(Object other)
	{
		if (this == other)
	        return true;
	    if (!(other instanceof ProductStorePK))
	        return false;
	    ProductStorePK castOther = (ProductStorePK) other;
	    return (productName.equals(castOther.productName)) && (serialNumber.equals(castOther.serialNumber)) && (storeName.equals(castOther.storeName));
	}
	
	@Override
	public int hashCode() 
	{
	    final int prime = 31;
	    int hash = 17;
	    hash = hash * prime + this.productName.hashCode();
	    hash = hash * prime + this.storeName.hashCode();
	    hash = hash * prime + this.serialNumber.hashCode();
	    return hash;
	}

	public String getProductName() {
		return productName;
	}

	public String getStoreName() {
		return storeName;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

}
