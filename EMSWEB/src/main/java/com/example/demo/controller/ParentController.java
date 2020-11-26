package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Parent;
import com.example.demo.entities.Student;
import com.example.demo.entities.Teacher;
import com.example.demo.entities.User;
import com.example.demo.repository.ParentResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.UserResponsitory;

@Controller
public class ParentController {
	@Autowired
	UserResponsitory UserRep;
	@Autowired
	ParentResponsitory parentRes;

	@Autowired
	StudentResponsitory sturep;
	@RequestMapping(value = { "/Page/INFO" })
	public String loadInfo(Model model,@ModelAttribute("Parents") Parent parents, HttpServletRequest request,@RequestParam("nameuserxxx") String email) {

		System.out.println("=>>11 "+email);
//		List<Parent> parentList = parentRes.findcustom(ids);
		List<Parent> parentList = parentRes.findcustomemail(email);
		Parent parent= parentList.get(parentList.size()-1);
		
		List<Student> studentlist= sturep.findcustom(parent.getId());
		model.addAttribute("Liststudent", studentlist);
		model.addAttribute("List", parentList);
		return "/jsp/Page/PageforParent/info";
	}
	

	@RequestMapping(value = { "/Page/UPDATEPASS" })
	public String editPass(@ModelAttribute("User") User user, Model model,@RequestParam("nameuserxxx") String email) {

		List<Parent> parentList = parentRes.findcustomemail(email);
		
		List<User> userList= UserRep.findcustom(email);
		model.addAttribute("Listuser", userList);
		model.addAttribute("List", parentList);
		return "/jsp/Page/PageforParent/capnhatPassword";
	}
	@RequestMapping(value = { "/Page/THANHTICH" })
	public String thanhtichSV(@ModelAttribute("User") User user, Model model) {
		
		return "/jsp/Page/PageforParent/thanhtich";
	}
	
	@RequestMapping(value = "/updatePass", method = RequestMethod.POST)
	public String updatePass(@ModelAttribute("passUpdate") User passUpdate, Model model,  HttpServletRequest request
			,@RequestParam("username") String username,@RequestParam("password") String pass,
			@RequestParam("passwordold") String passold) {
		Optional<User> r= UserRep.findById(username);
		User user=r.get();

		if (passold.equals(user.getPassword())) {
			user.setPassword(pass);
			UserRep.save(user);
			return "/jsp/Page/PageforParent/error";
		}else {
			return "";
		}
		
		
	}
}

