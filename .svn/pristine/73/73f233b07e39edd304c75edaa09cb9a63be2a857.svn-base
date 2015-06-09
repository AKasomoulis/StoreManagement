package gr.uoa.di.storemanagement.datalayer.entities.productuser.dao;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.productuser.ProductUser;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class ProductUserDaoImpl extends JpaDao<ProductUser, Integer> implements ProductUserDao {

	public boolean orderExists(ProductUser order) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<ProductUser> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM ProductUser pru WHERE pru.username = :name AND pru.productName = :prname AND pru.serialNumber = :prserial";
			query = entityManager.createQuery(queryString, ProductUser.class);

			query.setParameter("name", order.getUsername());
			query.setParameter("prname", order.getProductName());
			query.setParameter("prserial", order.getSerialNumber());

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
