package com.niit.Mychatbackend.Config;


import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.Mychatbackend.Dao.BlogDAO;
import com.niit.Mychatbackend.Dao.BlogDAOImp;
import com.niit.Mychatbackend.Dao.ChatDAO;
import com.niit.Mychatbackend.Dao.ChatDAOImp;
import com.niit.Mychatbackend.Dao.FriendDAO;
import com.niit.Mychatbackend.Dao.FriendDAOImp;
import com.niit.Mychatbackend.Dao.ProfileDAO;
import com.niit.Mychatbackend.Dao.ProfileDAOImp;
import com.niit.Mychatbackend.Dao.UserDAO;
import com.niit.Mychatbackend.Dao.UserDAOImp;
import com.niit.Mychatbackend.Model.Blog_;
import com.niit.Mychatbackend.Model.Chat_;
import com.niit.Mychatbackend.Model.Friend_;
import com.niit.Mychatbackend.Model.Profile_;
import com.niit.Mychatbackend.Model.UserDetails;

@Configuration
@ComponentScan("com.niit.Mychatbackend.Model")
@EnableTransactionManagement

public class ApplicationContextConfig {

	@Bean(name = "dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
		dataSource.setUsername("PRIYA");
		dataSource.setPassword("143");
		return dataSource;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.Oracle10gDialect");
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(UserDetails.class);
		sessionBuilder.addAnnotatedClass(Blog_.class);
		sessionBuilder.addAnnotatedClass(Chat_.class);
		sessionBuilder.addAnnotatedClass(Profile_.class);
		sessionBuilder.addAnnotatedClass(Friend_.class);
		return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}

	
	@Autowired
	@Bean(name = "userDAO")
	public UserDAO getUserDAO(SessionFactory sessionFactory) {
		return new UserDAOImp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "blogDAO")
	public BlogDAO getBlogDAO(SessionFactory sessionFactory) {
		return new BlogDAOImp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "chatDAO")
	public ChatDAO getChatDAO(SessionFactory sessionFactory) {
		return new ChatDAOImp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "profileDAO")
	public ProfileDAO getProfileDAO(SessionFactory sessionFactory) {
		return new ProfileDAOImp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "friendDAO")
	public FriendDAO getFriendDAO(SessionFactory sessionFactory) {
		return new FriendDAOImp(sessionFactory);
	}
	
}
