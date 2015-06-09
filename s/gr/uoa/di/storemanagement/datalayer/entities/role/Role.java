package gr.uoa.di.storemanagement.datalayer.entities.role;

import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
public class Role {

	@Id
	@Column(name = "ROL_Name", nullable = false, length = 45)
	private String name;

	@Column(name = "ROL_Rights")
	private int rights;
	
	@OneToMany(targetEntity=UserForApproval.class, mappedBy="role",
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<UserForApproval> usersForApproval = new ArrayList<UserForApproval>();
//	
//	@OneToMany(targetEntity=User.class, mappedBy="role",
//			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
//	private List<User> users = new ArrayList<User>();
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	  @JoinTable
	  (
	      name="UserRoleLink",
	      joinColumns={ @JoinColumn(name="ROL_Name", referencedColumnName="ROL_Name")},
	      inverseJoinColumns={ @JoinColumn(name="US_Username", referencedColumnName="US_Username", unique=true) }
	  )
	  private List<User> users = new ArrayList<User>();
	
//	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
//	  @JoinTable
//	  (
//	      name="UserForApprovalLink",
//	      joinColumns={ @JoinColumn(name="ROL_name", referencedColumnName="ROL_name")},
//	      inverseJoinColumns={ @JoinColumn(name="UFA_Username", referencedColumnName="UFA_Username", unique=true) }
//	  )
//	  private List<UserForApproval> usersForApproval = new ArrayList<UserForApproval>();

	public Role() {
	}

	public String getRoleName() {
		return name;
	}

	public void setRoleName(String name) {
		this.name = name;
	}

	public int getRights() {
		return rights;
	}

	public void setRights(int rights) {
		this.rights = rights;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<UserForApproval> getUsersForApproval() {
		return usersForApproval;
	}

	public void setUsersForApproval(List<UserForApproval> usersForApproval) {
		this.usersForApproval = usersForApproval;
	}
	
	
}
