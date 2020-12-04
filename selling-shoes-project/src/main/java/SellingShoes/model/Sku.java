package SellingShoes.model;

import java.sql.Date;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.ToString;

@Table(name="sku")
public class Sku {
	
	@Id
	private String shopSku;
	@EqualsAndHashCode.Exclude
    @ToString.Exclude
	@ManyToOne()
	@JoinColumn(name="product_id")
	private Product product;
	private String seller_sku;
	private int available;
	private int quantity;
	private String colorFamily;
	private String size;
	private String height;
	private String width;
	private String length;
	private String weight;
	private Double price;
	private Double specialPrice;
	private Date specialFromTime;
	private Date specialToTime;
	private String status;
}
