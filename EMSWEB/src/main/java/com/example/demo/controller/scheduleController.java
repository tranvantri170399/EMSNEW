package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Amphitheater;
import com.example.demo.entities.Classroom;
import com.example.demo.entities.Course;
import com.example.demo.entities.Schedule;
import com.example.demo.entities.SchoolRoom;
import com.example.demo.entities.StudyShift;
import com.example.demo.repository.AmphiResponsitory;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.CourseResponsitory;
import com.example.demo.repository.ScheduleResponsitory;
import com.example.demo.repository.SchoolroomResponsitory;
import com.example.demo.repository.StudyShiftResponsitory;

@Controller
public class scheduleController {
	@Autowired
	StudyShiftResponsitory studyShiftResponsitory;
	/*StudyShift*/
	@RequestMapping(value = { "/DScahoc" })
	public String loadDSCaHoc(Model model, @ModelAttribute("studyShift") StudyShift studyShift) {
		List<StudyShift> list= studyShiftResponsitory.findAll();
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/DScahoc";
	}
	
	@RequestMapping(value = { "/save/studyShift" })
	public String saveDSCaHoc(Model model, @ModelAttribute("studyShift") StudyShift studyShift) {
		List<StudyShift> list= studyShiftResponsitory.findAll();
		StudyShift lastid= list.get(list.size()-1);
		int id =lastid.getId()+1;
		StudyShift study= new StudyShift();
		study.setId(id);
		study.setNameShift(studyShift.getNameShift());
		study.setStartingTime(studyShift.getStartingTime());
		study.setEndTime(studyShift.getEndTime());
		studyShiftResponsitory.save(study);
		List<StudyShift> lists= studyShiftResponsitory.findAll();
		model.addAttribute("List",lists);
		return "/jsp/Page/PageforAdmin/DScahoc";
	}
	@RequestMapping(value = { "/deleteStudyShift" })
	public String deleteDSCaHoc(Model model, @ModelAttribute("studyShift") StudyShift studyShift,@RequestParam("id") int id) {
		studyShiftResponsitory.deleteById(id);
		List<StudyShift> list= studyShiftResponsitory.findAll();
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/DScahoc";
	}
	
	@RequestMapping(value = { "/updateStudyShifttoform" })
	public String updateStudyShifttoform(Model model, @ModelAttribute("studyShift") StudyShift studyShift,@RequestParam("id") int id) {
		Optional<StudyShift> studylist= studyShiftResponsitory.findById(id);
		StudyShift study=studylist.get();
		List<StudyShift> list= new ArrayList<StudyShift>();
		list.add(study);
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/UpdateCahoc";
	}
	@RequestMapping(value = { "/updateStudyShift" })
	public String updateStudyShift(Model model, @ModelAttribute("studyShift") StudyShift studyShift,@RequestParam("id") int id) {
		Optional<StudyShift> studylist= studyShiftResponsitory.findById(id);
		StudyShift study=studylist.get();
		study.setNameShift(studyShift.getNameShift());
		study.setStartingTime(studyShift.getStartingTime());
		study.setEndTime(studyShift.getEndTime());
		studyShiftResponsitory.save(study);
		List<StudyShift> list= studyShiftResponsitory.findAll();
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/DScahoc";
	}
	/*StudyShift*/
	/*---------------------------------------------------------------------------------*/
	/*schedule*/
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
	@RequestMapping(value = { "/DSlichhoc" })
	public String loadDSLichhoc(Model model, @ModelAttribute("schedule") Schedule schedule) {		
		List<Schedule> list= scheduleResponsitory.findAll();
		model.addAttribute("List",list);
		List<Amphitheater> lista= amphiResponsitory.findAll();
		model.addAttribute("Lista",lista);
		List<Classroom> listc= classroomResponsitory.findAll();
		model.addAttribute("Listc",listc);
		
		List<SchoolRoom> listsh= schoolroomResponsitory.findAll();
		model.addAttribute("Listsh",listsh);
		
		List<StudyShift> lists= studyShiftResponsitory.findAll();
		model.addAttribute("Lists",lists);
		
		List<Course> listco= courseResponsitory.findAll();
		model.addAttribute("Listco",listco);
		
		return "/jsp/Page/PageforAdmin/DSlichhoc";
	}
	
	
	@RequestMapping(value = { "/save/schedule" })
	public String saveDSlichHoc(Model model, @ModelAttribute("schedule") Schedule schedule,HttpServletRequest request) {
		List<Schedule> list= scheduleResponsitory.findAll();
		Schedule lastid= list.get(list.size()-1);
		String tempid= lastid.getId();
		int id =Integer.parseInt(tempid)+1;
		String newid =""+id;
		String aname= request.getParameter("testamphitheater");
		Amphitheater a=amphiResponsitory.findByamphitheaterName(aname);
		String name= request.getParameter("classroom");
		Classroom classroom=classroomResponsitory.findByname(name);
		
		String shoolname= request.getParameter("schoolroom");
		SchoolRoom schoolRoom=schoolroomResponsitory.findByname(shoolname);
		
		String nameShift= request.getParameter("teststudyShift");
		StudyShift shift = studyShiftResponsitorys.findBynameShift(nameShift);
		
		String coursename= request.getParameter("course");
		Course course=courseResponsitory.findByname(coursename);
		
		Schedule schedulenew= new Schedule();
		schedulenew.setId(newid);
		schedulenew.setDate(schedule.getDate());
		schedulenew.setAmphitheater(a);
		schedulenew.setClassroom(classroom);
		schedulenew.setschoolroom(schoolRoom);
		schedulenew.setStudyShift(shift);
		schedulenew.setCourse(course);
		schedulenew.setDes(schedule.getDes());
		
		scheduleResponsitory.save(schedulenew);
		List<Schedule> lists= scheduleResponsitory.findAll();
		model.addAttribute("List",lists);
		return "/jsp/Page/PageforAdmin/DSlichhoc";
	}
	/*---------------------------------------------------------------------------------*/
	/*schedule*/
	@RequestMapping(value = { "/DSKhoahocchitiet" })
	public String loadDSKhoahocchitiet(Model model, @ModelAttribute("course") Course course) {
		List<Course> list= courseResponsitory.findAll();
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/DSkhoahoc";
	}
}
