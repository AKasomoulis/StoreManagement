package gr.uoa.di.storemanagement.datalayer.entities.supplier;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.supplierproductlink.SupplierProductLink;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Supplier")
public class Supplier {
	
	@Id
	@Column(name = "SUP_Name", nullable = false)
	private String name;
	
	@Column(name = "SUP_Address", nullable = false, length = 45)
	private String address;
	
	@Column(name = "SUP_Description", nullable = false, length = 255)
	private String description;

	@Column(name = "SUP_VerificationCode", nullable = false, length = 15)
	private String verificationCode;
				   
	
//	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE, CascadeType.REMOVE, CascadeType.REFRESH }, mappedBy = "supplier")
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy="supplier")
	private List<SupplierProductLink> products = new ArrayList<SupplierProductLink>();
	
	public void Supplier() {
		
	}
	
	public void addProduct(Product pr, int price) {
		SupplierProductLink link = new SupplierProductLink();

		link.setProduct(pr);
		link.setSupplier(this);
		link.setSupplierName(this.getCompanyName());
		link.setProductName(pr.getName());
		link.setProductSerialNumber(pr.getSerialNumber());
		link.setPrice(price);

		this.products.add(link);
		pr.getSuppliers().add(link);
	}

	public void removeProduct(Product pr) {
		SupplierProductLink link = new SupplierProductLink();

		link.setProduct(pr);
		link.setSupplier(this);
		link.setSupplierName(this.getCompanyName());
		link.setProductName(pr.getName());
		link.setProductSerialNumber(pr.getSerialNumber());

		this.products.remove(link);
		pr.getSuppliers().remove(link);
	}
	

	public String getCompanyName() {
		return name;
	}

	public void setCompanyName(String companyName) {
		this.name = companyName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<SupplierProductLink> getSuppliers() {
		return products;
	}

	public void setSuppliers(List<SupplierProductLink> products) {
		this.products = products;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

}
