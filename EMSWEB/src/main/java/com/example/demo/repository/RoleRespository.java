package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Role;

public interface RoleRespository extends JpaRepository<Role, String>{

}
