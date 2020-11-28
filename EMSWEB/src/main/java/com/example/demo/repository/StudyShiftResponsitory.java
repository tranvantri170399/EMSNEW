package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.StudyShift;

public interface StudyShiftResponsitory extends JpaRepository<StudyShift, Integer> {
	StudyShift findBynameShift(String nameShift);
}
