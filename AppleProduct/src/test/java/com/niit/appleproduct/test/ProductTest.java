package com.niit.appleproduct.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.models.Product;

public class ProductTest {
	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.appleproduct");
		context.refresh();

		ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
		Product product = (Product) context.getBean("product");
		product.setId(1);
		product.setName("IPhone_6s");
		product.setDiscription("Phone");
		productDAO.saveOrUpdate(product);
		productDAO.delete(1);
		
	}

}
