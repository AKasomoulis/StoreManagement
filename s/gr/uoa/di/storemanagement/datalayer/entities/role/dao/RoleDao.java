package gr.uoa.di.storemanagement.datalayer.entities.role.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.role.Role;

import java.util.List;


public interface RoleDao extends Dao<Role, String> {
	public List<String> getAllRoles();
	public boolean roleExists(String roleName);
}
