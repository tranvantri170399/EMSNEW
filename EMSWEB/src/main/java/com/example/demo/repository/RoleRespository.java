package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Role;
@Repository("roleRespository")
public interface RoleRespository extends JpaRepository<Role, String>{
	Role findByRoleName(String name); 
}
