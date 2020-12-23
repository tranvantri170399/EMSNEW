package com.example.demo.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.ExamResult;
import com.example.demo.entities.Student;
import com.example.demo.repository.ExamResultResponsitory;
import com.example.demo.repository.StudentResponsitory;
import com.lowagie.text.DocumentException;

@Controller
public class ExportFilePDFController {
	@Autowired
	StudentResponsitory studentResponsitory;
	@Autowired
	ExamResultResponsitory examResultResponsitory;
	
	@GetMapping(value = {"/exportPDF"})
	public void exportPDF(HttpServletResponse response,Model model,@RequestParam("Studentid") String studentid) throws DocumentException, IOException{
		response.setContentType("application/pdf;");
        DateFormat dateFormatter = new SimpleDateFormat(" yyyy-MM-dd HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=BANGDIEM" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);
         
//        List<Student> listStudent = studentResponsitory.findAll();
        List<ExamResult> list = examResultResponsitory.findcustomstudentid(studentid);
        ExportFile exporter = new ExportFile(list);
        exporter.export(response);    
	}
}
