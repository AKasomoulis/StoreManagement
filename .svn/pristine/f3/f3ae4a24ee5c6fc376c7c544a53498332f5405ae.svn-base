package gr.uoa.di.storemanagement.datalayer.entities.productsupplier;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(ProductSupplierPK.class)
@Table(name = "ProductSupplier")
public class ProductSupplier {
	
	@Id
	@Column(name = "PSU_PName", nullable = false, length = 45)
	private String productName;

	@Id
	@Column(name = "PSU_PSerialNumber", nullable = false, length = 45)
	private String serialNumber;

	@Id
	@Column(name = "PSU_SName", nullable = false, length = 100)
	private String supplierName;
	
	@Column(name = "PSU_Price")
	private int price;
	
	public ProductSupplier() {
		
	}

	public String getProductName() {
		return productName;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public int getPrice() {
		return price;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
