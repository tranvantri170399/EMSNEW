package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.MajorsSemester;

public interface MajorSemesterResponsitory extends JpaRepository<MajorsSemester, Integer>{

}
