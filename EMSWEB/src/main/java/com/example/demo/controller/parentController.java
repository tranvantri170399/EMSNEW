package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Parent;
import com.example.demo.repository.ParentResponsitory;

public class parentController {
	@Autowired
	ParentResponsitory rep;
		
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	  public String index() {
	    return "/jsp/index";
	  }
	@RequestMapping(value = { "/hello" }, method = RequestMethod.GET)
	  public String hello() {
	    return "jsp/templateStudent";
	  }
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	  public String hello11() {
	    return "layout/layout";
	  }

	@RequestMapping(value = {"/load"}, method = RequestMethod.GET)
	 public String index(Model model) {
		List<Parent> list= rep.findAll();
		model.addAttribute("List",list);
	    return "/jsp/parent";
	  }
	
	@RequestMapping(value = {"/loads"})
	 public String loadstaff() {
		List<Parent> iterator = rep.findAll();
	    return iterator.toString();
	  }
}
