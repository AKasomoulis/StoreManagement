package gr.uoa.di.storemanagement.datalayer;

import gr.uoa.di.storemanagement.datalayer.entities.product.Product;
import gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore;
import gr.uoa.di.storemanagement.datalayer.entities.productstore.dao.ProductStoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier;
import gr.uoa.di.storemanagement.datalayer.entities.productsupplier.dao.ProductSupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.role.Role;
import gr.uoa.di.storemanagement.datalayer.entities.store.Store;
import gr.uoa.di.storemanagement.datalayer.entities.store.dao.StoreDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.Supplier;
import gr.uoa.di.storemanagement.datalayer.entities.supplier.dao.SupplierDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Random;

public class Testing {

	private static Random generator = new Random(19081908);

	private static String intToString(int num, int digits) {
		assert digits > 0 : "Invalid number of digits";

		char[] zeros = new char[digits];
		Arrays.fill(zeros, '0');
		DecimalFormat df = new DecimalFormat(String.valueOf(zeros));

		return df.format(num);
	}

	private static String randomSerialNumber() {
		String r = null;

		r = "5" + "-"
				+ intToString(generator.nextInt(1000000), 6)
				+ "-"
				+ intToString(generator.nextInt(1000000), 6);

		return r;
	}

	public static void main(String[] args) {
		UserDaoImpl userDao = new UserDaoImpl();
		ProductDaoImpl prodDao = new ProductDaoImpl();
		SupplierDaoImpl supDao = new SupplierDaoImpl();
		UserForApprovalDaoImpl ufaDao = new UserForApprovalDaoImpl();
		StoreDaoImpl storeDao = new StoreDaoImpl();
		// RoleDaoImpl roleDao = new RoleDaoImpl();

		User us = new User();
		us.setEmail("user1@in.gr");
		us.setFirstName("Karolos");
		us.setLastName("Dimitriou");
		us.setUsername("caroll");
		us.setPassword("7asd7");
		Role role = new Role();
		role.setRights(111);
		role.setRoleName("customer");
		us.setRole(role);
		if (userDao.userExists(us)) {
			userDao.update(us);
		} else {
			userDao.create(us);
		}

		User us2 = new User();
		us2.setEmail("user2@in.gr");
		us2.setFirstName("Giwrgos");
		us2.setLastName("Pavlopoulos");
		us2.setUsername("george");
		us2.setPassword("7ad763");
		Role role1 = new Role();
		role1.setRights(111);
		role1.setRoleName("customer");
		us.setRole(role1);
		if (userDao.userExists(us2)) {
			// userDao.update(us2);
		} else {
			// userDao.create(us2);
		}

		User us3 = new User();
		us3.setEmail("user3@in.gr");
		us3.setFirstName("Giwrgos");
		us3.setLastName("Ioannou");
		us3.setUsername("igeorge");
		us3.setPassword("3ad7f3");
		role1.setRights(111);
		role1.setRoleName("customer");
		us3.setRole(role1);
		if (userDao.userExists(us3)) {
			userDao.update(us3);
		} else {
			userDao.create(us3);
		}

		User us4 = new User();
		us4.setEmail("use4@in.gr");
		us4.setFirstName("Kwstas");
		us4.setLastName("Pavlopoulos");
		us4.setUsername("kostasp");
		us4.setPassword("7ad763");
		role1.setRights(122);
		role1.setRoleName("storekeeper");
		us4.setRole(role1);
		if (userDao.userExists(us4)) {
			userDao.update(us4);
		} else {
			userDao.create(us4);
		}

		User us5 = new User();
		us5.setEmail("user5@in.gr");
		us5.setFirstName("Vasilis");
		us5.setLastName("Gewrgopoulos");
		us5.setUsername("silis");
		us5.setPassword("7asidyq7");
		role1.setRights(111);
		role1.setRoleName("customer");
		us5.setRole(role1);
		if (userDao.userExists(us5)) {
			userDao.update(us5);
		} else {
			userDao.create(us5);
		}

		User us6 = new User();
		us6.setEmail("user6@in.gr");
		us6.setFirstName("Giwrgos");
		us6.setLastName("Tourpetas");
		us6.setUsername("green");
		us6.setPassword("13456gf");
		role1.setRights(111);
		role1.setRoleName("customer");
		us6.setRole(role1);
		if (userDao.userExists(us6)) {
			userDao.update(us6);
		} else {
			userDao.create(us6);
		}

		User us7 = new User();
		us7.setEmail("user7@in.gr");
		us7.setFirstName("Telis");
		us7.setLastName("Kasomoulis");
		us7.setUsername("telis");
		us7.setPassword("asdas");
		role1.setRights(111);
		role1.setRoleName("customer");
		us7.setRole(role1);
		if (userDao.userExists(us7)) {
			userDao.update(us7);
		} else {
			userDao.create(us7);
		}

		User us8 = new User();
		us8.setEmail("user8@in.gr");
		us8.setFirstName("Giannis");
		us8.setLastName("Labrakos");
		us8.setUsername("glbrak");
		us8.setPassword("13sdasdagf");
		role1.setRights(122);
		role1.setRoleName("storekeeper");
		us8.setRole(role1);
		if (userDao.userExists(us8)) {
			userDao.update(us8);
		} else {
			userDao.create(us8);
		}

		User us9 = new User();
		us9.setEmail("user9@in.gr");
		us9.setFirstName("Ioanna");
		us9.setLastName("Swritiou");
		us9.setUsername("joanna");
		us9.setPassword("asdfghy");
		role1.setRights(111);
		role1.setRoleName("customer");
		us9.setRole(role1);
		if (userDao.userExists(us9)) {
			userDao.update(us9);
		} else {
			userDao.create(us9);
		}

		User us10 = new User();
		us10.setEmail("user10@in.gr");
		us10.setFirstName("Sofia");
		us10.setLastName("Stefanakia");
		us10.setUsername("sofiaaa");
		us10.setPassword("342fagf");
		role1.setRights(122);
		role1.setRoleName("storekeeper");
		us10.setRole(role1);
		if (userDao.userExists(us10)) {
			userDao.update(us10);
		} else {
			userDao.create(us10);
		}

		UserForApproval usf1 = new UserForApproval();
		usf1.setEmail("userfa1@in.gr");
		usf1.setFirstName("Petros");
		usf1.setLastName("Kapellas");
		usf1.setUsername("peter");
		usf1.setPassword("7asdsdw7");
		role.setRights(111);
		role.setRoleName("customer");
		usf1.setRole(role);
		if (ufaDao.userExists(usf1)) {
			ufaDao.update(usf1);
		} else {
			ufaDao.create(usf1);
		}

		UserForApproval usf2 = new UserForApproval();
		usf2.setEmail("userfa2@in.gr");
		usf2.setFirstName("Adwnis");
		usf2.setLastName("Petrou");
		usf2.setUsername("anton");
		usf2.setPassword("7asdw7");
		role.setRights(111);
		role.setRoleName("customer");
		usf2.setRole(role);
		if (ufaDao.userExists(usf2)) {
			ufaDao.update(usf2);
		} else {
			ufaDao.create(usf2);
		}

		UserForApproval usf3 = new UserForApproval();
		usf3.setEmail("userfa3@in.gr");
		usf3.setFirstName("Dimitra");
		usf3.setLastName("Sofianou");
		usf3.setUsername("dim");
		usf3.setPassword("aswrg");
		role.setRights(111);
		role.setRoleName("customer");
		usf3.setRole(role);
		if (ufaDao.userExists(usf3)) {
			ufaDao.update(usf3);
		} else {
			ufaDao.create(usf3);
		}

		UserForApproval usf4 = new UserForApproval();
		usf4.setEmail("userfa4@in.gr");
		usf4.setFirstName("Vasilis");
		usf4.setLastName("Megas");
		usf4.setUsername("bill");
		usf4.setPassword("aswrdsfeg");
		role.setRights(122);
		role.setRoleName("storekeeper");
		usf4.setRole(role);
		if (ufaDao.userExists(usf4)) {
			ufaDao.update(usf4);
		} else {
			ufaDao.create(usf4);
		}

		Supplier sup = new Supplier();
		sup.setAddress("Swkratous 4, Athina");
		sup.setCompanyName("OR AE");
		sup.setDescription("Ximoi-Frouta-Anayiktika");
		sup.setVerificationCode("Q.H(0eFf/pe6C#i");
		supDao.create(sup);

		Supplier sup1 = new Supplier();
		sup1.setAddress("Argonaftwn 10, Thessaloniki");
		sup1.setCompanyName("AUTO");
		sup1.setDescription("Aftokinita-Mixanes-Skafi");
		sup1.setVerificationCode("6;7Q.e;ED5a*5#v");
		supDao.create(sup1);

		Supplier sup3 = new Supplier();
		sup3.setAddress("Akadimis 4A, Athina");
		sup3.setCompanyName("GreekOIL");
		sup3.setDescription("Ellinika ladia");
		sup3.setVerificationCode("tcyP52w2+Maq3w1");
		supDao.create(sup3);

		Supplier sup4 = new Supplier();
		sup4.setAddress("Ifaistou 4, Athina");
		sup4.setCompanyName("Gamers");
		sup4.setDescription("Paixnidia gia PCs kai oles tis konsoles");
		sup4.setVerificationCode("NEFyej*VKt]Pzl4");
		supDao.create(sup4);

		Product pa1 = new Product();
		pa1.setDescription("aftokinito");
		pa1.setName("mazda");
		pa1.setSerialNumber(randomSerialNumber());
		pa1.setPrice(15);
		pa1.setQuantity(130);
		prodDao.create(pa1);

		Product pa2 = new Product();
		pa2.setDescription("gala");
		pa2.setName("fage");
		pa2.setSerialNumber(randomSerialNumber());
		pa2.setPrice(30);
		prodDao.create(pa2);

		Product pa3 = new Product();
		pa3.setDescription("gala");
		pa3.setName("olympos");
		pa3.setSerialNumber(randomSerialNumber());
		pa3.setPrice(45);
		prodDao.create(pa3);

		Product pa4 = new Product();
		pa4.setDescription("ladi");
		pa4.setName("oliveOIL");
		pa4.setSerialNumber(randomSerialNumber());
		pa4.setPrice(100);
		prodDao.create(pa4);

		Product pa5 = new Product();
		pa5.setDescription("anayiktiko");
		pa5.setName("coca-cola");
		pa5.setSerialNumber(randomSerialNumber());
		pa5.setPrice(200);
		prodDao.create(pa5);

		Product pa6 = new Product();
		pa6.setDescription("mixani");
		pa6.setName("bmw");
		pa6.setSerialNumber(randomSerialNumber());
		pa6.setPrice(69);
		prodDao.create(pa6);

		Product pa7 = new Product();
		pa7.setDescription("football");
		pa7.setName("pes 2013");
		pa7.setSerialNumber(randomSerialNumber());
		pa7.setPrice(80);
		prodDao.create(pa7);

		Product pa8 = new Product();
		pa8.setDescription("football");
		pa8.setName("fifa 2013");
		pa8.setSerialNumber(randomSerialNumber());
		pa8.setPrice(667);
		prodDao.create(pa8);

		Product pa9 = new Product();
		pa9.setDescription("ladi");
		pa9.setName("altisOIL");
		pa9.setSerialNumber(randomSerialNumber());
		pa9.setPrice(666);
		prodDao.create(pa9);

		Product pa10 = new Product();
		pa10.setDescription("basketball");
		pa10.setName("nba 2013");
		pa10.setSerialNumber(randomSerialNumber());
		pa10.setPrice(1000);
		prodDao.create(pa10);

		Product pa11 = new Product();
		pa11.setDescription("ximos");
		pa11.setName("fanta");
		pa11.setSerialNumber(randomSerialNumber());
		pa11.setPrice(1);
		prodDao.create(pa11);

		Store st = new Store();
		st.setDescription("Cars");
		st.setLocation("Athens");
		st.setName("Iokasti");
		st.setIsOpen(1);
		if (storeDao.storeExists(st)) {
			storeDao.update(st);
		} else {
			storeDao.create(st);
		}

		Store st1 = new Store();
		st1.setDescription("Games");
		st1.setLocation("Volos");
		st1.setName("Sokratis");
		st1.setIsOpen(0);
		if (storeDao.storeExists(st1)) {
			storeDao.update(st1);
		} else {
			storeDao.create(st1);
		}

		Store st2 = new Store();
		st2.setDescription("FROUTA-XIMOI");
		st2.setLocation("Athens");
		st2.setName("Periklis");
		st2.setIsOpen(0);
		if (storeDao.storeExists(st2)) {
			storeDao.update(st2);
		} else {
			storeDao.create(st2);
		}

		Store st3 = new Store();
		st3.setDescription("LADI-FROYTA");
		st3.setLocation("Thessaloniki");
		st3.setName("Adigoni");
		st3.setIsOpen(1);
		if (storeDao.storeExists(st3)) {
			storeDao.update(st3);
		} else {
			storeDao.create(st3);
		}

		Store st4 = new Store();
		st4.setDescription("Games");
		st4.setLocation("Athens");
		st4.setName("Axilleas");
		st4.setIsOpen(1);
		if (storeDao.storeExists(st4)) {
			storeDao.update(st4);
		} else {
			storeDao.create(st4);
		}

		Store st5 = new Store();
		st5.setDescription("Games");
		st5.setLocation("Athens");
		st5.setName("Euridiki");
		st5.setIsOpen(1);
		if (storeDao.storeExists(st5)) {
			storeDao.update(st5);
		} else {
			storeDao.create(st5);
		}

		Store st6 = new Store();
		st6.setDescription("Games");
		st6.setLocation("Athens");
		st6.setName("Perseas");
		st6.setIsOpen(1);
		if (storeDao.storeExists(st6)) {
			storeDao.update(st6);
		} else {
			storeDao.create(st6);
		}

		Store st7 = new Store();
		st7.setDescription("Games");
		st7.setLocation("Thessaloniki");
		st7.setName("Thisseas");
		st7.setIsOpen(1);
		if (storeDao.storeExists(st7)) {
			storeDao.update(st7);
		} else {
			storeDao.create(st7);
		}

		Store st8 = new Store();
		st8.setDescription("Games");
		st8.setLocation("Athens");
		st8.setName("Paris");
		st8.setIsOpen(1);
		if (storeDao.storeExists(st8)) {
			storeDao.update(st8);
		} else {
			storeDao.create(st8);
		}

		Store st9 = new Store();
		st9.setDescription("Games");
		st9.setLocation("Thessaloniki");
		st9.setName("Ektoras");
		st9.setIsOpen(1);
		if (storeDao.storeExists(st9)) {
			storeDao.update(st9);
		} else {
			storeDao.create(st9);
		}

		Store st10 = new Store();
		st10.setDescription("Games");
		st10.setLocation("Volos");
		st10.setName("Penthesileia");
		st10.setIsOpen(1);
		if (storeDao.storeExists(st10)) {
			storeDao.update(st10);
		} else {
			storeDao.create(st10);
		}

		Store st11 = new Store();
		st11.setDescription("Games");
		st11.setLocation("Thessaloniki");
		st11.setName("Argo");
		st11.setIsOpen(1);
		if (storeDao.storeExists(st11)) {
			storeDao.update(st11);
		} else {
			storeDao.create(st11);
		}

		Store st12 = new Store();
		st12.setDescription("Games");
		st12.setLocation("Athens");
		st12.setName("Pinelopi");
		st12.setIsOpen(1);
		if (storeDao.storeExists(st12)) {
			storeDao.update(st12);
		} else {
			storeDao.create(st12);
		}

		Store st13 = new Store();
		st13.setDescription("Games");
		st13.setLocation("Thessaloniki");
		st13.setName("Telis");
		st13.setIsOpen(1);
		if (storeDao.storeExists(st13)) {
			storeDao.update(st13);
		} else {
			storeDao.create(st13);
		}

		Store st14 = new Store();
		st14.setDescription("Games");
		st14.setLocation("Volos");
		st14.setName("Mideia");
		st14.setIsOpen(1);
		if (storeDao.storeExists(st14)) {
			storeDao.update(st14);
		} else {
			storeDao.create(st14);
		}

		Store st15 = new Store();
		st15.setDescription("Games");
		st15.setLocation("Athens");
		st15.setName("Wraia Eleni");
		st15.setIsOpen(1);
		if (storeDao.storeExists(st15)) {
			storeDao.update(st15);
		} else {
			storeDao.create(st15);
		}

		Store st16 = new Store();
		st16.setDescription("Games");
		st16.setLocation("Volos");
		st16.setName("Alkmini");
		st16.setIsOpen(1);
		if (storeDao.storeExists(st16)) {
			storeDao.update(st16);
		} else {
			storeDao.create(st16);
		}


		Store st17 = new Store();
		st17.setDescription("Games");
		st17.setLocation("Patra");
		st17.setName("Alkmini");
		st17.setIsOpen(1);
		if (storeDao.storeExists(st17)) {
			storeDao.update(st17);
		} else {
			storeDao.create(st17);
		}


		
		supDao.update(sup);

		supDao.update(sup1);

		supDao.update(sup3);

		supDao.update(sup4);

		storeDao.update(st);

		storeDao.update(st1);

		storeDao.update(st2);

		storeDao.update(st17);

		ProductPK pk = new ProductPK();
		pk.setName(pa7.getName());
		pk.setSerialNumber(pa7.getSerialNumber());

		// stPr = sdao.read(baba);

		storeDao.update(st17);

		storeDao.update(st17);

		ProductStoreDaoImpl psDao = new ProductStoreDaoImpl();

		// store = iokasti
		ProductStore ps5 = new ProductStore();
		ps5.setLt("hi cousin");
		ps5.setProductName(pa1.getName());
		ps5.setSerialNumber(pa1.getSerialNumber());
		ps5.setStoreName(st.getName());
		ps5.setQuantity(28);
		ps5.setSupplierName(sup1.getCompanyName());
		psDao.create(ps5);

		// store = athina
		ProductStore ps = new ProductStore();
		ps.setLt("de");
		ps.setProductName(pa7.getName());
		ps.setSerialNumber(pa7.getSerialNumber());
		ps.setStoreName(st17.getName());
		ps.setQuantity(66);
		ps.setSupplierName(sup.getCompanyName());
		psDao.create(ps);

		ProductStore ps79 = new ProductStore();
		ps79.setLt("le");
		ps79.setProductName(pa1.getName());
		ps79.setSerialNumber(pa1.getSerialNumber());
		ps79.setStoreName(st17.getName());
		ps79.setQuantity(10);
		ps79.setSupplierName(sup1.getCompanyName());
		psDao.create(ps79);

		// store = periklis
		ProductStore ps2 = new ProductStore();
		ps2.setLt("hi girl");
		ps2.setProductName(pa1.getName());
		ps2.setSerialNumber(pa1.getSerialNumber());
		ps2.setStoreName(st2.getName());
		ps2.setQuantity(90);
		ps2.setSupplierName(sup3.getCompanyName());
		psDao.create(ps2);

		// store = adigoni
		ProductStore ps3 = new ProductStore();
		ps3.setLt("hi boy");
		ps3.setProductName(pa1.getName());
		ps3.setSerialNumber(pa1.getSerialNumber());
		ps3.setStoreName(st3.getName());
		ps3.setQuantity(2);
		ps3.setSupplierName(sup4.getCompanyName());
		psDao.create(ps3);

		ProductStore ps4 = new ProductStore();
		ps4.setLt("hi cousin");
		ps4.setProductName(pa2.getName());
		ps4.setSerialNumber(pa2.getSerialNumber());
		ps4.setStoreName(st3.getName());
		ps4.setQuantity(20);
		ps4.setSupplierName(sup1.getCompanyName());
		psDao.create(ps4);

		ProductStore ps1 = new ProductStore();
		ps1.setLt("another one");
		ps1.setProductName(pa8.getName());
		ps1.setSerialNumber(pa8.getSerialNumber());
		ps1.setStoreName(st3.getName());
		ps1.setQuantity(4);
		ps1.setSupplierName(sup1.getCompanyName());
		psDao.create(ps1);

		// -----------

		// sup = OR AE
		ProductSupplierDaoImpl puDao = new ProductSupplierDaoImpl();
		ProductSupplier pu = new ProductSupplier();
		pu.setPrice(34);
		pu.setProductName(pa9.getName());
		pu.setSerialNumber(pa9.getSerialNumber());
		pu.setSupplierName(sup.getCompanyName());
		puDao.create(pu);

		ProductSupplier pu1 = new ProductSupplier();
		pu1.setPrice(588);
		pu1.setProductName(pa6.getName());
		pu1.setSerialNumber(pa6.getSerialNumber());
		pu1.setSupplierName(sup.getCompanyName());
		puDao.create(pu1);

		ProductSupplier pu2 = new ProductSupplier();
		pu2.setPrice(333);
		pu2.setProductName(pa7.getName());
		pu2.setSerialNumber(pa7.getSerialNumber());
		pu2.setSupplierName(sup.getCompanyName());
		puDao.create(pu2);

		// sup = AUTO
		ProductSupplier pu3 = new ProductSupplier();
		pu3.setPrice(666);
		pu3.setProductName(pa1.getName());
		pu3.setSerialNumber(pa1.getSerialNumber());
		pu3.setSupplierName(sup1.getCompanyName());
		puDao.create(pu3);

		ProductSupplier pu4 = new ProductSupplier();
		pu4.setPrice(20);
		pu4.setProductName(pa2.getName());
		pu4.setSerialNumber(pa2.getSerialNumber());
		pu4.setSupplierName(sup1.getCompanyName());
		puDao.create(pu4);

		ProductSupplier pu5 = new ProductSupplier();
		pu5.setPrice(50);
		pu5.setProductName(pa8.getName());
		pu5.setSerialNumber(pa8.getSerialNumber());
		pu5.setSupplierName(sup1.getCompanyName());
		puDao.create(pu5);

		// sup = GreekOIL
		ProductSupplier pu6 = new ProductSupplier();
		pu6.setPrice(36);
		pu6.setProductName(pa1.getName());
		pu6.setSerialNumber(pa1.getSerialNumber());
		pu6.setSupplierName(sup3.getCompanyName());
		puDao.create(pu6);

		// sup = Gamers
		ProductSupplier pu7 = new ProductSupplier();
		pu7.setPrice(10);
		pu7.setProductName(pa1.getName());
		pu7.setSerialNumber(pa1.getSerialNumber());
		pu7.setSupplierName(sup4.getCompanyName());
		puDao.create(pu7);

		System.out.println("tosa: "
				+ psDao.numberOfStoresWithThisProductAndThisSupplier(
						pa1.getName(), pa1.getSerialNumber(),
						sup1.getCompanyName()));

	}
}