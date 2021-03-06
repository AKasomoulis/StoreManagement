package gr.uoa.di.storemanagement.datalayer.entities.userSupplierDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.dao.JpaDao;
import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserSupplier;

public class UserSupplierDaoImpl extends JpaDao<UserSupplier, String> implements UserSupplierDao {
	
	/* Check if a supplier representative exists in database*/
	public boolean UserSuppExists(String username) {
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		List<UserSupplier> result = null;
		String queryString;
		Query query;

		try {
			tx = entityManager.getTransaction();
			tx.begin();
			
			queryString = "FROM UserSupplier ussp WHERE ussp.username = :name";
			query = entityManager.createQuery(queryString, UserSupplier.class);

			query.setParameter("name", username);

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
