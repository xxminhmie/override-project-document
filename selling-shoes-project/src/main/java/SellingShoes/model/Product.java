package SellingShoes.model;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="product")
public class Product {
	@Id
	private String productId;
	@OneToMany
	@JoinColumn(name="category_id")
	private Category category;
	@OneToMany
	@JoinColumn(name="seller_id")
	private String brand;
	private String productName;
	private String shortDescription;
	private String description;
	private String status;
}
