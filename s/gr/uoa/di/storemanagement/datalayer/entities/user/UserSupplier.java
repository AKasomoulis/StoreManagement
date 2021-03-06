package gr.uoa.di.storemanagement.datalayer.entities.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "UserSupplier")
public class UserSupplier {
	
	@Id
	@Column(name = "USSP_Username", nullable = true)
	private String username;

	@Column(name = "USSP_SupplierName", nullable = true)
	private String supplierName;
	
	public UserSupplier() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

}
