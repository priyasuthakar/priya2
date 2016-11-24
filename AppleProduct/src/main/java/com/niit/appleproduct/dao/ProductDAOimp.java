package com.niit.appleproduct.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.appleproduct.models.Product;

@Repository("productDAO")
public class ProductDAOimp implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public ProductDAOimp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}
	
	@Transactional
	public void delete(int id) {
		Product product = new Product();
		product.setId(id);
		sessionFactory.getCurrentSession().delete(product);
	}

	@Transactional
	public Product get(int id) {
		String hql = "from Product where id=" + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = query.list();
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		return null;
	}

	@Transactional
	public List<Product> getByProduct(int id)
	{
		String hql="from Product where id  =" + "'" + id+ "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = query.list();
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;
		}
		return null;
	}
	
	@Transactional
	public List <Product> getByCatagory(int catagoryId)
	{
		String hql="from Product where cat_id  =" + "'" + catagoryId + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = query.list();		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;			
		}
		return null;
	}
	
	@Transactional
	public List <Product> getBySupplier(int supplierId)
	{
		String hql="from Product where sup_id  =" + "'" + supplierId + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = query.list();		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;			
		}
		return null;
	}

	@Transactional
	public List<Product> list() {

		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;

	}

}
