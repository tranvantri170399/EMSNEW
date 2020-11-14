package com.example.demo.controller;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAccessor;
import java.util.Date;
import java.util.List;

import org.apache.taglibs.standard.extra.spath.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Role;
import com.example.demo.entities.Teacher;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.TeacherResponsitory;

@Controller
public class teacherController {
	@Autowired
	TeacherResponsitory teacherResponsitory;
	
	@Autowired
	RoleRespository rolerep;
	
	@Autowired
	DepartResponsitory departResponsitory;
	 
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		// Date - dd/MM/yyyy
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
//		dateFormat.
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//	}
//
//	
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
	  public String doSaveUser(@ModelAttribute("addteacher") Teacher teacher, Model model) {
		 Teacher tc = new Teacher();
		 tc.setId(teacher.getId());
		 //doi name sang ID (thao tac  role)
		 
		 Role list = rolerep.findByRoleName(teacher.getRole().getRoleName());
		 tc.setRole(list);
		 //
		 tc.setFname(teacher.getFname());
		 tc.setDob(teacher.getDob());
		 teacherResponsitory.save(tc);
	    model.addAttribute("listTcher", teacherResponsitory.findAll());
	    return "/teacher/teacher-list";
	  }
//
}
