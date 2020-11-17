package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Parent;
import com.example.demo.entities.User;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.ParentResponsitory;
import com.example.demo.repository.UserResponsitory;


@Controller
public class UserController {
	@Autowired
	UserResponsitory UserRep;
	@Autowired
	DepartResponsitory departRes;
	@Autowired
	ParentResponsitory parentRes;
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String login111(ModelMap model, @ModelAttribute("student") User student, BindingResult errors) {
		List<User> list= UserRep.findAll();
		System.out.println("=> "+student.getUsername());
		for (User u : list) {
			System.out.println(u.getUsername());
			if (u.getUsername().equals(student.getUsername())) {
				
				if (u.getPassword().equals(student.getPassword())) {					
					if (u.getRole().equals("NV")) {
						List<User> us= new ArrayList<User>();
						User uss = new User();
						uss.setUsername(u.getUsername());
						us.add(uss);
						model.addAttribute("List", us);
						return "/jsp/AdminPage";
					}else if (u.getRole().equals("PH")) {
						List<User> us= new ArrayList<User>();
						User uss = new User();
						uss.setUsername(u.getUsername());
						us.add(uss);
						model.addAttribute("List", us);
						return "/jsp/templateParents";
					}else {
						List<User> us= new ArrayList<User>();
						User uss = new User();
						uss.setUsername(u.getUsername());
						us.add(uss);
						model.addAttribute("List", us);
						return "/jsp/templateStudent";
					}
				}else {
					return "layout/layout";
				}
				
			}
//			else {
//				return "layout/layout"
//			}
		}
		
		return "layout/layout";
	}
	


//	@Autowired
//	DepartResponsitory departRespo;
	
	@RequestMapping(params = "btnsave",value = { "/save" })
	public String saveDepart(Model model,@ModelAttribute("depart") Depart d) {
//		System.out.println("==>"+depart.getName());
		Depart de= new Depart(d.getId(),d.getName(), null, null);
		System.out.println(">>> "+d.getId());
//		de.setId();
//		de.setName();
//		de.setDesc();
//		departRes.delete(depart);
//		 new Depart(depart.getId(),depart.getName(),depart.getDesc())
		departRes.save(de);
		return "/jsp/Page/PageforAdmin/DSphongban";
	}
	
	@RequestMapping(value = { "/Page/INFO" })
	public String loadInfo(Model model,@ModelAttribute("Parents") Parent parents) {
		List<Parent> parentList = parentRes.findAll();
		model.addAttribute("List", parentList);
		return "/jsp/Page/info";
	}

	
	
	
	
	
	
	
	
}