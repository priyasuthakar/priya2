package com.niit.Mychatbackend.Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Mychatbackend.Model.Chat_;

@Repository("chatDAO")
public class ChatDAOImp implements ChatDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public ChatDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(Chat_ chat) {
		sessionFactory.getCurrentSession().saveOrUpdate(chat);
	}

	@Transactional
	public void delete(String username) {
		Chat_ chat = new Chat_();
		chat.setUsername(username);
		sessionFactory.getCurrentSession().delete(chat);
	}
	
	@Transactional
	public Chat_ get(String username) {
		String hql = "from Chat where username=" + "'" + username + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Chat_> listChat = query.list();

		if (listChat != null && !listChat.isEmpty()) {
			return listChat.get(0);
		}
		return null;
	}

	@Transactional
	public List<Chat_> list() {

		@SuppressWarnings("unchecked")
		List<Chat_> listChat = (List<Chat_>) sessionFactory.getCurrentSession().createCriteria(Chat_.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listChat;
	}

}
