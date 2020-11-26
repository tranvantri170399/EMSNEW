package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Semester;

public interface SemesterResponsitory extends JpaRepository<Semester, String>{
	Semester findByid(String id);
}
