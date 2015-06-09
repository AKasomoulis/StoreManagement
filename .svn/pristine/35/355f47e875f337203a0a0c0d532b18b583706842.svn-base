package gr.uoa.di.storemanagement.datalayer.entities.productsupplier;

import java.io.Serializable;

public class ProductSupplierPK  implements Serializable {
	private String productName = null;
	private String supplierName = null;
	private String serialNumber = null;
	
	@Override
	public boolean equals(Object other)
	{
		if (this == other)
	        return true;
	    if (!(other instanceof ProductSupplierPK))
	        return false;
	    ProductSupplierPK castOther = (ProductSupplierPK) other;
	    return (productName.equals(castOther.productName)) && (serialNumber.equals(castOther.serialNumber)) && (supplierName.equals(castOther.supplierName));
	}
	
	@Override
	public int hashCode() 
	{
	    final int prime = 31;
	    int hash = 17;
	    hash = hash * prime + this.productName.hashCode();
	    hash = hash * prime + this.supplierName.hashCode();
	    hash = hash * prime + this.serialNumber.hashCode();
	    return hash;
	}
	
	public ProductSupplierPK() {
		
	}

	public String getProductName() {
		return productName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

}
