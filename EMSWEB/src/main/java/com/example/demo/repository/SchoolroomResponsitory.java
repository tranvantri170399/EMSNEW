package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.SchoolRoom;

public interface SchoolroomResponsitory extends JpaRepository<SchoolRoom, String> {
	
}
