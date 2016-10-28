package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.Parfum;
/**
 * 
 * @author admin
 *This class is implementation of ParfumDao interface.
 *All operation which would be done with database are realized here.
 */

@Repository
public class ParfumDaoImpl implements ParfumDao {
	/**
	 * SessionFactory object by the help of which we would get
	 * a Session object.
	 */
	@Autowired
	private SessionFactory sessionFactory;
    /**
     * This method is saving
     * @param parfum
     */
	public void save(Parfum parfum) {
		Session session = sessionFactory.getCurrentSession();
		session.save(parfum);
	}

	public void update(Parfum parfum) {
		Session session = sessionFactory.getCurrentSession();
		session.update(parfum);
	}

	public List<Parfum> getAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Parfum");
		List<Parfum> parfumes = query.getResultList();
		return parfumes;
	}

	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Parfum parfum = (Parfum)session.load(Parfum.class, id);
		session.delete(parfum);
	}

	public Parfum findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Parfum parfum = (Parfum) session.get(Parfum.class, id);
         return parfum;
	}

	public List<Parfum> searchByCategory(String category) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Parfum p where p.category = :category");
		query.setParameter("category",category);
		List<Parfum> parfums = query.list();
		if(category!=""){
			return parfums;
		}
		return this.getAll();
	}
}
