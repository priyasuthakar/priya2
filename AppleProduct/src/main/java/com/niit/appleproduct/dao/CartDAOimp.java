package com.niit.appleproduct.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.appleproduct.models.Cart;



@Repository("cartDAO")
public class CartDAOimp implements CartDAO  {

	
	@Autowired
	public SessionFactory sessionFactory;
	public CartDAOimp(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

@Transactional
public void saveOrUpdate(Cart cart) {
	cart.setQuantity("1");
	sessionFactory.getCurrentSession().saveOrUpdate(cart);
}

@Transactional
public void delete(int id) {
	Cart cart = new Cart();
	cart.setId(id);
	sessionFactory.getCurrentSession().delete(cart);
}

@Transactional
public Cart get(int id) {
	String hql="from Cart where id  =" + "'" + id + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	List<Cart> listCart = query.list();
	if(listCart!= null && !listCart.isEmpty()) {
		return listCart.get(0);
	}
	return null;
}

@Transactional
public List<Cart> list(String loggedInUser) {
	String hql="from Cart where username  =" + "'" + loggedInUser + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	List<Cart> listCart = query.list();	
		return listCart;	
}

@Transactional
public Long getTotal(String loggedInUser) {
	String hql="select sum(price) from Cart where username  =" + "'" + loggedInUser + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	Long sum=(Long) query.uniqueResult();
	return sum;
}
}