package com.niit.appleproduct.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.appleproduct.dao.SupplierDAO;
import com.niit.appleproduct.models.Supplier;

public class SupplierTest {
	public static void main(String arg[]) {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.appleproduct");
		context.refresh();
		
		SupplierDAO supplierDAO = (SupplierDAO) context.getBean("supplierDAO");
		Supplier supplier = (Supplier) context.getBean("supplier");
		supplier.setId(1);
		supplier.setName("IPhone_6s");
		supplier.setDiscription("Phone");
		supplierDAO.saveOrUpdate(supplier);
		supplierDAO.delete(1);
	}

}
