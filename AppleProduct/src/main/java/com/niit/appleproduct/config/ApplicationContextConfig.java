package com.niit.appleproduct.config;

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

import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.BuyDAOimp;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.CartDAOimp;
import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.dao.CatagoryDAOimp;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.dao.ProductDAOimp;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Catagory;
import com.niit.appleproduct.models.Product;
import com.niit.appleproduct.dao.SupplierDAO;
import com.niit.appleproduct.dao.SupplierDAOimp;
import com.niit.appleproduct.dao.UserDAO;
import com.niit.appleproduct.dao.UserDAOimp;
import com.niit.appleproduct.models.Supplier;
import com.niit.appleproduct.models.User;

@Configuration
@ComponentScan("com.niit.appleproduct.models")
@EnableTransactionManagement

public class ApplicationContextConfig {

	@Bean(name = "dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(Catagory.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(User.class);
		sessionBuilder.addAnnotatedClass(Buy.class);
		sessionBuilder.addAnnotatedClass(Cart.class);
		return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		
		return transactionManager;
	}

	@Autowired
	@Bean(name = "catagoryDAO")
	public CatagoryDAO getCatagoryDAO(SessionFactory sessionFactory) {

		return new CatagoryDAOimp(sessionFactory);
	}

	@Autowired
	@Bean(name = "supplierDAO")
	public SupplierDAO getSupplierDAO(SessionFactory sessionFactory) {

		return new SupplierDAOimp(sessionFactory);
	}

	@Autowired
	@Bean(name = "productDAO")
	public ProductDAO getProductDAO(SessionFactory sessionFactory) {

		return new ProductDAOimp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "userDAO")
	public UserDAO getUserDAO(SessionFactory sessionFactory) {

		return new UserDAOimp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "buyDAO")
	public BuyDAO getBuyDAO(SessionFactory sessionFactory) {

		return new BuyDAOimp(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "cartDAO")
	public CartDAO getCartDAO(SessionFactory sessionFactory) {
		
	return new CartDAOimp(sessionFactory);
	}
}
