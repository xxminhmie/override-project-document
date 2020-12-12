package SellingShoes.model;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class LazOrderItem {
	@ManyToOne
	@JoinColumn(name="order_id")
	private LazOrder lazOrder;
	@ManyToOne
	@JoinColumn(name = "sku")
	private Sku sku;
	private String sellerSku;
	private String name;
	private String variation;
	private Double itemPrice;
	private Double paidPrice;
	private int quantity;
}
