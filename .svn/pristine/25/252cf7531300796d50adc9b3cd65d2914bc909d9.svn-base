package gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao;


import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplierPK;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class ProductSupplierDaoImpl extends JpaDao<ProductSupplier, ProductSupplierPK> implements ProductSupplierDao {
	
	/* Get supplier's products*/
	public List<Object[]> getProductsFromSupplier(String suppName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT supprl.productName, supprl.serialNumber FROM ProductSupplier supprl WHERE supprl.supplierName = :name";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", suppName);

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

	public List<ProductSupplier> getEverythingFromSupplier(String supplierName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductSupplier> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductSupplier p WHERE p.supplierName = :name";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", supplierName);

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

	public List<ProductSupplier> getEverythingFromProduct(ProductPK productPK) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductSupplier> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductSupplier s WHERE s.productName = :name AND s.serialNumber = :serialNumber";
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

	public void deleteIt(String productName, String serialNumber) {
		List<ProductSupplier> pList;
		ProductPK pk = new ProductPK();
		
		pk.setName(productName);
		pk.setSerialNumber(serialNumber);
		
		pList = this.getEverythingFromProduct(pk);
		
		if (!pList.isEmpty()) {
			
			for (ProductSupplier p : pList) {
				this.delete(p);
			}
						
		}
	}
	
	public void deleteIt(String productName, String serialNumber, String supplierName) {
		ProductSupplierPK pk = new ProductSupplierPK();
		pk.setProductName(productName);
		pk.setSerialNumber(serialNumber);
		pk.setSupplierName(supplierName);
		
		this.delete(this.read(pk));
	}

	public Long numberOfSuppliersWithThisProduct(String productName, String serialNumber) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Long> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT COUNT(*) FROM ProductSupplier s WHERE s.productName = :name AND s.serialNumber = :serialNumber";
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

	public List<Object[]> searchBySupplier(String searchQuery) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Object[]> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			  			
			queryString = "SELECT DISTINCT pr.name, pr.serialNumber, pr.description " +
					"FROM Product pr, ProductStore pst " +
					"WHERE pr.serialNumber = pst.serialNumber AND pr.name = pst.productName AND pst.supplierName LIKE :supplierName";
			query = entityManager.createQuery(queryString);
			
			query.setParameter("supplierName", "%" + searchQuery + "%");

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

	public int getProductPriceFromSupplier(String productName, String productSerialNumber, String supplierName) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<Integer> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "SELECT s.price FROM ProductSupplier s WHERE s.productName = :name AND s.serialNumber = :serialNumber AND s.supplierName = :supplierName";
			query = entityManager.createQuery(queryString);

			query.setParameter("name", productName);
			query.setParameter("serialNumber", productSerialNumber);
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

		return result.get(0);
	}

	public void setProductPriceFromSupplier(String productName, String serialNumber, String supplierName, int supplierPrice) {
		ProductSupplier p = this.readIt(productName, serialNumber, supplierName);
		
		p.setPrice(supplierPrice);
		
		this.update(p);
	}

	public ProductSupplier readIt(String productName, String serialNumber, String supplierName) {
		ProductSupplierPK pk = new ProductSupplierPK();
		pk.setProductName(productName);
		pk.setSerialNumber(serialNumber);
		pk.setSupplierName(supplierName);
		
		return this.read(pk);
	}

}
