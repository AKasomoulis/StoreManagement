package gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.dao;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLink;
import gr.uoa.di.storemanagement.datalayer.entities.storeproductlink.StoreProductLinkPK;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class StoreProductLinkDaoImpl extends JpaDao<StoreProductLink, StoreProductLinkPK> implements StoreProductLinkDao{

	/* Get all store's products*/
	public List<Object[]> getProductsFromStore(String storeName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT stprl.productName, stprl.productSerialNumber FROM StoreProductLink stprl WHERE stprl.storeName = :name";
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

	/* Get stores with a product*/
	public List<Object[]> getStoresWithProduct(ProductPK productPK) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT s.storeName FROM StoreProductLink s WHERE s.productName = :name AND s.productSerialNumber = :serialNumber";
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

}

