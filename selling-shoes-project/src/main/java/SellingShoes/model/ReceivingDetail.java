package SellingShoes.model;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="receiving_detail")
public class ReceivingDetail {
	@Id
	@JoinColumn(name="receiving_id")
	private ReceivingSlip receivingSlip;
	@Id
	@ManyToOne
	@JoinColumn(name="shop_sku")
	private Sku sku;
	private String sellerSku;
	private String name;
	private String color;
	private String size;
	private int quantityReceived;
	private int quntityApproved;
	private Double price;
}
