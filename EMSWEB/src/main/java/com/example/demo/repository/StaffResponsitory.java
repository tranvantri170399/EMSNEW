package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Staff;

public interface StaffResponsitory extends JpaRepository<Staff, String> {
	Staff findByfname(String name);

	@Query("SELECT e FROM Staff e where e.id=?1")
	public List<Staff> findcustom(String id);
}
