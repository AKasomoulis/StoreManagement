package gr.uoa.di.storemanagement.datalayer.entities.storeproductlink;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(StoreProductLinkPK.class)
@Table(name = "StoreProductLink")
public class StoreProductLink {

	@Id
	private String storeName;

	@Id
	private String productName;

	@Id
	private String productSerialNumber;

	@Column(name = "quantity")
	private int quantity;

	@Column(name = "lt")
	private String lt;

	@ManyToOne
	@JoinColumn(name = "storeName", updatable = false, insertable = false, referencedColumnName = "ST_Name")
	private Store store;

	@ManyToOne
	@JoinColumns(value = {
			@JoinColumn(name = "productName", updatable = false, insertable = false, referencedColumnName = "PR_Name"),
			@JoinColumn(name = "productSerialNumber", updatable = false, insertable = false, referencedColumnName = "PR_Serialnumber") })
	private Product product;

	public StoreProductLink() {

	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
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

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getLt() {
		return lt;
	}

	public void setLt(String lt) {
		this.lt = lt;
	}

	@Override
	public boolean equals(Object other) {

		if (this == other)
	        return true;
	    if (!(other instanceof StoreProductLink))
	        return false;
	    StoreProductLink castOther = (StoreProductLink) other;
	    return storeName.equals(castOther.storeName) && 
	    		productName.equals(castOther.productName) && 
	    		productSerialNumber.equals(castOther.productSerialNumber);

	}
	
}
