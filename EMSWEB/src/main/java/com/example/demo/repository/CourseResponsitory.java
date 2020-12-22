package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Course;

public interface CourseResponsitory extends JpaRepository<Course, String>{
	Course findByname(String name);
	Course findByid(String id);
	@Query("SELECT e FROM Course e where e.teacher.id=?1")
	public List<Course> findcustomteacher(String id);
	@Query("SELECT e FROM Course e where e.id=?1")
	public List<Course> findcustombyid(String id);
//	@Query("INSERT INTO course (ID. Name, Section, SemeterID, Status, TeacherID) values ('?1','?2','?3', '?4', '?5', '?6')")
//	public void savecustom(String id,String name,String seid, String status, String teid);
}
