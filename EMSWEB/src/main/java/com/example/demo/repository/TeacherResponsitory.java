package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Teacher;
@Repository("teacherResponsitory")
public interface TeacherResponsitory extends JpaRepository<Teacher, String>{
	Teacher findByfname(String fname);
}
