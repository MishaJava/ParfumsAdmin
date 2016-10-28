package com.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Parfum;
import com.service.ParfumService;


@Controller
public class RegistrationConroller {
	
	@Autowired
	private ParfumService parfumService;
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String save(Model model){
		Parfum parfum = new Parfum();
		model.addAttribute("parfum", parfum);
		return "registration";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String save(@ModelAttribute("parfum") Parfum parfum ,@RequestParam("photo") MultipartFile file ) throws IOException {
		parfum.setArray(org.apache.commons.codec.binary.Base64.encodeBase64URLSafe(file.getBytes()));
		parfum.setBase64String(org.apache.commons.codec.binary.Base64.encodeBase64String(file.getBytes()));
		parfumService.save(parfum);
		return "redirect:/success";
		}
	
	@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
	public String update(@PathVariable("id") int id,Model model) throws IOException{
		File s = new File("registereFile");
		byte[] file = this.parfumService.findById(id).getBase64String().getBytes();
		FileOutputStream f = new FileOutputStream(s);
		f.write(file);
		f.close();
		model.addAttribute("parfum",parfumService.findById(id));
		model.addAttribute("s", s);
		return "edit";
		}
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateS(@ModelAttribute("parfum") Parfum parfum,@RequestParam("photo") MultipartFile file) throws IOException{
		parfum.setArray(file.getBytes());
		parfum.setBase64String(org.apache.commons.codec.binary.Base64.encodeBase64String(file.getBytes()));
	    parfumService.update(parfum);
		return "redirect:/getAll";
		}
	
	@RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
	public String delete(@PathVariable("id") Integer id){
		parfumService.delete(id);
		return "redirect:/getAll";
		}
	
	@RequestMapping(value = "/success",method = RequestMethod.GET)
	public String success(){
		return "success";
	}

}
