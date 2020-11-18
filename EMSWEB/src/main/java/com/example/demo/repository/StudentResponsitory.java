package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Student;

public interface StudentResponsitory extends JpaRepository<Student,String>{
	@Query("SELECT e FROM Student e where e.parent.id=?1")
	public List<Student> findcustom(String id);
}
