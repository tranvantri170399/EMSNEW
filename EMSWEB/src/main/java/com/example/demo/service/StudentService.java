package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.demo.entities.Student;
import com.example.demo.entities.Teacher;

public interface StudentService {
	List<Student> getAllStudent();

	void saveStudent(Student student);

	Student getStudentByid(String id);

	void deleteStudentByid(String id);

	Page<Student> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
