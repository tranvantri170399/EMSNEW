package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.ExamResult;

public interface ExamResultResponsitory extends JpaRepository<ExamResult, Integer>{
	ExamResult findByid(int id);
	
	@Query("SELECT e FROM ExamResult e where e.date=?1")
	public List<ExamResult> findcustomdate(String date);
	
	@Query("SELECT e FROM ExamResult e where e.exam.id=?1")
	public List<ExamResult> findcustomid(String id);
	
	@Query("SELECT e FROM ExamResult e where e.student.id=?1")
	public List<ExamResult> findcustomstudentid(String id);
	
	@Query("SELECT e FROM ExamResult e where e.student.id=?1 and e.exam.course.semester.name=?2")
	public List<ExamResult> findcustomtheoky(String id, String name);
}
