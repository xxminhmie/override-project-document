package SellingShoes.model;

import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.EqualsAndHashCode.Exclude;

@Table(name="image")
public class Image {
	@Id
    @ManyToMany(mappedBy = "sku")
	String image;
}
