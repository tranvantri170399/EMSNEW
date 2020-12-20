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

import com.example.demo.entities.Attandence;
import com.example.demo.entities.ClassroomStudent;
import com.example.demo.entities.ExamResult;
import com.example.demo.entities.Parent;
import com.example.demo.entities.Schedule;
import com.example.demo.entities.Student;
import com.example.demo.entities.User;
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
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.StudyShiftResponsitory;
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
	/*
	 * @RequestMapping(value = { "/Page/THANHTICH" }) public String
	 * thanhtichSV(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/thanhtich"; }
	 * 
	 * @RequestMapping(value = { "/Page/DIEMDANH" }) public String
	 * diemdanh(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/diemdanh"; }
	 * 
	 * @RequestMapping(value = { "/Page/HOCPHI" }) public String
	 * ktHocphi(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/hocphi"; }
	 * 
	 * @RequestMapping(value = { "/Page/LICHHOC" }) public String
	 * lichhocSV(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/lichhoc"; }
	 * 
	 * @RequestMapping(value = { "/Page/DIEMTHEOKY" }) public String
	 * diemtheoky(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/diemtheoky"; }
	 * 
	 * @RequestMapping(value = { "/Page/MONDAHOC" }) public String
	 * mondahoc(@ModelAttribute("User") User user, Model model) {
	 * 
	 * return "/jsp/Page/PageforParent/mondahoc"; }
	 */

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
	AttandenceResponsitory attandenceResponsitory;
	@Autowired
	ExamtypeResponsitory examtypeResponsitory;
	@Autowired
	ExamResponsitory examResponsitory;
	@Autowired
	ExamResultResponsitory examResultResponsitory;
	@RequestMapping(value = { "parent/thoikhoabieu" })
	public String loadthoikhoabieu(Model model,@RequestParam("userid") String userid) {
		System.out.println("out>>>"+userid);
		List<Student> student= studentResponsitory.findcustom(userid);
		for (Student student2 : student) {
			List<ClassroomStudent> classid=classroomStudentrespon.findcustom(student2.getId());
			for (ClassroomStudent u : classid) {
				List<Schedule> schedule= scheduleResponsitory.findcustom(u.getClassroom().getId());
				model.addAttribute("List",schedule);
			}		
		}
		
		return "/jsp/Page/PageforParent/thoikhoabieu";
	}
	
//	parent/diemdanh
	@RequestMapping(value = { "parent/diemdanh" })
	public String loaddiemdanh(Model model,@RequestParam("userid") String userid,@ModelAttribute("attandence") Attandence attan) {
		List<Student> student= studentResponsitory.findcustom(userid);
		for (Student student2 : student) {
			List<ClassroomStudent> classroomStudents= classroomStudentrespon.findcustom(student2.getId());
			model.addAttribute("Lists", classroomStudents);
			List<Attandence>  attandences = attandenceResponsitory.findcustomstudent(student2.getId());
			model.addAttribute("List", attandences	);	
		}
		
		return "/jsp/Page/PageforParent/diemdanh";
	}
	
	@RequestMapping(value = { "parent/bangdiem" })
	public String bangdiem(Model model,@RequestParam("userid") String userid,@ModelAttribute("attandence") Attandence attan) {
		List<Student> liststudent= studentResponsitory.findcustom(userid);
		for (Student student : liststudent) {
			List<ExamResult> list = examResultResponsitory.findcustomstudentid(student.getId());
			model.addAttribute("List",list);
		}
		
		return "/jsp/Page/PageforParent/bangdiem";
	}
	
}

