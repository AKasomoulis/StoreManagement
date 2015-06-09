package gr.uoa.di.storemanagement.datalayer.dao;

import java.io.Serializable;

public interface Dao<T, PK extends Serializable> 
{
    public T create(T t);
    public T read(PK id);
    public T update(T t);
    public void delete(T t);
}
