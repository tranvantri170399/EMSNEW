package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Majors;
@Repository("majorsResponsitory")
public interface MajorsResponsitory extends JpaRepository<Majors, String>{
	Majors findByname(String name);
}
