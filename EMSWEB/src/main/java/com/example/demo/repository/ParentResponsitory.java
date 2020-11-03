package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Parent;

public interface ParentResponsitory extends JpaRepository<Parent, String>{

}
