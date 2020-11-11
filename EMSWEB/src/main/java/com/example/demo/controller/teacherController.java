package com.example.demo.controller;

import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Teacher;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.TeacherResponsitory;

@Controller
public class teacherController {
	@Autowired
	TeacherResponsitory teacherResponsitory;
	
	@RequestMapping(value = {"teacher-list" })
	public String listUser(Model model) {
		model.addAttribute("listTcher", teacherResponsitory.findAll());
		return "/teacher/teacher-list";
	}
	
//
	 @RequestMapping(value = { "/teacher-save" }, method = RequestMethod.POST)
	  public String insertCustomer(Model model) {
	    model.addAttribute("addteacher", new Teacher());
	    return "/teacher/teacher-save";
	  }
	 
	 @RequestMapping("/saveTeacher")
	  public String doSaveUser(@ModelAttribute("User") Teacher teacher, Model model) {
		 teacherResponsitory.save(teacher);
	    model.addAttribute("listUser", teacherResponsitory.findAll());
	    return "/teacher/teacher-list";
	  }
//
}
