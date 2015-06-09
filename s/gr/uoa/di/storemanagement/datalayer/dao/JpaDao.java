package gr.uoa.di.storemanagement.datalayer.dao;

import gr.uoa.di.storemanagement.datalayer.DataLayer;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class JpaDao<T, PK extends Serializable> implements Dao<T, PK> 
{

	protected Class<T> entityClass;
	
	//@PersistenceContext
	protected EntityManager entityManager;
	
	public JpaDao() 
	{
	    ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
	    this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
	}
	
	public T create(T t) 
	{
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;

		try
		{
			tx = entityManager.getTransaction();
			tx.begin();
			entityManager.persist(t);
			tx.commit();
		}catch(RuntimeException e)
		{
			if(tx != null && tx.isActive()) tx.rollback();
			throw e;
		}finally
		{
			entityManager.close();
		}
		
	    return t;
	}
	
	public T read(PK id) 
	{
		EntityManager entityManager = DataLayer.getEntityManager();
		T t = null;
		
		EntityTransaction tx = null;
		
		try
		{
			tx = entityManager.getTransaction();
			tx.begin();
		    t = entityManager.find(entityClass, id);
		    tx.commit();
		}catch(RuntimeException e)
		{
			if(tx != null && tx.isActive()) tx.rollback();
			throw e;
		}finally
		{
			entityManager.close();
		}
		
	    return t;
	}
	
	public T update(T t) 
	{
		EntityManager entityManager = DataLayer.getEntityManager();
		T t1 = null;
		
		EntityTransaction tx = null;
		
		try
		{
			tx = entityManager.getTransaction();
			tx.begin();
			t1 = entityManager.merge(t);
			tx.commit();
		}catch(RuntimeException e)
		{
			if(tx != null && tx.isActive()) tx.rollback();
			throw e;
		}finally
		{
			entityManager.close();
		}
	
	    return t1;
	}
	
	public void delete(T t) 
	{
		EntityManager entityManager = DataLayer.getEntityManager();

		EntityTransaction tx = null;
		
		try
		{
			tx = entityManager.getTransaction();
			tx.begin();
			t = entityManager.merge(t);
			entityManager.remove(t);
			tx.commit();
		}catch(RuntimeException e)
		{
			if(tx != null && tx.isActive()) tx.rollback();
			throw e;
		}finally
		{
			entityManager.close();
		}
	}

}