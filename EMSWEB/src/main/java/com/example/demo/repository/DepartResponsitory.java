package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Depart;

public interface DepartResponsitory extends JpaRepository<Depart, String> {

}
