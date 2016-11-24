package com.niit.appleproduct.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "CATAGORY")
@Component
public class Catagory {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Size (min=4,message="The field must be atleast 4 characters!")
	private String name;
	@Length(min =5,max=25, message = "The field must be between 5 and 25 characters long!")
	private String discription;
    
	
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

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

}
