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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Device;
import com.example.demo.entities.SchoolRoom;
import com.example.demo.entities.SchoolroomDevice;
import com.example.demo.repository.DeviceResponsitory;
import com.example.demo.repository.SchoolroomDeviceResponsitory;
import com.example.demo.repository.SchoolroomResponsitory;

@Controller
public class csvcController {
	
	@Autowired
	SchoolroomResponsitory roomrespo;
	@Autowired
	DeviceResponsitory devicerepo;
	@Autowired
	SchoolroomDeviceResponsitory SRDrespon;
	/*Xu li phong hoc*/
	@RequestMapping(value = { "/DSphonghoc" })
	public String loadDSPhonghoc(Model model, @ModelAttribute("room") SchoolRoom room) {
		List<SchoolRoom> roomlist= roomrespo.findAll();
		model.addAttribute("List", roomlist);
		return "/jsp/Page/PageforAdmin/DSphonghoc";
	}
	
	@RequestMapping(value = { "/save/schoolroom" })
	public String saveDSPhonghoc(Model model, @ModelAttribute("room") SchoolRoom room) {
		List<SchoolRoom> roomlist= roomrespo.findAll();
		SchoolRoom lastid= roomlist.get(roomlist.size()-1);
		String id = lastid.getId();
		String splitID = id.substring(2);
		System.out.println("==> " + splitID);
		int idNum = Integer.parseInt(splitID) + 1;
		String outID = null;
		if (idNum < 10) {
			outID = "TH00" + idNum;
		} else if (idNum >= 10 && idNum < 100) {
			outID = "TH0" + idNum;
		} else if (idNum >= 100 && idNum < 1000) {
			outID = "TH" + idNum;
		}
		
		SchoolRoom sr= new SchoolRoom();
		
		sr.setId(outID);
		sr.setName(room.getName());
		sr.setSchoolroomnumber(room.getSchoolroomnumber());
		sr.setSurfacearea(room.getSurfacearea());
		roomrespo.save(sr);
		List<SchoolRoom> roomlists= roomrespo.findAll();
		model.addAttribute("List", roomlists);
		return "/jsp/Page/PageforAdmin/DSphonghoc";
	}

	@RequestMapping(value = { "/updateSchoolRoom" },method = RequestMethod.GET)
	public String updateSchoolRoom(Model model, @ModelAttribute("room") SchoolRoom room, HttpServletRequest request,
			@RequestParam("id") String id) {
		Optional<SchoolRoom> theroom = roomrespo.findById(id);
		SchoolRoom Sroom=theroom.get();
		List<SchoolRoom> listroom= new ArrayList<SchoolRoom>();
		listroom.add(Sroom);
		model.addAttribute("List", listroom);
		return "/jsp/Page/PageforAdmin/UpdatePhonghoc";
	}
	
	@RequestMapping(value = { "/updateSchoolRooms" })
	public String updateSchoolRooms(Model model, @ModelAttribute("room") SchoolRoom room, HttpServletRequest request,
			@RequestParam("id") String id) {
		Optional<SchoolRoom> theroom = roomrespo.findById(id);
		SchoolRoom Sroom=theroom.get();
		Sroom.setName(room.getName());
		Sroom.setSchoolroomnumber(room.getSchoolroomnumber());
		Sroom.setSurfacearea(room.getSurfacearea());
		roomrespo.save(Sroom);
		List<SchoolRoom> listroom=roomrespo.findAll();
		model.addAttribute("List", listroom);
		return "/jsp/Page/PageforAdmin/DSphonghoc";
	}
	
	@RequestMapping(value = { "/deleteSchoolRoom" })
	public String DelSchoolRoom(Model model, @ModelAttribute("room") SchoolRoom room, HttpServletRequest request,
			@RequestParam("id") String id) {
		roomrespo.deleteById(id);
		List<SchoolRoom> roomlist= roomrespo.findAll();
		model.addAttribute("List", roomlist);
		return "/jsp/Page/PageforAdmin/DSphonghoc";
	}
	
	/*Xu li phong hoc*/
	
	/*Xu li Thiet bi*/
	@RequestMapping(value = { "/DSthietbi" })
	public String loadDSthietbi(Model model, @ModelAttribute("room") Device room) {
		List<Device> devicelist= devicerepo.findAll();
		model.addAttribute("List", devicelist);
		return "/jsp/Page/PageforAdmin/DSthietbi";
	}

	
	@RequestMapping(value = { "/deleteDevice" })
	public String Delthietbi(Model model, @ModelAttribute("room") Device room, HttpServletRequest request,
			@RequestParam("id") Integer id) {
		devicerepo.deleteById(id);
		List<Device> devicelist= devicerepo.findAll();
		model.addAttribute("List", devicelist);
		return "/jsp/Page/PageforAdmin/DSthietbi";
	}
	
	@RequestMapping(value = { "/save/device" })
	public String savedevice(Model model, @ModelAttribute("room") Device room) {
		List<Device> devicelist= devicerepo.findAll();
		Device lastid= devicelist.get(devicelist.size()-1);
		int id = lastid.getId()+1;
		Device device= new Device();
		
		device.setId(id);
		device.setDeviceName(room.getDeviceName());
		device.setAmount(room.getAmount());
		device.setStatus(room.getStatus());
		device.setPrice(room.getPrice());
		devicerepo.save(device);
		List<Device> devicelists= devicerepo.findAll();
		model.addAttribute("List", devicelists);
		return "/jsp/Page/PageforAdmin/DSthietbi";
	}
	
