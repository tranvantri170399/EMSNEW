package com.example.demo.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.*;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.StaffResponsitory;

//@RestController
@Controller
public class newcontroller {
	
	@Autowired
	AmphiResponsitory amrep;
	
	@Autowired
	StaffResponsitory srep;
	@Autowired
	RoleRespository	rrep;
		
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
		List<Staff> list= srep.findAll();
		model.addAttribute("List",list);
	    return "/jsp/loadlist";
	  }
	
	@RequestMapping(value = {"/loads"})
	 public String loadstaff() {
		List<Staff> iterator = srep.findAll();
	    return iterator.toString();
	  }

}
