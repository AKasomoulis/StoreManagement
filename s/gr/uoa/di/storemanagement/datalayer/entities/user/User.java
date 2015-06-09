package gr.uoa.di.storemanagement.datalayer.entities.user;

import gr.uoa.di.storemanagement.datalayer.entities.role.Role;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User {

	@Id
	@Column(name = "US_Username", nullable = false, length = 45)
	private String username;

	@Column(name = "US_Password", nullable = false, length = 45)
	private String password;

	@Column(name = "US_Firstname", nullable = false, length = 45)
	private String firstName;

	@Column(name = "US_Lastname", nullable = false, length = 45)
	private String lastName;

	@Column(name = "US_Email", nullable = false, length = 45)
	private String email;

	@ManyToOne
	@JoinColumn(name = "ROL_Name")
	private Role role;

	public User() {
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}