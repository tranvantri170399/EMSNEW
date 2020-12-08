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

import com.example.demo.entities.Classroom;
import com.example.demo.entities.ClassroomStudent;
import com.example.demo.entities.Course;
import com.example.demo.entities.Schedule;
import com.example.demo.entities.Teacher;
import com.example.demo.entities.User;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.ClassroomStudentResponsitory;
import com.example.demo.repository.CourseResponsitory;
import com.example.demo.repository.ScheduleResponsitory;
import com.example.demo.repository.SchoolroomResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.StudyShiftResponsitory;
import com.example.demo.repository.TeacherResponsitory;
import com.example.demo.repository.UserResponsitory;

@Controller
public class TeacherController {
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
	TeacherResponsitory teacherResponsitory;
	@Autowired
	UserResponsitory userResponsitory;
	//show list schedule
	@RequestMapping(value = { "teacher/thoikhoabieu" })
	public String loadthoikhoabieu(Model model,@RequestParam("teacherid") String teacherid) {
		List<Course> couseid=courseResponsitory.findcustomteacher(teacherid);
		for (Course u : couseid) {
			System.out.println("outti>>>"+u.getId());
			List<Schedule> schedule= scheduleResponsitory.findcustomCouse(u.getId());
			model.addAttribute("List",schedule);
		}		
		return "/jsp/Page/PageforTeacher/thoikhoabieuTeacher";
	}
	@RequestMapping(value = { "teacher/liststudent" })
	public String loadliststudents(Model model,@RequestParam("teacherid") String teacherid) {
		List<Course> couseid=courseResponsitory.findcustomteacher(teacherid);
		for (Course u : couseid) {
			System.out.println("outti11>>>"+u.getId());
			List<Schedule> schedule= scheduleResponsitory.findcustomCouse(u.getId());
			for (Schedule s : schedule) {
				System.out.println("out lop id>>>"+s.getClassroom().getId());
				Classroom classroom= classroomResponsitory.findByid(s.getClassroom().getId());
				System.out.println("outxxx>>>"+classroom.getId());
				List<ClassroomStudent> croomstudent=classroomStudentrespon.findcustomclass(classroom.getId());
				
				model.addAttribute("List",croomstudent);
			}
			
			
		}		
		return "/jsp/Page/PageforTeacher/DSHocsinhtronglop";
	}
	
	@RequestMapping(value = { "Page/INFOTeacher" })
	public String loadinfo(Model model,@RequestParam("teacherid") String teacherid) {
		List<Teacher> teacher= teacherResponsitory.findcustom(teacherid);
		model.addAttribute("List",teacher);
		return "/jsp/Page/PageforTeacher/lilich";
	}
	@RequestMapping(value = { "Page/UpdatepassTeacher" })
	public String loadUpdatepassTeacher(Model model,@ModelAttribute("passUpdate") User user,@RequestParam("teacherid") String teacherid) {
		List<Teacher> teacher= teacherResponsitory.findcustom(teacherid);
		model.addAttribute("List",teacher);
		List<User> list= userResponsitory.findcusTeacherID(teacherid);
		model.addAttribute("ListTeacher",list);
		return "/jsp/Page/PageforTeacher/doimatkhau";
	}
	@RequestMapping(value = { "/updatePassTeacher" })
	public String doiUpdatepassTeacher(Model model,@ModelAttribute("passUpdate") User user,HttpServletRequest request) {
		User u = userResponsitory.findByusername(user.getUsername());
		System.out.println("===>@@>"+user.getPassword());
		String pass= user.getPassword();
		String passo=u.getPassword();
		String pasnew = request.getParameter("passnew");
		System.out.println("===>>pass trong mang:"+pass);
		if (pass.equals(passo)) {
			User us = userResponsitory.findByusername(user.getUsername());
			us.setPassword(pasnew);
			userResponsitory.save(us);
//			List newlist= new ArrayList<>();
			model.addAttribute("mess","1");
		}else {
			model.addAttribute("mess","2");
		}
		List<User> list= userResponsitory.findcustom(user.getUsername());
		model.addAttribute("ListTeacher",list);
		return "/jsp/Page/PageforTeacher/doimatkhau";
	}
	
//	
}
