package com.niit.appleproduct.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.appleproduct.models.Catagory;


@Repository("catagoryDAO")
public class CatagoryDAOimp implements CatagoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public CatagoryDAOimp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Catagory catagory) {
		sessionFactory.getCurrentSession().saveOrUpdate(catagory);
	}
	
	@Transactional
	public Catagory getByName(String name)
	{
		String hql="from Catagory where name  =" + "'" + name + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		@SuppressWarnings("unchecked")
		List<Catagory> listCatagory = query.list();
		
		if(listCatagory!= null && !listCatagory.isEmpty()) {
			return listCatagory.get(0);
			
		}
		return null;
	}

	@Transactional
	public void delete(int id) {
		Catagory catagory = new Catagory();
		catagory.setId(id);
		sessionFactory.getCurrentSession().delete(catagory);
	}

	@Transactional
	public Catagory get(int id) {
		String hql = "from Catagory where id= '" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Catagory> listCatagory = query.list();
		if (listCatagory != null && !listCatagory.isEmpty()) {
			return listCatagory.get(0);
		}
		return null;
	}

	@Transactional
	public List<Catagory> list() {

		@SuppressWarnings("unchecked")
		List<Catagory> listCatagory = (List<Catagory>) sessionFactory.getCurrentSession()
		.createCriteria(Catagory.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCatagory;

	}

}
