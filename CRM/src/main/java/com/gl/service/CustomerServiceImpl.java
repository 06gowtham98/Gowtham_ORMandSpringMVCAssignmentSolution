package com.gl.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import com.gl.entities.Customer;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

//Implementation of the service methods
@Service
public class CustomerServiceImpl implements CustomerService {

	private SessionFactory sessionFactory;

	private Session session;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException ex) {
			session = sessionFactory.openSession();
		}
	}

	@Override
	public List<Customer> findAll() {
		Transaction tx = session.beginTransaction();
		List<Customer> customer = session.createQuery("from Customer").list();
		System.out.print("findall list "+customer.toString());
		tx.commit();
		return customer;
	}

	@Override
	public Customer findById(int id) {
		Transaction tx = session.beginTransaction();
		Customer customer = session.get(Customer.class, id);
		tx.commit();
		return customer;
	}

	@Override
	public void save(Customer customer) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(customer);
		tx.commit();

	}

	@Override
	public void deleteById(int id) {
		Transaction tx = session.beginTransaction();
		Customer customer = session.get(Customer.class, id);
		if (customer != null)
			session.delete(customer);
		tx.commit();

	}

	
}
