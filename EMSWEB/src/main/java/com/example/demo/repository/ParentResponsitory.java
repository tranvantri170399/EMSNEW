package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Parent;

public interface ParentResponsitory extends JpaRepository<Parent, String>{
	@Query("SELECT e FROM Parent e where e.id=?1")
	public List<Parent> findcustom(String id);
}
