package gr.uoa.di.storemanagement.datalayer.entities.user.dao;

import gr.uoa.di.storemanagement.context.Context;
import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserDaoImpl extends JpaDao<User, String> implements UserDao {

	Logger log = LoggerFactory.getLogger(UserDaoImpl.class);

	/* Check if user exists in database*/
	public boolean userExists(User us) {
		return userExists(us.getUsername());
	}

	/* Check if user exists in database*/
	public boolean userExists(String username) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<User> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "FROM User us " + "WHERE us.username = :username";
			query = entityManager.createQuery(queryString);

			query.setParameter("username", username);

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

	/* Check if user's password is valid*/
	public boolean checkPassForUser(String username, String password) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<String> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT us.password FROM User us WHERE us.username = :username";
			query = entityManager.createQuery(queryString);

			query.setParameter("username", username);

			result = query.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}
		
		if (!result.isEmpty()) {
			return result.get(0).equals(password);
		}

		return false;
	}

	/* Check if user is administrator*/
	public boolean isAdmin(String username) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Role> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT us.role FROM User us WHERE us.username = :username";
			query = entityManager.createQuery(queryString);

			query.setParameter("username", username);

			result = query.getResultList();
			
			if (!result.isEmpty()) {
				return result.get(0).getRoleName().equals(Context.getAdminRoleName());
			}

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}
		
		return false;
	}

	
	public List<Object[]> getAllUsers() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT us.username, us.firstName, us.lastName FROM User us";
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

	public List<Object[]> getUserByRole(String role) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT us.username, us.firstName, us.lastName FROM User us WHERE us.role.name = :role";
			query = entityManager.createQuery(queryString);

			query.setParameter("role", role);

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

	public Long getNumberOfTotalUsers() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT COUNT(us.username) FROM User us";
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

		return result.get(0);
	}



}
