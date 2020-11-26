package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Classroom;

public interface ClassroomResponsitory  extends JpaRepository<Classroom, String>{
	Classroom findByid(String id);
}
