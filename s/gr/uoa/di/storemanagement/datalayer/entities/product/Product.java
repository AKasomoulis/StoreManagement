package gr.uoa.di.storemanagement.datalayer.entities.product;

import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink.SupplierProductLink;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@IdClass(ProductPK.class)
@Table(name = "Product")
public class Product {
	@Id
	@Column(name = "PR_Name", nullable = false, length = 45)
	private String name;

	@Id
	@Column(name = "PR_SerialNumber", nullable = false, length = 45)
	private String serialNumber;

	@Column(name = "PR_Description", nullable = false, length = 100)
	private String description;

	@Column(name = "PR_Type", nullable = true, length = 15)
	private String type;
	@Column(name = "PR_Weight", nullable = true)
	private int weight;
	@Column(name = "PR_Dimensions", nullable = true)
	private int dimensions;
	@Column(name = "PR_Mass", nullable = true)
	private int mass;
	@Column(name = "PR_Quantity", nullable = true)
	private int quantity;
	@Column(name = "PR_Price", nullable = true)
	private double price;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy="product")
//	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH }, mappedBy = "product")
//	 @OneToMany(fetch = FetchType.LAZY, mappedBy="product")
	// @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	// @OneToMany( mappedBy="product")
	private Set<StoreProductLink> stores = new HashSet<StoreProductLink>();
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "product")
//	@OneToMany(cascade = { CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH }, mappedBy = "product")
//	@IndexColumn(name="supplierName")
	private Set<SupplierProductLink> suppliers = new HashSet<SupplierProductLink>();

	public Product() {

	}

	public Set<SupplierProductLink> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(Set<SupplierProductLink> suppliers) {
		this.suppliers = suppliers;
	}

	public Set<StoreProductLink> getStores() {
		return stores;
	}

	public void setStores(Set<StoreProductLink> stores) {
		this.stores = stores;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serial_number) {
		this.serialNumber = serial_number;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getDimensions() {
		return dimensions;
	}

	public void setDimensions(int dimensions) {
		this.dimensions = dimensions;
	}

	public int getMass() {
		return mass;
	}

	public void setMass(int mass) {
		this.mass = mass;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}