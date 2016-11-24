package com.niit.Mychatbackend.Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Mychatbackend.Model.Friend_;

@Repository("friendDAO")
public class FriendDAOImp implements FriendDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public FriendDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Friend_ friend) {
		sessionFactory.getCurrentSession().saveOrUpdate(friend);
	}

	@Transactional
	public void delete(String username) {
		Friend_ friend = new Friend_();
		friend.setUsername(username);
		sessionFactory.getCurrentSession().delete(friend);
	}
	
	@Transactional
	public Friend_ get(String username) {
		String hql = "from Friend where username=" + "'" + username + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Friend_> listFriend = query.list();

		if (listFriend != null && !listFriend.isEmpty()) {
			return listFriend.get(0);
		}
		return null;
	}

	@Transactional
	public List<Friend_> list() {

		@SuppressWarnings("unchecked")
		List<Friend_> listFriend = (List<Friend_>) sessionFactory.getCurrentSession().createCriteria(Friend_.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listFriend;
	}

}
