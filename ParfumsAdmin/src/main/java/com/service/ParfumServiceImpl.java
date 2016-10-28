package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ParfumDao;
import com.entity.Parfum;




@Service
@Transactional
public class ParfumServiceImpl implements ParfumService{

	@Autowired
	private ParfumDao parfumDao;
	
	public void save(Parfum parfum) {
      parfumDao.save(parfum);		
	}

	public void update(Parfum parfum) {
		parfumDao.update(parfum);	
	}

	public List<Parfum> getAll() {
		return parfumDao.getAll();
	}

	public void delete(int id) {
		parfumDao.delete(id);		
	}

	public Parfum findById(int id) {
		return parfumDao.findById(id);
	}

	public List<Parfum> search(Parfum parfum) {
      List<Parfum> list = new ArrayList<Parfum>();
      List<Parfum> list1 = new ArrayList<Parfum>();
      list.addAll(parfumDao.searchByCategory(parfum.getCategory()));
      if(!(parfum.getName().equals(""))){
    	list1.addAll(list);
    	list.clear();
    	for(Parfum p : list1){
    		if((p.getName().equals(parfum.getName()))){
    			list.add(p);
    		}
       }
      }
      if(!(parfum.getSubname().equals(""))){
    	  list1.addAll(list);
    	  list.clear();
    	  for(Parfum p : list1){
      		if((p.getSubname().equals(parfum.getSubname()))){
      			list.add(p);
      		}
         }
      }
      if(!(parfum.getMl().equals(""))){
    	  list1.addAll(list);
    	  list.clear();
    	  for(Parfum p : list1){
      		if((p.getMl().equals(parfum.getMl()))){
      			list.add(p);
      		}
         }
      }
      if(!(parfum.getPrice().equals(""))){
    	  list1.addAll(list);
    	  list.clear();
    	  for(Parfum p : list1){
      		if(p.getPrice().equals(parfum.getPrice())){
      			list.add(p);
      		}
         }
      }
		return list;
	}
}
