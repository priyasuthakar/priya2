package com.niit.appleproduct.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.appleproduct.models.Buy;

@Repository("buyDAO")
public class BuyDAOimp implements BuyDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public BuyDAOimp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Buy buy) {
		sessionFactory.getCurrentSession().saveOrUpdate(buy);
	}

	@Transactional
	public Buy get(int id) {
		String hql = "from Buy where id= '" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Buy> listBuy = query.list();
		if (listBuy != null && !listBuy.isEmpty()) {
			return listBuy.get(0);
		}
		return null;
	}
	
	@Transactional
	public void delete(int id) {
		Buy buy = new Buy();
		buy.setId(id);
		sessionFactory.getCurrentSession().delete(buy);
	}
	
	@Transactional
	public List<Buy> list(String loggedInUser) {
		String hql="from Buy where username  =" + "'" + loggedInUser + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Buy> listBuy = query.list();
			return listBuy;
	}

}
