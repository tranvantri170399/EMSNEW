package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.example.demo.entities.Student;
import com.example.demo.entities.Teacher;
import com.example.demo.repository.StudentResponsitory;

public class StudentServiceimpl implements StudentService{
	@Autowired
	StudentResponsitory studentResponsitory;

	@Override
	public List<Student> getAllStudent() {
		// TODO Auto-generated method stub
		return studentResponsitory.findAll();
	}

	@Override
	public void saveStudent(Student student) {
		this.studentResponsitory.save(student);
		
	}

	@Override
	public Student getStudentByid(String id) {
		Optional<Student> optional = studentResponsitory.findById(id);
		Student student = null;
		if (optional.isPresent()) {
			student = optional.get();
		}else {
			throw new RuntimeException(" Teacher not found for id :: " + id);
		}
		return student;
	}

	@Override
	public void deleteStudentByid(String id) {
		this.studentResponsitory.deleteById(id);
		
	}

	@Override
	public Page<Student> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
			Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		return this.studentResponsitory.findAll(pageable);
	}
}
