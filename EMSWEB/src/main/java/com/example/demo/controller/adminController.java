package com.example.demo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Role;
import com.example.demo.entities.Staff;
import com.example.demo.entities.Teacher;
import com.example.demo.model.dateobject;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.StaffResponsitory;

@Controller
public class adminController {
	@RequestMapping(value = { "/DSgiaovien" })
	public String loadDSgiaovien(Model model, @ModelAttribute("teacher") Teacher teacher) {

		return "/jsp/Page/PageforAdmin/DSgiaovien";
	}

	@Autowired
	StaffResponsitory staffrep;
	@Autowired
	RoleRespository rolerepon;

	@RequestMapping(value = { "/DSnhanvien" })
	public String loadDSnhanvien(Model model, @ModelAttribute("staff") Staff staff) {
		List<Staff> stafflist = staffrep.findAll();
		model.addAttribute("List", stafflist);
		List<Depart> departlist = departRes.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}

	@Autowired
	DepartResponsitory departRes;

	@RequestMapping(value = { "/DSphongban" })
	public String loadDSPhongban(Model model, @ModelAttribute("depart") Depart depart) {
		List<Depart> departlist = departRes.findAll();
		model.addAttribute("List", departlist);
		return "/jsp/Page/PageforAdmin/DSphongban";
	}

	@RequestMapping(value = { "/update/staff" })
	public String UpdateDSnhanvien() {
		String a = "good job";
		return a;
	}

	@RequestMapping(value = { "/save/staff" })
	public String SaveDSnhanvien(Model model, @ModelAttribute("staff") Staff staff, HttpServletRequest request) {
		Staff st = new Staff();
		st.setId(staff.getId());
		st.setFname(staff.getFname());
		st.setLname(staff.getLname());
		st.setImage(staff.getImage());
		st.setEmail(staff.getEmail());
		st.setDob(staff.getDob());
		st.setPhone(staff.getPhone());
		st.setAddress(staff.getAddress());
		st.setStatus(staff.getStatus());
		st.setLevel(staff.getLevel());
		st.setSalary(staff.getSalary());
		String dp = request.getParameter("depart");
		System.out.println("=>>" + dp);
		Depart depart = departRes.findByName(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByRoleName(rl);
		st.setRole(role);
		st.setDepart(depart);
		staffrep.save(st);
		List<Staff> stafflist = staffrep.findAll();
		model.addAttribute("List", stafflist);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}

	@RequestMapping(value = { "/updatestaff" })
	public String Updatenhanvien( @ModelAttribute("staff") Staff staff,Model model, HttpServletRequest request,@RequestParam("fname") String fname) {
//		String id = request.getParameter("fnamesx");
		System.out.println("===>>>" + fname);
		Staff sfs = staffrep.findByfname(fname);
		List<Staff> staffs = new ArrayList<>();
		staffs.add(sfs);
		List<Depart> departlist = departRes.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		model.addAttribute("List", staffs);
		return "/jsp/Page/PageforAdmin/Updatenhanvien";
	}
}
