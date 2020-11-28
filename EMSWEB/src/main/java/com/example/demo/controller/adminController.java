package com.example.demo.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.StaticApplicationContext;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Classroom;
import com.example.demo.entities.ClassroomStudent;
import com.example.demo.entities.Depart;
import com.example.demo.entities.Majors;
import com.example.demo.entities.Parent;
import com.example.demo.entities.Role;
import com.example.demo.entities.Semester;
import com.example.demo.entities.Staff;
import com.example.demo.entities.Student;
import com.example.demo.entities.Subject;
import com.example.demo.entities.Teacher;
import com.example.demo.entities.User;
import com.example.demo.model.dateobject;
import com.example.demo.repository.ClassroomResponsitory;
import com.example.demo.repository.ClassroomStudentResponsitory;
import com.example.demo.repository.DepartResponsitory;
import com.example.demo.repository.MajorsResponsitory;
import com.example.demo.repository.ParentResponsitory;
import com.example.demo.repository.RoleRespository;
import com.example.demo.repository.SemesterResponsitory;
import com.example.demo.repository.StaffResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.example.demo.repository.SubjectResponsitory;
import com.example.demo.repository.TeacherResponsitory;
import com.example.demo.repository.UserResponsitory;
import com.example.demo.service.DepartService;
import com.example.demo.service.StudentService;
import com.example.demo.service.TeacherService;

@Controller
public class adminController {
	public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/resources/FileUpload";
	// teacher
	@Autowired
	private TeacherService teacherService;
	@Autowired
	TeacherResponsitory teacherResponsitory;
	//
	// student
	// private StudentService studentService;

	@Autowired
	StudentResponsitory studentResponsitory;

	// depart
	// DepartService departService;
	@Autowired
	DepartResponsitory departResponsitory;

	//
	@Autowired
	ParentResponsitory parentResponsitory;
	//
	@Autowired
	SubjectResponsitory subjectResponsitory;
	@Autowired
	MajorsResponsitory majorsResponsitory;
	//
	@Autowired
	ClassroomResponsitory classroomResponsitory;
	//
	@Autowired
	SemesterResponsitory semesterResponsitory;
	@Autowired
	ClassroomStudentResponsitory classroomStudentRespon;
	// controller teacher//
	@GetMapping("/DSgiaovien")
	public String listTeacher(Model model, @ModelAttribute("teacherNew") Teacher teacher) {
		return findPaginated(1, "id", "asc", model);
	}

	@GetMapping("/page/{pageNo}")
	public String findPaginated(@PathVariable(value = "pageNo") int pageNo, @RequestParam("sortField") String sortField,
			@RequestParam("sortDir") String sortDir, Model model) {
		int pageSize = 5;

		Page<Teacher> page = teacherService.findPaginated(pageNo, pageSize, sortField, sortDir);
		List<Teacher> listTeacher = page.getContent();
		model.addAttribute("listTeacher", listTeacher);
		List<Depart> departlist = departResponsitory.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		return "/jsp/Page/PageforAdmin/DSgiaovien";
	}

