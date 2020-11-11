package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Teacher;

public interface TeacherResponsitory extends JpaRepository<Teacher, String>{
	List<Teacher> findByFname(String fname);
}
