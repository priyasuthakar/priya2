package com.niit.appleproduct.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.models.Cart;

public class CartTest {
	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.appleproduct");
		context.refresh();
		CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
		Cart cart = (Cart) context.getBean("cart");
		cart.setId(0);
		cart.setPname("f");
		cartDAO.saveOrUpdate(cart);

}
}
