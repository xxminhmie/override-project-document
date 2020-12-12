package SellingShoes.model;

import java.sql.Date;
import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude 
    @ToString.Exclude 
    @JoinTable(name = "sku_image",
            joinColumns = @JoinColumn(name = "shop_sku"),
            inverseJoinColumns = @JoinColumn(name = "image")
    )
	ArrayList<Image> images = new ArrayList<Image>();
}
