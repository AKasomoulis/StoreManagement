package gr.uoa.di.storemanagement.datalayer.entities.product;

import gr.uoa.di.storemanagement.context.Context;
import gr.uoa.di.storemanagement.datalayer.entities.product.dao.ProductDaoImpl;

import java.text.DecimalFormat;
import java.util.List;

public class PriceCalculation {

	private static PriceCalculation singleInstance;
	private static double fee;
	private static double discount;
	private static double otherFee;

	private PriceCalculation() {

	}

	public static PriceCalculation getInstance() {
		if (singleInstance == null) {
			synchronized (PriceCalculation.class) {
				if (singleInstance == null) {
					singleInstance = new PriceCalculation();

					fee = Context.getFee();
					discount = Context.getDiscount();
					otherFee = Context.getOtherFee();
				}
			}
		}
		return singleInstance;
	}

	protected static double round(double price) {
		DecimalFormat df = new DecimalFormat("#.##");
		price = Double.valueOf(df.format(price));

		return price;
	}

	public double calculate(double price) {
		synchronized (singleInstance) {

			double newPrice;

			newPrice = price + price * fee / 100.0 + price * otherFee / 100.0;
			newPrice = newPrice - newPrice * discount / 100.0;

			return round(newPrice);
		}
	}

	public void setNewFeeFromNowOn(double fee) {
		synchronized (singleInstance) {
			PriceCalculation.fee = fee;
		}
	}

	public void setNewDiscountFromNowOn(double discount) {
		synchronized (singleInstance) {
			PriceCalculation.discount = discount;
		}
	}

	public void setNewOtherFeeFromNowOn(double otherFee) {
		synchronized (singleInstance) {
			PriceCalculation.otherFee = otherFee;
		}
	}

	public void setNewFee(double newFee) {
		synchronized (singleInstance) {

			ProductDaoImpl pDao = new ProductDaoImpl();
			List<Object[]> productList;
			Product p;
			double oldPrice, newPrice, price;

			productList = pDao.getAllProducts();

			for (Object[] o : productList) {

				p = pDao.readIt((String) o[0], (String) o[1]);

				oldPrice = p.getPrice();

				// this is price before any fee or discount
				price = oldPrice / (1.0 - PriceCalculation.discount / 100.0);
				price = price / (1.0 + (PriceCalculation.fee / 100.0) + (PriceCalculation.otherFee / 100.0));

				// now calculate the new price with a new fee or discount
				newPrice = price + price * newFee / 100.0 + price * PriceCalculation.otherFee / 100.0;
				newPrice = newPrice - newPrice * PriceCalculation.discount / 100.0;

				p.setPrice(round(newPrice));

				pDao.update(p);
			}

			PriceCalculation.fee = newFee;
		}
	}

	public void setNewDiscount(double newDiscount) {
		synchronized (singleInstance) {
			ProductDaoImpl pDao = new ProductDaoImpl();
			List<Object[]> productList;
			Product p;
			double oldPrice, newPrice, price;

			productList = pDao.getAllProducts();

			for (Object[] o : productList) {

				p = pDao.readIt((String) o[0], (String) o[1]);

				oldPrice = p.getPrice();

				// this is price before any fee or discount
				price = oldPrice / (1.0 - PriceCalculation.discount / 100.0);
				price = price / (1.0 + (PriceCalculation.fee / 100.0) + (PriceCalculation.otherFee / 100.0));

				// now calculate the new price with a new fee or discount
				newPrice = price + price * PriceCalculation.fee / 100.0 + price * PriceCalculation.otherFee / 100.0;
				newPrice = newPrice - newPrice * newDiscount / 100.0;

				p.setPrice(round(newPrice));

				pDao.update(p);
			}
			
			PriceCalculation.discount = newDiscount;
		}
	}

	public void setNewOtherFee(double newOtherFee) {
		synchronized (singleInstance) {
			ProductDaoImpl pDao = new ProductDaoImpl();
			List<Object[]> productList;
			Product p;
			double oldPrice, newPrice, price;

			productList = pDao.getAllProducts();

			for (Object[] o : productList) {

				p = pDao.readIt((String) o[0], (String) o[1]);

				oldPrice = p.getPrice();

				// this is price before any fee or discount
				price = oldPrice / (1.0 - PriceCalculation.discount / 100.0);
				price = price / (1.0 + (PriceCalculation.fee / 100.0) + (PriceCalculation.otherFee / 100.0));

				// now calculate the new price with a new fee or discount
				newPrice = price + price * PriceCalculation.fee / 100.0 + price * newOtherFee / 100.0;
				newPrice = newPrice - newPrice * PriceCalculation.discount / 100.0;

				p.setPrice(round(newPrice));

				pDao.update(p);
			}			
			
			PriceCalculation.otherFee = newOtherFee;
		}
	}

	public double getFee() {
		return fee;
	}

	public double getDiscount() {
		return discount;
	}

	public double getOtherFee() {
		return otherFee;
	}

}