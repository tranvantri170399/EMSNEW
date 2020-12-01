package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Schedule;

public interface ScheduleResponsitory extends JpaRepository<Schedule, String>{
	Schedule findByid(String id);
	
	@Query("SELECT e FROM Schedule e where e.classroom.id=?1")
	public List<Schedule> findcustom(String classroomid);
}
