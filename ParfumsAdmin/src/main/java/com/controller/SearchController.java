package com.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Parfum;
import com.service.ParfumService;

@Controller	
public class SearchController  {
	@Autowired
	private ParfumService parfumService;
	
	@RequestMapping(value = "/search" ,method = RequestMethod.GET)
	public String searchBy(Model model){
		Parfum parfum = new Parfum();
		model.addAttribute("p",parfum);
		return "search";
	}
	
	@RequestMapping(value = "/remove/{id}",method = RequestMethod.GET)
	public void delete(@PathVariable("id") Integer id,Model model,HttpServletResponse response,HttpServletRequest request) throws IOException{
		parfumService.delete(id);
    	response.sendRedirect("redirect:/search");;
	}
	
	@RequestMapping(value = "/search" ,method = RequestMethod.POST)
	public String searchAll(Model model,@ModelAttribute("p") Parfum parfum,@RequestParam("category") String category,@RequestParam("name") String name,@RequestParam("subname") String subname,@RequestParam("ml") String ml,@RequestParam("price") String price){
		model.addAttribute("category", category);
		model.addAttribute("name", name);
		model.addAttribute("subname", subname);
		model.addAttribute("ml", ml);
		model.addAttribute("price", price);
		model.addAttribute("parfums",parfumService.search(parfum));
		return "search";
	}
}