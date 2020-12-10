package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Course;

public interface CourseResponsitory extends JpaRepository<Course,String>{
	Course findByname(String name);
	@Query("SELECT e FROM Course e where e.teacher.id=?1")
	public List<Course> findcustomteacher(String id);
}
