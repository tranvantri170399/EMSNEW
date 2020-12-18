package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Classroom;

public interface ClassroomResponsitory  extends JpaRepository<Classroom, String>{
	Classroom findByid(String id);
	Classroom findByname(String name);
	
	@Query("SELECT e FROM Classroom e where e.id=?1")
	public List<Classroom> findcustombyid(String id);
}
