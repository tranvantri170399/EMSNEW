package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.User;
import com.example.demo.repository.UserResponsitory;


@Controller
public class UserController {
	@Autowired
	UserResponsitory UserRep;
	
	@RequestMapping(value = { "login/login" }, method = RequestMethod.POST)
	public String login111(ModelMap model, @ModelAttribute("student") User student, BindingResult errors) {
		List<User> list= UserRep.findAll();
		System.out.println("=> "+student.getUsername());
		for (User u : list) {
			System.out.println(u.getUsername());
			if (u.getUsername().equals(student.getUsername())) {
				if (u.getPassword().equals(student.getPassword())) {
					return "/jsp/AdminPage";
				}else {
					return "layout/layout";
				}
				
			}else {
				return "layout/layout";
			}
		}
		
		return "layout/layout";
	}
}
