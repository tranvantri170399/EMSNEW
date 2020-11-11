package com.example.demo.controller;

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
//	@Autowired
//	RoleRespository roleRespository;
//	@Autowired
//	DepartResponsitory departResponsitory;

//	@RequestMapping(value = { "/loadlistTCher" })
//	public String listTeacher(Model model) {
//		model.addAttribute("listTCher", teacherResponsitory.findAll());
//		return "/jsp/loadteacher";
//	}
	@RequestMapping(value= {"/","/loadlistTCher"})
	public String loadlistTCher(Model model) {
		model.addAttribute("listTeacher",teacherResponsitory.findAll());
		return "";
	}
}
