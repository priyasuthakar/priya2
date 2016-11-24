package com.niit.appleproduct.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "PRODUCT")
@Component
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Size (min=4,message="The field must be atleast 3 characters!")
	private String name;
	@Range(min=500,max=2000000,message="Price should not be less than 1000!")
	private String price;
	private String color;
	private String quantity;
	@Length(min =3,message = "The field must be minimum 3 characters long!")
	private String discription;

	@Transient	
	private MultipartFile image;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cat_id")
	private Catagory cat;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="sup_id")
	private Supplier sup;


	public Catagory getCat() {
		return cat;
	}
	public void setCat(Catagory cat) {
		this.cat = cat;
	}
	public Supplier getSup() {
		return sup;
	}
	public void setSup(Supplier sup) {
		this.sup = sup;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuntity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
}
