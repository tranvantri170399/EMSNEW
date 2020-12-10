package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.ClassroomStudent;
import com.example.demo.entities.Parent;
import com.example.demo.entities.Schedule;
import com.example.demo.entities.Student;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.ClassroomStudentResponsitory;
import com.example.demo.repository.CourseResponsitory;
import com.example.demo.repository.ParentResponsitory;
import com.example.demo.repository.ScheduleResponsitory;
import com.example.demo.repository.SchoolroomResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.StudyShiftResponsitory;


@Controller
public class StudentController {
	@Autowired
	ScheduleResponsitory scheduleResponsitory;
	@Autowired
	AmphiResponsitory amphiResponsitory;
	@Autowired
	ClassroomResponsitory classroomResponsitory;
	@Autowired 
	CourseResponsitory courseResponsitory;
	@Autowired
	SchoolroomResponsitory schoolroomResponsitory;
	@Autowired
	StudyShiftResponsitory studyShiftResponsitorys;
	@Autowired
	StudentResponsitory studentResponsitory;
	@Autowired
	ClassroomStudentResponsitory classroomStudentrespon;
	@Autowired
	ParentResponsitory parentResponsitory;
	
	@RequestMapping(value = { "Student/thoikhoabieu" })
	public String loadthoikhoabieu(Model model,@RequestParam("Studentid") String studentid) {
		Student student= studentResponsitory.findByid(studentid);
		List<ClassroomStudent> classid=classroomStudentrespon.findcustom(student.getId());
		for (ClassroomStudent u : classid) {
			List<Schedule> schedule= scheduleResponsitory.findcustom(u.getClassroom().getId());
			model.addAttribute("List",schedule);
		}		
		return "/jsp/Page/thoikhoabieu";
	}
	@RequestMapping(value = { "Student/lichthi" })
	public String loadlichthi(Model model,@RequestParam("Studentid") String studentid) {
		Student student= studentResponsitory.findByid(studentid);
		List<ClassroomStudent> classid=classroomStudentrespon.findcustom(student.getId());
		for (ClassroomStudent u : classid) {
			List<Schedule> schedule= scheduleResponsitory.findcustomlichthi(u.getClassroom().getId(),"Lịch Thi");
			model.addAttribute("List",schedule);
		}		
		return "/jsp/Page/lichthi";
	}
	
	@RequestMapping(value = { "Student/lilich" })
	public String loadlilich(Model model,@RequestParam("Studentid") String studentid) {
		List<Student> studentlist= new ArrayList<Student>();
		Student student= studentResponsitory.findByid(studentid);
		studentlist.add(student);
		List<Parent> parentList = parentResponsitory.findcustom(student.getParent().getId());
		model.addAttribute("Liststudent", studentlist);
		model.addAttribute("List", parentList);
		return "/jsp/Page/lilich";
	}
	@RequestMapping(value = { "Student/Tinhtrangsinhvien" })
	public String loadTinhtrangsinhvien(Model model,@RequestParam("Studentid") String studentid) {
		List<Student> studentlist= new ArrayList<Student>();
		Student student= studentResponsitory.findByid(studentid);
		studentlist.add(student);
		List<Parent> parentList = parentResponsitory.findcustom(student.getParent().getId());
		model.addAttribute("Liststudent", studentlist);
		model.addAttribute("List", parentList);
		return "/jsp/Page/tinhtrangsinhvien";
	}
}
