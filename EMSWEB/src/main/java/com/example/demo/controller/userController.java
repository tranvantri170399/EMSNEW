package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

import com.example.demo.entities.User;
import com.example.demo.repository.UserResponsitory;
//import com.example.demo.service.UserService;

@Controller
public class userController {
	@Autowired
	private UserResponsitory userresponsitory;
	
//	@Autowired
//	UserService userService;

	@RequestMapping(value = {"user-list" })
	public String listUser(Model model) {
		model.addAttribute("listUser", userresponsitory.findAll());
		return "/user/user-list";
	}
	
	 @RequestMapping("/user-save")
	  public String insertCustomer(Model model) {
	    model.addAttribute("user", new User());
	    return "/user/user-save";
	  }
	 
	 @RequestMapping("/user-view/{username}")
	  public String viewUser(@PathVariable String username, Model model) {
	    Optional<User> user = userresponsitory.findById(username);
	    if (user.isPresent()) {
	      model.addAttribute("user", user.get());
	    }
	    return "/user/user-view";
	  }
	 
	 @RequestMapping("/user-update/{username}")
	  public String updateUser(@PathVariable String username, Model model) {
		 Optional<User> user = userresponsitory.findById(username);
	    if (user.isPresent()) {
	      model.addAttribute("user", user.get());
	    }
	    return "/user/user-update";
	  }
//	 
	 @RequestMapping("/saveUser")
	  public String doSaveUser(@ModelAttribute("User") User user, Model model) {
		 userresponsitory.save(user);
	    model.addAttribute("listUser", userresponsitory.findAll());
	    return "/user/user-list";
	  }
//	 
	 @RequestMapping("/updateUser")
	  public String doUpdateUser(@ModelAttribute("User") User user, Model model) {
		 userresponsitory.save(user);
	    model.addAttribute("listCustomer", userresponsitory.findAll());
	    return "/user/user-list";
	  }
//	 
//	 @RequestMapping("/userDelete/{username}")
//	  public String doDeleteUser(@PathVariable String username, Model model) {
//		 userresponsitor
//	    model.addAttribute("listCustomer", userresponsitory.findAll());
//	    return "/user/user-list";
//	  }
	 
//	 @RequestMapping("/userDelete/{username}")
//	 public String doDeleteUser(Model model, @RequestParam("username") String username) {
//		 userService.deleteUser(username);
//	  model.addAttribute("successMsg", "Employee Deleted Successfully");
//	  model.addAttribute("listCustomer", userresponsitory.findAll());
//	  return "Homepage";
//	 } 
}
