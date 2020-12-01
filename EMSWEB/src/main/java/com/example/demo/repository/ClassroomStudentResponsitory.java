package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.ClassroomStudent;

public interface ClassroomStudentResponsitory extends JpaRepository<ClassroomStudent, String>{
	@Query("SELECT e FROM ClassroomStudent e where e.student.id=?1")
	public List<ClassroomStudent> findcustom(String id);
}
