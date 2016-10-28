package com.dao;

import java.util.List;

import com.entity.Parfum;

public interface ParfumDao {

	/**
	 * 
	 * @param parfum
	 */
	void save(Parfum parfum);
	public void update(Parfum parfum);
	public Parfum findById(int id);
	public List<Parfum> getAll();
	public void delete(int id);
	public List<Parfum> searchByCategory(String parfum);




	
}
