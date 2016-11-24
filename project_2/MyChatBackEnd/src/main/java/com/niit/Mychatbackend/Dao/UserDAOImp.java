package com.niit.Mychatbackend.Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Mychatbackend.Model.UserDetails;

@Repository("userDAO")
public class UserDAOImp implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public UserDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(UserDetails userdetails) {
		sessionFactory.getCurrentSession().saveOrUpdate(userdetails);
	}

	@Transactional
	public void delete(String username) {
		UserDetails userdetails = new UserDetails();
		userdetails.setUsername(username);
		sessionFactory.getCurrentSession().delete(userdetails);
	}
	
	@Transactional
	public UserDetails get(String username) {
		String hql = "from UserDetails where username=" + "'" + username + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> listProfile = query.list();

		if (listProfile != null && !listProfile.isEmpty()) {
			return listProfile.get(0);
		}
		return null;
	}

	@Transactional
	public List<UserDetails> list() {

		@SuppressWarnings("unchecked")
		List<UserDetails> listProfile = (List<UserDetails>) sessionFactory.getCurrentSession().createCriteria(UserDetails.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProfile;
	}

	@Transactional
	public boolean isValidUser(String username,String password) {
		String hql="from UserDetails where username ='" + username + "'and "+"password ='"+ password+"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> listUser = query.list();
		
		if(listUser!= null && !listUser.isEmpty()) {
			return true;
			
		}
		return false;
	}

}
