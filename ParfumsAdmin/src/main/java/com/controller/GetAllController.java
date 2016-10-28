package com.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.ParfumService;

@Controller
public class GetAllController {
	
	@Autowired
	ParfumService  parfumService;
	
	@RequestMapping(value = "/getAll" ,method = RequestMethod.GET)
	public String getAll(Model model){
		model.addAttribute("parfum", parfumService.getAll());
		return "allparfums";
	}
}
