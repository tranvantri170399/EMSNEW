package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Teacher;
@Repository("teacherResponsitory")
public interface TeacherResponsitory extends JpaRepository<Teacher, String>{
	Teacher findByid(String id);
	Teacher findByfname(String fname);
	@Query("SELECT e FROM Teacher e where e.id=?1")
	public List<Teacher> findcustom(String id);
}
