package gr.uoa.di.storemanagement.datalayer.entities.user.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;

import java.util.List;

public interface UserDao  extends Dao<User, String> {
	public boolean userExists(User us);
	public boolean userExists(String username);
	public boolean checkPassForUser(String username, String password);
	public boolean isAdmin(String username);

	public List<Object[]> getAllUsers();
	public List<Object[]> getUserByRole(String role);
	
	public Long getNumberOfTotalUsers();
}
