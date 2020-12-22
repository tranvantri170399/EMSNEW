package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Attandence;
import com.example.demo.entities.ClassroomStudent;
import com.example.demo.entities.ExamResult;
import com.example.demo.entities.Parent;
import com.example.demo.entities.Schedule;
import com.example.demo.entities.Semester;
import com.example.demo.entities.Student;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.AttandenceResponsitory;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.ClassroomStudentResponsitory;
import com.example.demo.repository.CourseResponsitory;
import com.example.demo.repository.ExamResponsitory;
import com.example.demo.repository.ExamResultResponsitory;
import com.example.demo.repository.ExamtypeResponsitory;
import com.example.demo.repository.ParentResponsitory;
import com.example.demo.repository.ScheduleResponsitory;
import com.example.demo.repository.SchoolroomResponsitory;
import com.example.demo.repository.SemesterResponsitory;
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
	@Autowired
	AttandenceResponsitory attandenceResponsitory;
	@Autowired
	ExamtypeResponsitory examtypeResponsitory;
	@Autowired
	ExamResponsitory examResponsitory;
	@Autowired
	ExamResultResponsitory examResultResponsitory;
	@Autowired
	SemesterResponsitory semesterResponsitory;
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
	//diem danh
	@RequestMapping(value = { "Student/diemdanh" })
	public String loaddiemdanh(Model model,@RequestParam("Studentid") String studentid,@ModelAttribute("attandence") Attandence attan) {
		List<ClassroomStudent> classroomStudents= classroomStudentrespon.findcustom(studentid);
		model.addAttribute("Lists", classroomStudents);
		List<Attandence>  attandences = attandenceResponsitory.findcustomstudent(studentid);
		model.addAttribute("List", attandences	);
		return "/jsp/Page/diemdanh";
	}
	// bang diem
	@RequestMapping(value = { "Student/bangdiem" })
	public String loadbangdiem(Model model,@RequestParam("Studentid") String studentid,@ModelAttribute("attandence") Attandence attan) {
		List<ExamResult> list = examResultResponsitory.findcustomstudentid(studentid);
		model.addAttribute("List",list);
		return "/jsp/Page/bangdiem";
	}
	String studentidtemp=null;
	@RequestMapping(value = { "Student/bangdiemtheoky" })
	public String loadbangdiemtheoky(Model model,@RequestParam("Studentid") String studentid,@ModelAttribute("attandence") Attandence attan) {
		studentidtemp=studentid;
		List<Semester> list = semesterResponsitory.findAll();
		model.addAttribute("Lists",list);
		return "/jsp/Page/diemtheoky";
	}
	@RequestMapping(value = { "/mark/followsemester" })
	public String loadbangdiemtheokys(Model model,@ModelAttribute("attandence") Attandence attan,HttpServletRequest request) {
		List<Semester> list = semesterResponsitory.findAll();
		model.addAttribute("Lists",list);
		String name = request.getParameter("namesemester");
		List<ExamResult> lists = examResultResponsitory.findcustomtheoky(studentidtemp, name);
		model.addAttribute("List",lists);
		return "/jsp/Page/diemtheoky";
	}
	
	@RequestMapping(value = { "Student/mondahoc" })
	public String loadmondahoc(Model model,@RequestParam("Studentid") String studentid,@ModelAttribute("attandence") Attandence attan) {
		List<ExamResult> list = examResultResponsitory.findcustomstudentid(studentid);
		model.addAttribute("List",list);
		return "/jsp/Page/mondahoc";
	}
}
