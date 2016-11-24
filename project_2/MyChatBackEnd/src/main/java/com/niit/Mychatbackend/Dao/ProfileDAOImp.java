package com.niit.Mychatbackend.Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Mychatbackend.Model.Profile_;

@Repository("profileDAO")
public class ProfileDAOImp implements ProfileDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public ProfileDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Profile_ profile) {
		sessionFactory.getCurrentSession().saveOrUpdate(profile);
	}

	@Transactional
	public void delete(String username) {
		Profile_ profile = new Profile_();
		profile.setUsername(username);
		sessionFactory.getCurrentSession().delete(profile);
	}
	
	@Transactional
	public Profile_ get(String username) {
		String hql = "from Profile where username=" + "'" + username + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Profile_> listProfile = query.list();

		if (listProfile != null && !listProfile.isEmpty()) {
			return listProfile.get(0);
		}
		return null;
	}

	@Transactional
	public List<Profile_> list() {

		@SuppressWarnings("unchecked")
		List<Profile_> listProfile = (List<Profile_>) sessionFactory.getCurrentSession().createCriteria(Profile_.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProfile;
	}

}