	@RequestMapping(value = "/newTeacher", method = RequestMethod.POST)
	public String saveTeacher(@ModelAttribute("teacherNew") Teacher teacherNew, HttpServletRequest request, Model model,
			@RequestParam("files") MultipartFile[] files) {
		// // lưu giao vien vào cơ sở dữ liệu //
		List<Teacher> teacherList = teacherResponsitory.findAll();
		Teacher lastid = teacherList.get(teacherList.size() - 1);
		String id = lastid.getId();
		String splitID = id.substring(2);
		System.out.println("==> " + splitID);
		int idNum = Integer.parseInt(splitID) + 1;
		String outID = null;
		if (idNum < 10) {
			outID = "GV00" + idNum;
		} else if (idNum >= 10 && idNum < 100) {
			outID = "GV0" + idNum;
		} else if (idNum >= 100 && idNum < 1000) {
			outID = "GV" + idNum;
		}
		Teacher newTeacher = new Teacher();
		newTeacher.setId(outID);
		newTeacher.setFname(teacherNew.getFname());
		newTeacher.setLname(teacherNew.getLname());
		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		newTeacher.setImage(filenames.toString());
		newTeacher.setEmail(teacherNew.getEmail());
		newTeacher.setDob(teacherNew.getDob());
		newTeacher.setPhone(teacherNew.getPhone());
		newTeacher.setAddress(teacherNew.getAddress());
		newTeacher.setStatus(teacherNew.getStatus());
		newTeacher.setLevel(teacherNew.getLevel());
		newTeacher.setSalary(teacherNew.getSalary());
		String dp = request.getParameter("depart");
		Depart depart = departResponsitory.findByname(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByroleName(rl);
		newTeacher.setRole(role);
		newTeacher.setDepart(depart);
		User user = new User(newTeacher.getEmail(), newTeacher.getPhone(), "GV",outID);
		userrespon.save(user);
		teacherResponsitory.save(newTeacher);
		// model.addAttribute("List", teacherList);
		return "redirect:/DSgiaovien";
	}

	// chuyen form update

	@RequestMapping(value = { "/updateForm" })
	public String formTeacher(@ModelAttribute("teacherNew") Teacher teacherNew, Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		Teacher theTeacher = teacherService.getTeacherByid(id);
		List<Teacher> teacherlist = new ArrayList<>();
		teacherlist.add(theTeacher);
		List<Depart> departlist = departResponsitory.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		model.addAttribute("List", teacherlist);
		return "/jsp/Page/PageforAdmin/formupdateTC";
	}

	// update
	@RequestMapping(value = { "/updateTeacher" })
	public String updateTeacher(@ModelAttribute("teacherNew") Teacher teacherNew, Model model,
			HttpServletRequest request, @RequestParam("files") MultipartFile[] files, @RequestParam("id") String id) {

		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("=>>> " + id);
		Teacher theTeacher = teacherService.getTeacherByid(id);

		if (filenames.toString().isEmpty()) {
			System.out.println("null");
		} else {
			theTeacher.setImage(filenames.toString());
		}
		theTeacher.setEmail(teacherNew.getEmail());
		theTeacher.setPhone(teacherNew.getPhone());
		theTeacher.setAddress(teacherNew.getAddress());
		theTeacher.setStatus(teacherNew.getStatus());
		theTeacher.setLevel(teacherNew.getLevel());
		theTeacher.setSalary(teacherNew.getSalary());
		String dp = request.getParameter("depart");
		Depart depart = departResponsitory.findByname(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByroleName(rl);
		theTeacher.setRole(role);
		theTeacher.setDepart(depart);
		teacherService.saveTeacher(theTeacher);
		List<Teacher> teacherList = teacherResponsitory.findAll();
		model.addAttribute("List", teacherList);
		return "redirect:/DSgiaovien";

	}

	// delete
	@GetMapping("/deleteTeacher")
	public String deleteTeacher(@RequestParam("id") String id) {
		teacherService.deleteTeacherByid(id);
		return "redirect:/DSgiaovien";
	}
	// controller teacher//

	@Autowired
	StaffResponsitory staffrep;

	@Autowired
	UserResponsitory userrespon;
	@Autowired
	RoleRespository rolerepon;

	// nhanvien
	@RequestMapping(value = { "/DSnhanvien" })
	public String loadDSnhanvien(Model model, @ModelAttribute("staff") Staff staff) {
		List<Staff> stafflist = staffrep.findAll();
		model.addAttribute("List", stafflist);
		List<Depart> departlist = departResponsitory.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}

	@RequestMapping(value = { "/save/staff" })
	public String SaveDSnhanvien(Model model, @ModelAttribute("staff") Staff staff, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] files) {
		List<Staff> stafflist = staffrep.findAll();
		Staff lastid = stafflist.get(stafflist.size() - 1);
		String id = lastid.getId();
		String splitID = id.substring(2);
		System.out.println("==> " + splitID);
		int idNum = Integer.parseInt(splitID) + 1;
		String outID = null;
		if (idNum < 10) {
			outID = "NV00" + idNum;
		} else if (idNum >= 10 && idNum < 100) {
			outID = "NV0" + idNum;
		} else if (idNum >= 100 && idNum < 1000) {
			outID = "NV" + idNum;
		}
		Staff st = new Staff();
		st.setId(outID);
		st.setFname(staff.getFname());
		st.setLname(staff.getLname());
		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("successfully upload file: " + filenames.toString());
		st.setImage(filenames.toString());
		st.setEmail(staff.getEmail());
		st.setDob(staff.getDob());
		st.setPhone(staff.getPhone());
		st.setAddress(staff.getAddress());
		st.setStatus(staff.getStatus());
		st.setLevel(staff.getLevel());
		st.setSalary(staff.getSalary());
		String dp = request.getParameter("depart");
		Depart depart = departResponsitory.findByname(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByroleName(rl);
		st.setRole(role);
		st.setDepart(depart);
		User user = new User(st.getEmail(), st.getPhone(), "NV",outID);
		userrespon.save(user);
		staffrep.save(st);
		List<Staff> stafflistaffter = staffrep.findAll();
		model.addAttribute("List", stafflistaffter);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}

	@RequestMapping(value = { "/deleteTeacher" })
	public String Delnhanvien(@ModelAttribute("staff") Staff staff, Model model, HttpServletRequest request,
			@RequestParam("fname") String fname) {
		System.out.println("===>>>" + fname);
		Staff sfs = staffrep.findByfname(fname);
		staffrep.delete(sfs);
		List<Staff> staffs = staffrep.findAll();
		model.addAttribute("List", staffs);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}

	@RequestMapping(value = { "/updatestaff" })
	public String Updatenhanvien(@ModelAttribute("staff") Staff staff, Model model, HttpServletRequest request,
			@RequestParam("fname") String fname) {
		System.out.println("===>>>" + fname);
		Staff sfs = staffrep.findByfname(fname);
		List<Staff> staffs = new ArrayList<>();
		staffs.add(sfs);
		List<Depart> departlist = departResponsitory.findAll();
		model.addAttribute("Listdp", departlist);
		List<Role> rolelist = rolerepon.findAll();
		model.addAttribute("Listr", rolelist);
		model.addAttribute("List", staffs);
		return "/jsp/Page/PageforAdmin/Updatenhanvien";
	}

	@RequestMapping(value = { "/updatess" })
	public String Updatenhanvienss(@ModelAttribute("staff") Staff staff, Model model, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] files, @RequestParam("fname") String fname) {
		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("successfully upload files: " + filenames.toString());

		Staff sfs = staffrep.findByfname(fname);
		if (filenames.toString().isEmpty()) {
			System.out.println("null");
		} else {
			sfs.setImage(filenames.toString());
		}
		sfs.setDob(staff.getDob());
		sfs.setEmail(staff.getEmail());
		sfs.setPhone(staff.getPhone());
		sfs.setAddress(staff.getAddress());
		sfs.setLevel(staff.getLevel());
		sfs.setSalary(staff.getSalary());
		String dp = request.getParameter("depart");
		System.out.println("=>>" + dp);
		Depart depart = departResponsitory.findByname(dp);
		String rl = request.getParameter("role");
		Role role = rolerepon.findByroleName(rl);
		sfs.setRole(role);
		sfs.setDepart(depart);
		staffrep.save(sfs);
		List<Staff> stafflist = staffrep.findAll();
		model.addAttribute("List", stafflist);
		return "/jsp/Page/PageforAdmin/DSnhanvien";
	}
	// nhanvien

	// depart

	@RequestMapping(value = { "/DSphongban" })
	public String loadDSPhongban(Model model, @ModelAttribute("departNew") Depart departNew) {
		List<Depart> departlist = departResponsitory.findAll();
		model.addAttribute("List", departlist);

		return "/jsp/Page/PageforAdmin/DSphongban";
	}

	@RequestMapping(value = "/newDepart", method = RequestMethod.POST)
	public String newDepart(@ModelAttribute("departNew") Depart departNew, HttpServletRequest request, Model model) {
		Depart newDepart = new Depart();
		newDepart.setId(departNew.getId());
		newDepart.setName(departNew.getName());
		departResponsitory.save(newDepart);
		return "redirect:/DSphongban";
	}

	@RequestMapping(value = { "/updateFormDP" })
	public String formDepart(@ModelAttribute("departNew") Depart departNew, Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		Depart theDepart = departResponsitory.findByid(id);
		List<Depart> departlist = new ArrayList<>();
		departlist.add(theDepart);
		model.addAttribute("List", departlist);
		return "/jsp/Page/PageforAdmin/formupdateDP";
	}

	@RequestMapping(value = { "/updateDepart" })
	public String updateDepart(@ModelAttribute("departNew") Depart departNew, Model model, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] files, @RequestParam("id") String id) {
		Depart depart = departResponsitory.findByid(id);
		depart.setName(departNew.getName());
		departResponsitory.save(depart);
		return "redirect:/DSphongban";
	}

