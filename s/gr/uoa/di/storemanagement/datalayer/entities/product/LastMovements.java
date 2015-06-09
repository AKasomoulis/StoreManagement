package gr.uoa.di.storemanagement.datalayer.entities.product;

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
@Table(name = "LastMovements")
public class LastMovements {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="my_entity_seq_gen")
	@SequenceGenerator(name="my_entity_seq_gen", sequenceName="MY_ENTITY_SEQ")
	@Column(name = "LM_Id")
	private int id;

	@Column(name = "LM_SerialNumber", nullable = false, length = 45)
	private String serialNumber;

	@Column(name = "LM_ProductName", nullable = false, length = 45)
	private String productName;
	
	@Column(name = "LM_FromStore", nullable = false, length = 45)
	private String fromStore;
	
	@Column(name = "LM_ToStore", nullable = false, length = 45)
	private String toStore;
	
	@Column(name = "LM_KindOfMovement", nullable = false, length = 45)
	private String kindOfMovement;

	@Column(name = "LM_Quantity")
	private int quantity;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LM_Time", nullable=false)
	private Date time = null;
	
	public void LastMovements() {

	}

	public int getId() {
		return id;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public String getProductName() {
		return productName;
	}

	public String getFromStore() {
		return fromStore;
	}

	public String getToStore() {
		return toStore;
	}

	public String getKindOfMovement() {
		return kindOfMovement;
	}

	public Date getTime() {
		return time;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setFromStore(String fromStore) {
		this.fromStore = fromStore;
	}

	public void setToStore(String toStore) {
		this.toStore = toStore;
	}

	public void setKindOfMovement(String kindOfMovement) {
		this.kindOfMovement = kindOfMovement;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
