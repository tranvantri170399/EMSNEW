package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Teacher;
import com.example.demo.repository.TeacherResponsitory;

@Service
public class TeacherServiceimpl implements TeacherService{
	@Autowired
	TeacherResponsitory teacherResponsitory;

	@Override
	public List<Teacher> getAllTeacher() {
		// TODO Auto-generated method stub
		return teacherResponsitory.findAll();
	}

	@Override
	public void saveTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		this.teacherResponsitory.save(teacher);
		
	}

	@Override
	public Teacher getTeacherByid(String id) {
		Optional<Teacher> optional = teacherResponsitory.findById(id);
		Teacher teacher = null;
		if (optional.isPresent()) {
			teacher = optional.get();
		}else {
			throw new RuntimeException(" Teacher not found for id :: " + id);
		}
		return teacher;
	}

	@Override
	public void deleteTeacherByid(String id) {
		this.teacherResponsitory.deleteById(id);
		
	}

	@Override
	public Page<Teacher> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
			Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		return this.teacherResponsitory.findAll(pageable);
	}
}

