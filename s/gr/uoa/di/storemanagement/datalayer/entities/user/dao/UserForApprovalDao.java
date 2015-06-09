package gr.uoa.di.storemanagement.datalayer.entities.user.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;

import java.util.List;
import java.util.UUID;


public interface UserForApprovalDao  extends Dao<UserForApproval, String> {
	public boolean userExists(UserForApproval usfa);
	public boolean userExists(String username);
	public boolean checkPassForUserApproval(String username, String password);
	public List<Object[]> getAllUsers();
}