	// delete
	@GetMapping("/deleteDepart")
	public String deleteDP(@RequestParam("id") String id) {
		departResponsitory.deleteById(id);
		return "redirect:/DSphongban";
	}

	// student//
	@RequestMapping(value = { "/DShocsinh" })
	public String loadDShocsinh(Model model, @ModelAttribute("student") Student student) {
		List<Student> studentlist = studentResponsitory.findAll();
		model.addAttribute("List", studentlist);
		List<Classroom> classroomlist= classroomResponsitory.findAll();
		model.addAttribute("Listsl", classroomlist);
		return "/jsp/Page/PageforAdmin/DShocsinh";
	}

	@RequestMapping(value = { "/studentNew" })
	public String SaveDShocsinh(Model model, @ModelAttribute("student") Student student, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] files, @RequestParam("filess") MultipartFile[] filess) {

		//
		List<Parent> Parentlist = parentResponsitory.findAll();
		Parent parent = new Parent();
		Parent lastidd = Parentlist.get(Parentlist.size() - 1);
		String idd = lastidd.getId();
		String splitIDd = idd.substring(2);
		System.out.println("==> " + splitIDd);
		int idNumm = Integer.parseInt(splitIDd) + 1;
		String outIDd = null;
		if (idNumm < 10) {
			outIDd = "PH00" + idNumm;
		} else if (idNumm >= 10 && idNumm < 100) {
			outIDd = "PH0" + idNumm;
		} else if (idNumm >= 100 && idNumm < 1000) {
			outIDd = "PH" + idNumm;
		}

		parent.setId(outIDd);

		String fnamee = request.getParameter("fnamee");
		parent.setFname(fnamee);
		String lnamee = request.getParameter("lnamee");
		parent.setLname(lnamee);

		StringBuilder filenamess = new StringBuilder();
		for (MultipartFile file : filess) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenamess.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		parent.setImage(filenamess.toString());
		String emaill = request.getParameter("emaill");
		parent.setLname(emaill);
		String dobb = request.getParameter("dobb");
		parent.setDob(dobb);
		String phonee = request.getParameter("phonee");
		parent.setPhone(phonee);
		String addresss = request.getParameter("addresss");
		parent.setAddress(addresss);
		String statuss = request.getParameter("statuss");
		parent.setStatus(statuss);
		String relationshipp = request.getParameter("relationshipp");
		parent.setRelationship(relationshipp);
		User userss = new User(emaill, phonee, "PH",outIDd);
		userrespon.save(userss);
		parentResponsitory.save(parent);

		List<Student> studentlist = studentResponsitory.findAll();
		Student lastid = studentlist.get(studentlist.size() - 1);
		System.out.println("==>> " + lastid);
		String id = lastid.getId();
		String splitID = id.substring(2);
		System.out.println("==> " + splitID);
		int idNum = Integer.parseInt(splitID) + 1;
		String outID = null;
		if (idNum < 10) {
			outID = "PS00" + idNum;
		} else if (idNum >= 10 && idNum < 100) {
			outID = "PS0" + idNum;
		} else if (idNum >= 100 && idNum < 1000) {
			outID = "PS" + idNum;
		}
		Student student2 = new Student();
		student2.setId(outID);
		student2.setFname(student.getFname());
		student2.setLname(student.getLname());
		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("successfully upload file: " + filenames.toString());
		student2.setImage(filenames.toString());
		student2.setEmail(student.getEmail());
		student2.setDob(student.getDob());
		student2.setPhone(student.getPhone());
		student2.setAddress(student.getAddress());
		student2.setStatus(student.getStatus());
		student2.setIdcard(student.getIdcard());
		student2.setParent(parent);
		User userr = new User(student2.getEmail(), student2.getPhone(), "PS",outID);
		userrespon.save(userr);
		//
		studentResponsitory.save(student2);
		
		//luu them vao bang ClassroomStudent
				List<ClassroomStudent> cr= classroomStudentRespon.findAll();
				ClassroomStudent lastidcr = cr.get(cr.size() - 1);
				int afterid= lastidcr.getId()+1; 
				String classroomname= request.getParameter("classroomname");
				System.out.println(">>>>>>"+classroomname);
				Classroom newclass=classroomResponsitory.findByname(classroomname);
				System.out.println(">>>>>>"+newclass.getId());
				Classroom cls = new Classroom();
				cls.setId(newclass.getId());
				cls.setName(newclass.getName());
				cls.setDescription(newclass.getDescription());
				cls.setStatus(newclass.getStatus());
				System.out.println(">>>>>>"+newclass.getId());
				ClassroomStudent crs= new ClassroomStudent();
				crs.setId(afterid);
				crs.setClassroom(cls);
				crs.setStudent(student2);
				classroomStudentRespon.save(crs);
		return "redirect:/DShocsinh";
	}
	// student//

	// //chuyen form update hocsinh//
	@RequestMapping(value = { "/updateFormHS" })
	public String formHocsinh(@ModelAttribute("student") Student student, Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		Student theStudent = studentResponsitory.findByid(id);
		List<Student> studentlist = new ArrayList<>();
		studentlist.add(theStudent);
		model.addAttribute("List", studentlist);
		// List<Parent> parent = parentResponsitory.findAll();
		// model.addAttribute("ListPR", parent);
		return "/jsp/Page/PageforAdmin/formUpdateStudent";
	}
	// //chuyen form update hocsinh//

	// //update hoc sinh//
	@RequestMapping(value = { "/updateStudent" })
	public String updateStudent(@ModelAttribute("student") Student student, Model model, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] files, @RequestParam("id") String id) {
		StringBuilder filenames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			filenames.append(file.getOriginalFilename());
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Student student1 = studentResponsitory.findByid(id);
		if (filenames.toString().isEmpty()) {
			System.out.println("null");
		} else {
			student1.setImage(filenames.toString());
		}
		student1.setEmail(student.getEmail());
		student1.setAddress(student.getAddress());
		student1.setStatus(student.getStatus());
		student1.setIdcard(student.getIdcard());
		studentResponsitory.save(student1);
		return "redirect:/DShocsinh";
	}

	// update hoc sinh//
	// deletehs//
	@GetMapping("/deleteST")
	public String deleteST(@RequestParam("id") String id) {
		Student student = studentResponsitory.findByid(id);
		parentResponsitory.deleteById(student.getParent().getId());
		studentResponsitory.deleteById(id);
		return "redirect:/DShocsinh";
	}
	// deletehs//

	// list mon hoc//
	@RequestMapping(value = { "/DSmonhoc" })
	public String loadDSmonhoc(Model model, @ModelAttribute("subjectNew") Subject subjectNew) {
		List<Subject> list = subjectResponsitory.findAll();
		model.addAttribute("List", list);
		List<Majors> majors = majorsResponsitory.findAll();
		model.addAttribute("Listmj", majors);
		return "/jsp/Page/PageforAdmin/DSmonhoc";
	}

	// new
	@RequestMapping(value = "/newSubject")
	public String newSubject(@ModelAttribute("subjectNew") Subject subjectNew, HttpServletRequest request,
			Model model) {
		Subject subject = new Subject();
		subject.setId(subjectNew.getId());
		subject.setMajors(subjectNew.getMajors());
		subject.setSubjectname(subjectNew.getSubjectname());
		subject.setDescription(subjectNew.getDescription());
		subject.setStatus(subjectNew.getStatus());
		String mjor = request.getParameter("majors");
		Majors majors = majorsResponsitory.findByname(mjor);
		subject.setMajors(majors);
		subjectResponsitory.save(subject);
		return "redirect:/DSmonhoc";
	}

	// chuyen form update môn
	@RequestMapping(value = { "/updateFormSJ" })
	public String formSubject(@ModelAttribute("subjectNew") Subject subjectNew, Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		Subject theSubject = subjectResponsitory.findByid(id);
		List<Subject> subjectlist = new ArrayList<>();
		subjectlist.add(theSubject);
		model.addAttribute("List", subjectlist);
//		List<Majors > majors = majorsResponsitory.findAll();
//		model.addAttribute("Listmj", majors);
		return "/jsp/Page/PageforAdmin/formupdateSJ";
	}

	// button update
	@RequestMapping(value = { "/updateSubject" })
	public String updateSubject(@ModelAttribute("subjectNew") Subject subjectNew, Model model,
			HttpServletRequest request, @RequestParam("id") String id) {
		Subject theSubject = subjectResponsitory.findByid(id);
		theSubject.setSubjectname(subjectNew.getSubjectname());
		theSubject.setDescription(subjectNew.getDescription());
		theSubject.setStatus(subjectNew.getStatus());
		subjectResponsitory.save(theSubject);
		return "redirect:/DSmonhoc";
	}

	@GetMapping("/deleteSubject")
	public String deleteSubject(@RequestParam("id") String id) {
		subjectResponsitory.deleteById(id);
		return "redirect:/DSgiaovien";
	}
