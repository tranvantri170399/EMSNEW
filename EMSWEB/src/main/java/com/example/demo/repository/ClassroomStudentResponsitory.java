package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.ClassroomStudent;

public interface ClassroomStudentResponsitory extends JpaRepository<ClassroomStudent, String>{

}
