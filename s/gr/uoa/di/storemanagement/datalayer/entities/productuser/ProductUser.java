package gr.uoa.di.storemanagement.datalayer.entities.productuser;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "ProductUser")
public class ProductUser {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="my_entity_seq_gen1")
	@SequenceGenerator(name="my_entity_seq_gen1", sequenceName="MY_ENTITY_SEQ1")
	@Column(name = "PRU_Id")
	private int id;
	
	@Column(name = "PRU_Order", nullable = true)
	private int order;
	
	@Column(name = "PRU_Username", nullable = false, length = 45)
	private String username;
	
	@Column(name = "PRU_Name", nullable = false, length = 45)
	private String productName;

	@Column(name = "PRU_SerialNumber", nullable = false, length = 45)
	private String serialNumber;
	
	@Column(name = "PRU_Quantity", nullable = true)
	private int quantity;
	
	@Column(name = "PRU_Price", nullable = true)
	private double price;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="PRU_Time", nullable=false)
	private Date time = null;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	
	
	

}