// listmonhoc//

	// classroom//
	// loadtable
	@RequestMapping(value = { "/DSlophoc" })
	public String loadDSlophoc(Model model, @ModelAttribute("classroom") Classroom Classroom) {
		List<Classroom> list = classroomResponsitory.findAll();
		model.addAttribute("List", list);
		return "/jsp/Page/PageforAdmin/DSlophoc";
	}

	// new
	@RequestMapping(value = "/newClassroom")
	public String newClassroom(@ModelAttribute("classroom") Classroom classroom, HttpServletRequest request,
			Model model) {
		Classroom classroom2 = new Classroom();
		classroom2.setId(classroom.getId());
		classroom2.setName(classroom.getName());
		classroom2.setDescription(classroom.getDescription());
		classroom2.setStatus(classroom.getStatus());
		classroomResponsitory.save(classroom2);
		return "redirect:/DSlophoc";
	}

	// chuyen form update
	@RequestMapping(value = { "/updateFormCL" })
	public String updateFormCLassroom(@ModelAttribute("classroom") Classroom classroom, Model model,
			HttpServletRequest request, @RequestParam("id") String id) {
		Classroom theclassroom = classroomResponsitory.findByid(id);
		List<Classroom> classroomlist = new ArrayList<>();
		classroomlist.add(theclassroom);
		model.addAttribute("List", classroomlist);
		return "/jsp/Page/PageforAdmin/formupdateCL";
	}

