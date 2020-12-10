package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Student;
@Repository("studentResponsitory")
public interface StudentResponsitory extends JpaRepository<Student,String>{
	Student findByid(String id);
	Student findByemail(String email);
	@Query("SELECT e FROM Student e where e.parent.id=?1")
	public List<Student> findcustom(String id);
}
