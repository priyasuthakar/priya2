package com.niit.appleproduct.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.models.Catagory;

public class CatagoryTest {
	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.appleproduct");
		context.refresh();
		
		CatagoryDAO catagoryDAO = (CatagoryDAO) context.getBean("catagoryDAO");
		Catagory catagory = (Catagory) context.getBean("catagory");
		catagory.setId(1);
		catagory.setName("IPhone");
		catagory.setDiscription("Phone1");
		catagoryDAO.saveOrUpdate(catagory);
		catagoryDAO.delete(1);
	}

}
