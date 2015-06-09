package gr.uoa.di.storemanagement.datalayer.entities.lastmovements.dao;

import gr.uoa.di.storemanagement.datalayer.dao.Dao;
import gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements;

import java.util.List;

public interface LastMovementsDao  extends Dao<LastMovements, Integer> {
	public List<LastMovements> getLastMovementsByProduct(String productName, String serialNumber, int num);
	public List<LastMovements> getLastMovementsByStore(String storeName, int num);
	public List<LastMovements> getLastMovementsBySupplier(String supplierName, int num);
	public List<LastMovements> getLastMovementsByKindOfMovements(String kind, int num);

}
