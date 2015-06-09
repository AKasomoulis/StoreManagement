package gr.uoa.di.storemanagement.datalayer.entities.role.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;

public class RoleDaoImpl extends JpaDao<Role, String> implements RoleDao {

	/* Get name of all roles*/
	public List<String> getAllRoles() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<String> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT role.name FROM Role role";
			query = entityManager.createQuery(queryString);

			result = query.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}
		return result;
	}

	/* Check if roles exists in database*/
	public boolean roleExists(String roleName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Role> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM Role rl WHERE rl.name = :name";
			query = entityManager.createQuery(queryString, Role.class);

			query.setParameter("name", roleName);

			result = query.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}

		return !result.isEmpty();	
		
	}

}
