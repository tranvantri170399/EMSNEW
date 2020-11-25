package com.example.demo.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Subject;
@Repository("subjectResponsitory")
public interface SubjectResponsitory extends JpaRepository<Subject, String>{
	Subject findByid(String id);
}
