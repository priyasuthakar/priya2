package com.niit.appleproduct.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.appleproduct.models.Supplier;


@Repository("supplierDAO")
public class SupplierDAOimp implements SupplierDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public SupplierDAOimp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Supplier supplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
	}
	
	@Transactional
	public Supplier getByName(String name)
	{
		String hql="from Supplier where name  =" + "'" + name + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = query.list();
		
		if(listSupplier!= null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
			
		}
		return null;
	}

	@Transactional
	public void delete(int id) {
		Supplier supplier = new Supplier();
		supplier.setId(id);
		sessionFactory.getCurrentSession().delete(supplier);
	}

	@Transactional
	public Supplier get(int id) {
		String hql = "from Supplier where id= '" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = query.list();
		if (listSupplier != null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
		}
		return null;
	}

	@Transactional
	public List<Supplier> list() {

		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = (List<Supplier>) sessionFactory.getCurrentSession()
		.createCriteria(Supplier.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listSupplier;

	}

}
