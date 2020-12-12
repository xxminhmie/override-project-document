package SellingShoes.model;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="category")
public class Category {
	@Id
	private String categoryId;
	private String categoryName;
}