	@RequestMapping(value = { "/updateDevice" })
	public String updateDevice(Model model, @ModelAttribute("room") Device room, HttpServletRequest request,
			@RequestParam("id") int id) {
		Optional<Device> theroom = devicerepo.findById(id);
		Device Sroom=theroom.get();
		List<Device> listroom= new ArrayList<>();
		listroom.add(Sroom);
		model.addAttribute("List", listroom);
		return "/jsp/Page/PageforAdmin/UpdateThietbi";
	}
	
	@RequestMapping(value = { "/updateFormDevice" })
	public String updateFormDevice(Model model, @ModelAttribute("room") Device room, HttpServletRequest request,
			@RequestParam("id") int id) {
		Optional<Device> theroom = devicerepo.findById(id);
		Device Sroom=theroom.get();
		Sroom.setDeviceName(room.getDeviceName());
		Sroom.setAmount(room.getAmount());
		Sroom.setStatus(room.getStatus());
		Sroom.setPrice(room.getPrice());
		devicerepo.save(Sroom);
		List<Device> listroom= devicerepo.findAll();
		model.addAttribute("List", listroom);
		return "/jsp/Page/PageforAdmin/DSthietbi";
	}
	
	/*Xu li Thiet bi*/
	
	/*Xu li phong hoc Thiet bi*/
	@RequestMapping(value = { "/DSthietbiphonghoc" })
	public String loadDSthietbiphonghoc(Model model, @ModelAttribute("room") SchoolroomDevice room) {
		List<SchoolroomDevice> roomDevice= SRDrespon.findAll();
		model.addAttribute("List", roomDevice);
		List<SchoolRoom> list= roomrespo.findAll();
		model.addAttribute("Lists", list);
		
		List<Device> listd= devicerepo.findAll();
		model.addAttribute("Listds", listd);
		return "/jsp/Page/PageforAdmin/DSthietbiphonghoc";
	}
	
	@RequestMapping(value = { "/updateroomDevice" })
	public String updateroomDevice(Model model, @ModelAttribute("room") SchoolroomDevice room, HttpServletRequest request,
			@RequestParam("id") int id) {
		Optional<SchoolroomDevice> theroom = SRDrespon.findById(id);
		SchoolroomDevice Sroom=theroom.get();
		List<SchoolroomDevice> listroom= new ArrayList<>();
		listroom.add(Sroom);
		model.addAttribute("List", listroom);
		
		List<SchoolRoom> list= roomrespo.findAll();
		model.addAttribute("Lists", list);
		
		List<Device> listd= devicerepo.findAll();
		model.addAttribute("Listds", listd);
		
		return "/jsp/Page/PageforAdmin/Updatethietbiphong";
	}
	
	@RequestMapping(value = { "/updateSchoolroomDevice" })
	public String updateSchoolroomDevice(Model model, @ModelAttribute("room") SchoolroomDevice room, HttpServletRequest request,
			@RequestParam("id") int id) {
		Optional<SchoolroomDevice> theroom = SRDrespon.findById(id);
		SchoolroomDevice Sroom=theroom.get();		
		String schoolname= request.getParameter("schoolroom");	
		SchoolRoom schoolRoom = roomrespo.findByname(schoolname);		
		String devicename= request.getParameter("testdevice");
		System.out.println("test==>> "+devicename);
		Device devicess = devicerepo.findBydeviceName(devicename);		
		Sroom.setSchoolroom(schoolRoom);
		Sroom.setdevice(devicess);
		Sroom.setAmount(room.getAmount());
		SRDrespon.save(Sroom);
		List<SchoolroomDevice> listroomss= SRDrespon.findAll();
		model.addAttribute("List", listroomss);
		return "/jsp/Page/PageforAdmin/DSthietbiphonghoc";
	}
	@RequestMapping(value = { "/save/SchoolroomDevice" })
	public String saveSchoolroomDevice(Model model, @ModelAttribute("room") SchoolroomDevice room, HttpServletRequest request) {
		List<SchoolroomDevice> theroom = SRDrespon.findAll();
		SchoolroomDevice lastid=theroom.get(theroom.size()-1);	
		int d = lastid.getId()+1;
		SchoolroomDevice Sroom= new SchoolroomDevice();
		String schoolname= request.getParameter("schoolroom");	
		SchoolRoom schoolRoom = roomrespo.findByname(schoolname);		
		String devicename= request.getParameter("testdevice");
		System.out.println("test==>> "+devicename);
		Device devicess = devicerepo.findBydeviceName(devicename);		
		Sroom.setId(d);
		Sroom.setSchoolroom(schoolRoom);
		Sroom.setdevice(devicess);
		Sroom.setAmount(room.getAmount());
		SRDrespon.save(Sroom);
		List<SchoolroomDevice> listroomss= SRDrespon.findAll();
		model.addAttribute("List", listroomss);
		return "/jsp/Page/PageforAdmin/DSthietbiphonghoc";
	}
	
	@RequestMapping(value = { "/deleteroomDevice" })
	public String Delthietbiphong(Model model, @ModelAttribute("room") SchoolroomDevice room, HttpServletRequest request,
			@RequestParam("id") Integer id) {
		SRDrespon.deleteById(id);
		List<SchoolroomDevice> listroomss= SRDrespon.findAll();
		model.addAttribute("List", listroomss);
		return "/jsp/Page/PageforAdmin/DSthietbiphonghoc";
	}
	/*Xu li phong hoc Thiet bi*/
}
