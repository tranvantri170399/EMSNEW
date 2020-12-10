package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.User;

public interface UserResponsitory extends JpaRepository<User, String> {
	User findByusername(String name);
	@Query("SELECT e FROM User e where e.username=?1")
	public List<User> findcustom(String id);
	
	@Query("SELECT e FROM User e where e.userid=?1")
	public List<User> findcusTeacherID(String id);
}
