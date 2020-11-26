package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Schedule;
import com.example.demo.entities.StudyShift;
import com.example.demo.repository.ScheduleResponsitory;
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
	@RequestMapping(value = { "/DSlichhoc" })
	public String loadDSLichhoc(Model model, @ModelAttribute("schedule") Schedule schedule) {		
		List<Schedule> list= scheduleResponsitory.findAll();
		model.addAttribute("List",list);
		return "/jsp/Page/PageforAdmin/DSlichhoc";
	}
	
}
