package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.ExamType;

public interface ExamtypeResponsitory extends JpaRepository<ExamType,String>{
	ExamType findByname(String name);
}
