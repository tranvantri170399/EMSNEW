package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Depart;
import com.example.demo.entities.Exam;

public interface ExamResponsitory extends JpaRepository<Exam, String>{
	Exam findByname(String name); 
	Exam findByid(String id);
}
