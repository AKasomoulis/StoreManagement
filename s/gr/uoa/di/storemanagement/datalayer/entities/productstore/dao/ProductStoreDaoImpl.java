package gr.uoa.di.storemanagement.datalayer.entities.productstore.dao;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStorePK;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class ProductStoreDaoImpl extends JpaDao<ProductStore, ProductStorePK> implements ProductStoreDao {

	public List<Object[]> getProductsFromStore(String storeName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT p.productName, p.serialNumber FROM ProductStore p WHERE p.storeName = :name";
			query = entityManager.createQuery(queryString);

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

		return result;	
	}

	public List<Object[]> getStoresWithProduct(ProductPK productPK) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT s.storeName FROM ProductStore s WHERE s.productName = :name AND s.serialNumber = :serialNumber";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productPK.getName());
			query.setParameter("serialNumber", productPK.getSerialNumber());

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

	public List<ProductStore> getEverythingFromStore(String storeName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductStore> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductStore p WHERE p.storeName = :name";
			query = entityManager.createQuery(queryString);

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

		return result;	
	}

	public List<ProductStore> getEverythingFromProduct(ProductPK productPK) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductStore> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductStore s WHERE s.productName = :name AND s.serialNumber = :serialNumber";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productPK.getName());
			query.setParameter("serialNumber", productPK.getSerialNumber());

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
	
	public List<ProductStore> getEverythingFromProductWithSupplier(ProductPK productPK, String supplierName) {
		return getEverythingFromProductWithSupplier(productPK.getName(), productPK.getSerialNumber(), supplierName);
	}
	
	public List<ProductStore> getEverythingFromProductWithSupplier(String productName, String serialNumber, String supplierName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductStore> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductStore s WHERE s.productName = :name AND s.serialNumber = :serialNumber AND s.supplierName = :supplierName";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productName);
			query.setParameter("serialNumber", serialNumber);
			query.setParameter("supplierName", supplierName);

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


	public Long numberOfStoresWithThisProduct(ProductPK productPK) {
		return numberOfStoresWithThisProduct(productPK.getName(), productPK.getSerialNumber());
	}

	public Long numberOfStoresWithThisProduct(String productName, String serialNumber) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT COUNT(*) FROM ProductStore s WHERE s.productName = :name AND s.serialNumber = :serialNumber";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productName);
			query.setParameter("serialNumber", serialNumber);

			result = query.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}

		if (result == null) {
			result = new ArrayList<Long>();
			result.add((long) 0);
		}
		
		return result.get(0);	
	}

	public Long numberOfStoresWithThisProductAndThisSupplier(String productName, String serialNumber, String supplierName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT COUNT(*) FROM ProductStore s WHERE s.productName = :name AND s.serialNumber = :serialNumber AND s.supplierName = :supplierName";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productName);
			query.setParameter("serialNumber", serialNumber);
			query.setParameter("supplierName", supplierName);

			result = query.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e;
		} finally {
			entityManager.close();
		}

		if (result == null) {
			result = new ArrayList<Long>();
			result.add((long) 0);
		}
		
		return result.get(0);	
	}

	public void deleteEverythingWithThisProductAndThisSupplier(String productName, String serialNumber, String supplierName) {
		ProductPK pk = new ProductPK();
		pk.setName(productName);
		pk.setSerialNumber(serialNumber);
		
		List<ProductStore> pList = this.getEverythingFromProductWithSupplier(pk, supplierName);
		
		for (ProductStore p : pList) {
			this.delete(p);
		}
	}

	public void deleteIt(String productName, String serialNumber, String storeName) {
		ProductStorePK pk = new ProductStorePK();
		pk.setProductName(productName);
		pk.setSerialNumber(serialNumber);
		pk.setStoreName(storeName);
		
		
	}

}
