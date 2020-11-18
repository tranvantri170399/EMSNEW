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
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Role;
import com.example.demo.entities.Staff;
import com.example.demo.entities.Student;
import com.example.demo.entities.Teacher;
import com.example.demo.model.dateobject;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.StaffResponsitory;
import com.example.demo.service.StudentService;
import com.example.demo.service.TeacherService;

@Controller
public class adminController {
	// teacher
	@Autowired
	private TeacherService teacherService;
	//
	// student
	private StudentService studentService;
	//

	// controller teacher//
	@GetMapping("/DSgiaovien")
	public String listTeacher(Model model) {
		return findPaginated(1, "id", "asc", model);
	}

	@GetMapping("/page/{pageNo}")
	public String findPaginated(@PathVariable(value = "pageNo") int pageNo, @RequestParam("sortField") String sortField,
			@RequestParam("sortDir") String sortDir, Model model) {
		int pageSize = 5;

		Page<Teacher> page = teacherService.findPaginated(pageNo, pageSize, sortField, sortDir);
		List<Teacher> listTeacher = page.getContent();
		model.addAttribute("listTeacher", listTeacher);
		return "/jsp/Page/PageforAdmin/DSgiaovien";
	}

	@GetMapping("/updateForm")
	public String showFormForUpdate(@RequestParam("id") String id, Model theModel) {
		Teacher theTeacher = teacherService.getTeacherByid(id);
		theModel.addAttribute("teacher", theTeacher);
		return "/jsp/Page/PageforAdmin/formupdateTC";
	}

	@RequestMapping(value = "/saveTeacher", method = RequestMethod.POST)
	public String saveTeacher(@ModelAttribute("teacher") Teacher teacher,
			Model model, BindingResult result) {
		// // lưu giao vien vào cơ sở dữ liệu //
		Teacher newteacher = new Teacher(); // newteacher.setId(teacher.getId());
		//// doi name sang ID (thao tac depart) // Depart listDP =
//		  departResponsitory.findByname(teacher.getDepart().getName()); //
//		 newteacher.setDepart(listDP); //// doi name sang ID (thao tac role) // Role
//		 listRL = roleRespository.findByroleName(teacher.getRole().getRoleName()); //
//		  newteacher.setRole(listRL); 
		newteacher.setFname(teacher.getFname());
		newteacher.setLname(teacher.getLname()); //
		newteacher.setImage(teacher.getImage()); //
		newteacher.setEmail(teacher.getEmail()); ////
		newteacher.setDob(teacher.getDob()); //
		newteacher.setPhone(teacher.getPhone()); //
		newteacher.setAddress(teacher.getAddress()); //
		newteacher.setStatus(teacher.getStatus()); //
		newteacher.setLevel(teacher.getLevel()); ////
		newteacher.setSalary(teacher.getSalary()); //
		teacherService.saveTeacher(newteacher); // return "redirect:/list-teach"; //
		return "redirect:/DSgiaovien"; 
	}

	// controller teacher//

//	// controller student//
//	@GetMapping("/DShocsinh")
//	public String listStudent(Model model) {
//		return findPaginated(1, "id", "asc", model);
//	}
//	@GetMapping("/page/{pageNo}")
//	public String findPaginated1(@PathVariable(value = "pageNo") int pageNo, @RequestParam("sortField") String sortField,
//			@RequestParam("sortDir") String sortDir, Model model) {
//		int pageSize = 5;
//
//		Page<Student> page = studentService.findPaginated(pageNo, pageSize, sortField, sortDir);
//		List<Student> listStudent = page.getContent();
//		model.addAttribute("listTeacher", listStudent);
//		return "/jsp/Page/PageforAdmin/DSphongban";
//	}
//	// controller student//
	@Autowired
	StaffResponsitory staffrep;

	@Autowired RoleRespository rolerepon;
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
		st.setEmail(staff.getEmail());
		st.setDob(staff.getDob());
		st.setPhone(staff.getPhone());
		st.setAddress(staff.getAddress());
		st.setStatus(staff.getStatus());
		st.setLevel(staff.getLevel());
		st.setSalary(staff.getSalary());
		String dp = request.getParameter("depart");
		System.out.println("=>>" + dp);
		Depart depart = departRes.findByname(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByroleName(rl);
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
