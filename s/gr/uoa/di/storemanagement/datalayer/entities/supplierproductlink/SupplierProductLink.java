package gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@IdClass(SupplierProductLinkPK.class)
@Table(name = "SupplierProductLink")
public class SupplierProductLink {

	@Id
	private String supplierName;

	@Id
	private String productName;

	@Id
	private String productSerialNumber;
	
	
	@Column(name = "price")
	private int price;
	

	@ManyToOne
	@JoinColumn(name = "supplierName", updatable = false, insertable = false, referencedColumnName = "SUP_Name")
	private Supplier supplier;

	@ManyToOne
	@JoinColumns(value = {
			@JoinColumn(name = "productName", updatable = false, insertable = false, referencedColumnName = "PR_Name"),
			@JoinColumn(name = "productSerialNumber", updatable = false, insertable = false, referencedColumnName = "PR_Serialnumber") })
	private Product product;

	public SupplierProductLink() {
		
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductSerialNumber() {
		return productSerialNumber;
	}

	public void setProductSerialNumber(String productSerialNumber) {
		this.productSerialNumber = productSerialNumber;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public boolean equals(Object other) {
		
		if (this == other)
	        return true;
	    if (!(other instanceof SupplierProductLink))
	        return false;
	    SupplierProductLink castOther = (SupplierProductLink) other;
	    return supplierName.equals(castOther.supplierName) && 
	    		productName.equals(castOther.productName) && 
	    		productSerialNumber == castOther.productSerialNumber;

	}

}
