package SellingShoes.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "laz_order")
public class LazOrder {
	@Id
	private String orderId;
	private Date createdDate;
	private  Date updateDate;
	private String paymentMethod;
	private Double shippingFee;
	private int price;
	private String status;
	@OneToMany(mappedBy = "laz_order_item", cascade = CascadeType.ALL)
	private LazOrderItem lazOrderItem;
}
