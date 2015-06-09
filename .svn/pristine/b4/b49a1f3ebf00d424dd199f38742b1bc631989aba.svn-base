package gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;

public class LastMovementsDaoImpl extends JpaDao<LastMovements, Integer> implements LastMovementsDao {

	public List<LastMovements> getLastMovementsByProduct(String productName, String serialNumber, int num) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<LastMovements> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			  			
			queryString = "FROM LastMovements l " +
					"WHERE l.productName = :productName AND l.serialNumber = :serialNumber " +
					"ORDER BY l.time desc";
			query = entityManager.createQuery(queryString);
			
			query.setParameter("productName", productName);
			query.setParameter("serialNumber", serialNumber);
			
			query.setMaxResults(num);

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

	public List<LastMovements> getLastMovementsByStore(String storeName, int num) { // TODO Auto-generated method stub
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<LastMovements> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			  			
			queryString = "FROM LastMovements l " +
					"WHERE l.fromStore = :storeName OR l.toStore = :storeName " +
					"ORDER BY l.time desc";
			query = entityManager.createQuery(queryString);
			
			query.setParameter("storeName", storeName);
			
			query.setMaxResults(num);

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

	public List<LastMovements> getLastMovementsBySupplier(String supplierName, int num) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<LastMovements> getLastMovementsByKindOfMovements(String kind, int num) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<LastMovements> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			  			
			queryString = "FROM LastMovements l " +
					"WHERE l.kindOfMovement = :kind " +
					"ORDER BY l.time desc";
			query = entityManager.createQuery(queryString);
			
			query.setParameter("kind", kind);
			
			query.setMaxResults(num);

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

}
