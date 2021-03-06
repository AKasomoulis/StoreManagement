package gr.uoa.di.storemanagement.datalayer.entities.product;


import java.io.Serializable;


public class ProductPK implements Serializable
{
	private static final long serialVersionUID = 7248177294975403198L;
	
	private String name = null;
	private String serialNumber = null;
	
	@Override
	public boolean equals(Object other)
	{
		if (this == other)
	        return true;
	    if (!(other instanceof ProductPK))
	        return false;
	    ProductPK castOther = (ProductPK) other;
	    return name.equals(castOther.name) && (serialNumber.equals(castOther.serialNumber));
	}
	
	@Override
	public int hashCode() 
	{
	    final int prime = 31;
	    int hash = 17;
	    hash = hash * prime + this.name.hashCode();
	    hash = hash * prime + this.serialNumber.hashCode();
	    return hash;
	}

	public String getName() {
		return name;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
}