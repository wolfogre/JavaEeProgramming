package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.Product;
import com.wolfogre.domain.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/23.
 */
public class ShopAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		//Transaction transaction = session.beginTransaction();
		SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM ProductTable").addEntity(Product.class);
		List<Product> productList = sqlQuery.list();
		//session.save();
		//transaction.commit();

		session.close();
		sessionFactory.close();

		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("productList", productList);

		return SUCCESS;
	}
}
