package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Staff;
import com.example.demo.entities.Teacher;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.StaffResponsitory;


@Controller
public class adminController {
	@RequestMapping(value = { "/DSgiaovien" })
	public String loadDSgiaovien(Model model,@ModelAttribute("teacher") Teacher teacher ){
		
		return "/jsp/Page/PageforAdmin/DSgiaovien";
	}
	
	@Autowired
	StaffResponsitory staffrep;
	@RequestMapping(value = { "/DSnhanvien" })
	public String loadDSnhanvien(Model model,@ModelAttribute("staff") Staff staff ){
		List<Staff> stafflist = staffrep.findAll();
		model.addAttribute("List", stafflist);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}
	
	@Autowired
	DepartResponsitory departRes;	
	@RequestMapping(value = { "/DSphongban" })
	public String loadDSPhongban(Model model,@ModelAttribute("depart") Depart depart) {
		List<Depart> departlist = departRes.findAll();
		model.addAttribute("List", departlist);
		return "/jsp/Page/PageforAdmin/DSphongban";
	}
	
	
	
	@RequestMapping(value = { "/update/staff" })
	public String UpdateDSnhanvien(){
		String a = "good job";
		return a;
	}
	
}
