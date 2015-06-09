package gr.uoa.di.storemanagement.datalayer;

import gr.uoa.di.storemanagement.context.Context;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DataLayer {
	private static String persistenceUnitName = "gr.uoa.di.storemanagement";

	private static EntityManagerFactory factory = null;

	private DataLayer() {
	}

	public synchronized static EntityManager getEntityManager() {
			if (factory == null) {
				factory = Persistence.createEntityManagerFactory(persistenceUnitName);
				Context.createAdmin();
			}
			return factory.createEntityManager();
	}
}
