package com.niit.Mychatbackend.Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Mychatbackend.Model.Blog_;

@Repository("blogDAO")
public class BlogDAOImp implements BlogDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public BlogDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Blog_ blog) {
		sessionFactory.getCurrentSession().saveOrUpdate(blog);
	}

	@Transactional
	public void delete(String username) {
		Blog_ blog = new Blog_();
		blog.setUsername(username);
		sessionFactory.getCurrentSession().delete(blog);
	}
	
	@Transactional
	public Blog_ get(String username) {
		String hql = "from Blog where username=" + "'" + username + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Blog_> listBlog = query.list();

		if (listBlog != null && !listBlog.isEmpty()) {
			return listBlog.get(0);
		}
		return null;
	}

	@Transactional
	public List<Blog_> list() {

		@SuppressWarnings("unchecked")
		List<Blog_> listBlog = (List<Blog_>) sessionFactory.getCurrentSession().createCriteria(Blog_.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listBlog;
	}

}
