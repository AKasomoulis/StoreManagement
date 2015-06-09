package gr.uoa.di.storemanagement.rights;

import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;

import java.util.Random;

public class SupplierVerificationCode {
	
	private static SupplierDaoImpl supDao = new SupplierDaoImpl();
	private static Random generator;
	private static Supplier sup;
	
	public static String randomVerificationCode() {
		StringBuilder code = new StringBuilder();
		char c;

		generator = new Random();
		
		for(int i = 0; i != 15; ++i) {
			c = (char) (generator.nextInt(93) + 33);
			code.append(c);			
		}
		
		return code.toString();
	}
	
	public static void generate(String supplierName) {
		sup = supDao.read(supplierName);
		sup.setVerificationCode(randomVerificationCode());
			
		supDao.update(sup);
	}
	
	public static String emailVerificationCode() {
		StringBuilder code = new StringBuilder();
		char c;

		generator = new Random();
		
		for(int i = 0; i != 23; ++i) {
			c = (char) (generator.nextInt(25) + 97);
			code.append(c);			
		}
		
		return code.toString();
	}
	
}
