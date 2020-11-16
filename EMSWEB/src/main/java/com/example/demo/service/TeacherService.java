package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.demo.entities.Teacher;

public interface TeacherService {
	List<Teacher> getAllTeacher();

	void saveTeacher(Teacher teacher);

	Teacher getTeacherByid(String id);

	void deleteTeacherByid(String id);

	Page<Teacher> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
