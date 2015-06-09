package gr.uoa.di.storemanagement.datalayer.entities.store.dao;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;

import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class StoreDaoImpl extends JpaDao<Store, String> implements StoreDao {

	Logger log = LoggerFactory.getLogger(StoreDaoImpl.class);
	
	/* Check if store exists in database*/
	public boolean storeExists(Store st) {
		return storeExists(st.getName());
	}
	
	/* Check if store exists in database*/
	public boolean storeExists(String storeName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Product> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM Store st WHERE st.name = :name";
			query = entityManager.createQuery(queryString, Store.class);

			query.setParameter("name", storeName);

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

	/* Get name and location of all stores*/
	public List<Object[]> getAllStores() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT st.name, st.location FROM Store st";
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

	/* Get name of all stores*/
	public List<String> getAllStoreNames() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<String> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT st.name FROM Store st";
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

	public Long getNumberOfAllStores() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT COUNT(st.name) FROM Store st";
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

	public Long getNumberOfOpenedStores() {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();

			queryString = "SELECT COUNT(st.name) FROM Store st WHERE st.isOpen = 1";
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