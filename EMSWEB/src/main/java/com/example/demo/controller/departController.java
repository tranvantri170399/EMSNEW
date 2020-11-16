package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Teacher;
import com.example.demo.repository.DepartResponsitory;

@Controller
public class departController {
	@Autowired
	DepartResponsitory departResponsitory;
	
	@RequestMapping(value = {"depart-list" })
	public String listUser(Model model) {
		model.addAttribute("listDepart", departResponsitory.findAll());
		return "depart/depart-list";
	}
	
	//
	 @RequestMapping(value = { "/depart-save" }, method = RequestMethod.POST)
	  public String insertCustomer(Model model) {
	    model.addAttribute("adddepart", new Depart());
	    return "/depart/depart-save";
	  }
	 
	 @RequestMapping("/saveDepart")
	  public String doSaveUser(@ModelAttribute("User") Depart depart, Model model) {
		 departResponsitory.save(depart);
	    model.addAttribute("listUser", departResponsitory.findAll());
	    return "/depart/depart-list";
	  }
//
}
