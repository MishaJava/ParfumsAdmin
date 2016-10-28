package com.service;

import java.util.List;

import com.entity.Parfum;

public interface ParfumService {
	
	 void save(Parfum parfum);
	 void update(Parfum parfum);
	 Parfum findById(int id);
	 List<Parfum> getAll();
	 void delete(int id);
	 List<Parfum> search(Parfum parfum);

}