//	// button update
//	@RequestMapping(value = { "/updateClassroom" })
//	public String updateClassroom(@ModelAttribute("subjectNew") Subject subjectNew, Model model,
//			HttpServletRequest request, @RequestParam("id") String id) {
//		Classroom theclassroom = classroomResponsitory.findByid(id);
//		
//		return null;
//	}
	@GetMapping("/deleteClassroom")
	public String deleteClassroom(@RequestParam("id") String id) {
		classroomResponsitory.deleteById(id);
		return "redirect:/DSlophoc";
	}

	// Danh Sach Nganh //
	@RequestMapping(value = { "/DSnganh" })
	public String loadDSnganh(Model model, @ModelAttribute("major") Majors major) {
		List<Majors> list = majorsResponsitory.findAll();
		model.addAttribute("List", list);
		return "/jsp/Page/PageforAdmin/DSnganh";
	}
	//

	// list hocky//
	@RequestMapping(value = { "/DShocki" })
	public String DShocki(Model model, @ModelAttribute("semester") Semester semester) {
		List<Semester> semester1 = semesterResponsitory.findAll();
		model.addAttribute("List", semester1);
		return "/jsp/Page/PageforAdmin/DShocki";
	}

	// new
	@RequestMapping(value = "/newSemester", method = RequestMethod.POST)
	public String newSemester(@ModelAttribute("semester") Semester semester, HttpServletRequest request, Model model,
			@RequestParam("files") MultipartFile[] files) {
		Semester newSemester = new Semester();
		newSemester.setId(semester.getId());
		newSemester.setName(semester.getName());
		newSemester.setstarttime(semester.getstarttime());
		newSemester.setendtime(semester.getendtime());
		newSemester.setStatus(semester.getStatus());
		semesterResponsitory.save(newSemester);
		return "redirect:/DShocki";
	}
	
	//update form
	@RequestMapping(value = { "/updateFormHK" })
	public String updateFormHK(@ModelAttribute("semester") Semester semester, Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		Semester semester1 = semesterResponsitory.findByid(id);
		List<Semester> semesterlist = new ArrayList<>();
		semesterlist.add(semester1);
		model.addAttribute("List", semesterlist);
		return "/jsp/Page/PageforAdmin/formupdateHK";
	}
	@GetMapping(value = "/deleteHK")
	public String deleteHK(@RequestParam("id") String id) {
		semesterResponsitory.deleteById(id);
		return "redirect:/DShocki";
	}

	
	//quan ly mon tung hoc ky//
	
	
	//quan ly mon tung hoc ky//
}


