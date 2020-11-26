package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Schedule;

public interface ScheduleResponsitory extends JpaRepository<Schedule, String>{

}
