/*
 * package com.example.demo.controller;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.data.domain.Page; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.validation.BindingResult; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import com.example.demo.entities.Depart; import
 * com.example.demo.entities.Role; import com.example.demo.entities.Teacher;
 * import com.example.demo.repository.DepartResponsitory; import
 * com.example.demo.repository.RoleRespository; import
 * com.example.demo.service.TeacherService;
 * 
 * @Controller public class teacherController {
 * 
 * @Autowired private TeacherService teacherService;
 * 
 * @Autowired private RoleRespository roleRespository;
 * 
 * @Autowired private DepartResponsitory departResponsitory;
 * 
 * // hiển thị danh sách nhân viên
 * 
 * @GetMapping("list-teach") public String listTeacher(Model model) { return
 * findPaginated(1, "id", "asc", model); }
 * 
 * @GetMapping("/page/{pageNo}") public String findPaginated(@PathVariable(value
 * = "pageNo") int pageNo, @RequestParam("sortField") String sortField,
 * 
 * @RequestParam("sortDir") String sortDir, Model model) { int pageSize = 5;
 * 
 * Page<Teacher> page = teacherService.findPaginated(pageNo, pageSize,
 * sortField, sortDir); List<Teacher> listTeacher = page.getContent();
 * 
 * model.addAttribute("currentPage", pageNo); model.addAttribute("totalPages",
 * page.getTotalPages()); model.addAttribute("totalItems",
 * page.getTotalElements());
 * 
 * model.addAttribute("sortField", sortField); model.addAttribute("sortDir",
 * sortDir); model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc"
 * : "asc");
 * 
 * model.addAttribute("listTeacher", listTeacher); return
 * "/jsp/Page/PageforAdmin/DSgiaovien"; }
 * 
 * // @GetMapping("/showNewTeacherForm") // public String
 * showNewTeacherForm(Model model) { // // tạo thuộc tính mô hình để liên kết dữ
 * liệu biểu mẫu // Teacher teacher = new Teacher(); //
 * model.addAttribute("teacher", teacher); // return "/teacher/new_teacher"; //
 * } // // @RequestMapping(value = "/saveTeacher", method = RequestMethod.POST)
 * // public String saveTeacher(@ModelAttribute("teacher") Teacher teacher,
 * 
 * Model model, BindingResult result) { // // lưu giao vien vào cơ sở dữ liệu //
 * Teacher newteacher = new Teacher(); // newteacher.setId(teacher.getId());
 * //// doi name sang ID (thao tac depart) // Depart listDP =
 * departResponsitory.findByname(teacher.getDepart().getName()); //
 * newteacher.setDepart(listDP); //// doi name sang ID (thao tac role) // Role
 * listRL = roleRespository.findByroleName(teacher.getRole().getRoleName()); //
 * newteacher.setRole(listRL); // newteacher.setFname(teacher.getFname()); //
 * newteacher.setLname(teacher.getLname()); //
 * newteacher.setImage(teacher.getImage()); //
 * newteacher.setEmail(teacher.getEmail()); ////
 * newteacher.setDob(teacher.getDob()); //
 * newteacher.setPhone(teacher.getPhone()); //
 * newteacher.setAddress(teacher.getAddress()); //
 * newteacher.setStatus(teacher.getStatus()); //
 * newteacher.setLevel(teacher.getLevel()); ////
 * newteacher.setSalary(teacher.getSalary()); //
 * teacherService.saveTeacher(newteacher); // return "redirect:/list-teach"; //
 * } // //// // //// //// @RequestMapping(value = { "/teacher-save" }, method =
 * RequestMethod.POST) //// public String insertCustomer(Model model) { ////
 * model.addAttribute("addteacher",new Teacher()); //// return
 * "/teacher/teacher-save"; //// } //// //// @RequestMapping("/saveTeacherr")
 * public String //// doSaveUser(@ModelAttribute("addteacher") Teacher teacher,
 * Model model) { //// Teacher tc = new Teacher(); tc.setId(teacher.getId());
 * //// //doi name sang ID (thao tac role) //// //// Role list =
 * rolerep.findByRoleName(teacher.getRole().getRoleName()); ////
 * tc.setRole(list); // tc.setFname(teacher.getFname()); // ////
 * tc.setDob(teacher.getDob()); teacherResponsitory.save(tc); ////
 * model.addAttribute("listTcher", teacherResponsitory.findAll()); //// return
 * //// "/teacher/teacher-list"; } //// // // // @GetMapping("/updateForm") //
 * 
 * public String showFormForUpdate(@RequestParam("id") String id, Model
 * theModel) { // Teacher theTeacher = teacherService.getTeacherByid(id); //
 * theModel.addAttribute("teacher", theTeacher); // return
 * "/teacher/update_teacher"; // } // //// @GetMapping("/deleteTeacher/{id}")
 * //// public String deleteTeacher(@PathVariable (value = "id") String id) {
 * //// //// // call delete employee method ////
 * this.teacherService.deleteTeacherByid(id); //// return
 * "redirect:/list-teach"; //// } //// // @GetMapping("/deleteTeacher") //
 * 
 * public String deleteTeacher(@RequestParam("id") String id) { //
 * teacherService.deleteTeacherByid(id); // return "redirect:/list-teach"; // }
 * 
 * }
 */