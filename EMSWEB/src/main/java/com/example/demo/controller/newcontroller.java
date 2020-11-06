package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.*;
import com.example.demo.repository.SchoolroomAmphiResponsitory;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.AttandenceResponsitory;
import com.example.demo.repository.ClassroomStudentResponsitory;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.CourseResponsitory;
import com.example.demo.repository.ExamResponsitory;
import com.example.demo.repository.MajorSemesterResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.StaffResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.TeacherResponsitory;
import com.example.demo.repository.UserResponsitory;
import com.example.demo.repository.ParentResponsitory;

//@RestController
@Controller
public class newcontroller {

	@Autowired
	AmphiResponsitory amrep;

	@Autowired
	StaffResponsitory srep;
	@Autowired
	RoleRespository rrep;
	
	@Autowired
	SchoolroomAmphiResponsitory amphiIDResponsitory;
	
	@Autowired
	TeacherResponsitory	teacherrepo;
	
	@Autowired
	StudentResponsitory sturepo;
	
	@Autowired
	AttandenceResponsitory attrep;
	
	@Autowired
	CourseResponsitory Courrep;
	
	@Autowired
	ClassroomStudentResponsitory classrep;
	
	@Autowired
	ClassroomResponsitory classroomrep;
	
	@Autowired
	ExamResponsitory exrep;
	
	@Autowired
	MajorSemesterResponsitory MajorseRep;
	
	@Autowired
	UserResponsitory UserRep;
	
	@Autowired
	ParentResponsitory parentRep;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String index() {
		return "/jsp/index";
	}
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin() {
		return "/jsp/AdminPage";
	}
	
	@RequestMapping(value = { "/Page/thoikhoabieu" }, method = RequestMethod.GET)
	public String loadthoikhoabieu(Model model) {
//		List<Staff> list = srep.findAll();
//		model.addAttribute("List", list);
		return "/jsp/Page/diemdanh";
	}
	

	@RequestMapping(value = { "/hello" }, method = RequestMethod.GET)
	public String hello() {
		return "jsp/templateStudent";
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String hello11() {
		return "layout/layout";
	}

	@RequestMapping(value = { "/load" }, method = RequestMethod.GET)
	public String index(Model model) {
		List<Staff> list = srep.findAll();
		model.addAttribute("List", list);
		return "/jsp/loadlist";
	}

	@RequestMapping(value = { "/loads" })
	public String loadstaff() {
		List<Staff> iterator = srep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadTeacher" })
	public String loadteacher(Model model) {
		List<Teacher> iterator = teacherrepo.findAll();
		System.out.println("next");
		model.addAttribute("List", iterator);
		return "/jsp/loadteacher";
	}
	
	@RequestMapping(value = { "/loadStudent" })
	public String loadstudent() {
		Iterable<Student> iterator = sturepo.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadParent" })
	public String loadparent() {
		Iterable<Parent> iterator = parentRep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadUser" })
	public String loadUser() {
		Iterable<User> iterator = UserRep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadAttan" })
	public String loadAttan() {
		List<Attandence> iterator = attrep.findAll();
		return iterator.toString();
	}
	@RequestMapping(value = { "/loadCourse" })
	public String loadCourse() {
		List<Course> iterator = Courrep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadClassroomStudent" })
	public String loadClassroomStudent() {
		List<ClassroomStudent> iterator = classrep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadClassroom" })
	public String loadClassroom() {
		List<Classroom> iterator = classroomrep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadExam" })
	public String loadexam(Model model) {
		List<Exam> iterator = exrep.findAll();
		model.addAttribute("List", iterator);
		return "/jsp/loadExam";
//		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadMaSe" })
	public String loadMajorSe() {
		List<MajorsSemester> iterator = MajorseRep.findAll();
		return iterator.toString();
	}
	
	@RequestMapping(value = { "/loadSchoolroomAmphi" })
	public String loadSchoolroomAmphi(Model model) {
		List<SchoolroomAmphi> iterator = amphiIDResponsitory.findAll();
//		return iterator.toString();
		model.addAttribute("List", iterator);
		return "/jsp/loadSchoolroomAmphi";
	}

	@RequestMapping(value = { "/loadAmphi" })
	public String loadsAmphi(Model model) {
		List<Amphitheater> iterator = amrep.findAll();
		model.addAttribute("List", iterator);
		return "/jsp/loadamphi";
	}
	

}
