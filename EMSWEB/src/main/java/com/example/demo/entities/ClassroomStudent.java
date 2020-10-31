package com.example.demo.entities;
// Generated Oct 24, 2020, 7:32:02 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ClassroomStudent generated by hbm2java
 */
@Entity
@Table(name = "Classroom_Student", schema = "dbo", catalog = "EMS_DB")
public class ClassroomStudent implements java.io.Serializable {

	private ClassroomStudentId id;
	private Classroom course;
	private Student student;

	public ClassroomStudent() {
	}

	public ClassroomStudent(ClassroomStudentId id, Classroom course, Student student) {
		this.id = id;
		this.course = course;
		this.student = student;
	}

	@EmbeddedId

	@AttributeOverrides({
			@AttributeOverride(name = "classroomId", column = @Column(name = "ClassroomID", nullable = false)),
			@AttributeOverride(name = "studentId", column = @Column(name = "StudentID", nullable = false)) })
	public ClassroomStudentId getId() {
		return this.id;
	}

	public void setId(ClassroomStudentId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ClassroomID", nullable = false, insertable = false, updatable = false)
	public Classroom getCourse() {
		return this.course;
	}

	public void setCourse(Classroom course) {
		this.course = course;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "StudentID", nullable = false, insertable = false, updatable = false)
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
