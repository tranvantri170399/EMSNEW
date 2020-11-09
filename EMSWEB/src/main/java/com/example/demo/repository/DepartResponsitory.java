package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Depart;

public interface DepartResponsitory extends JpaRepository<Depart, String> {
	
//	@Query("INSERT INTO depart values (ID=?1, Name=?2, desc=?3)")
//	public List<Depart> savede(String id,String name, String desc);
}
