package com.example.demo.entities;
// Generated Oct 24, 2020, 7:32:02 PM by Hibernate Tools 5.1.10.Final

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Classroom generated by hbm2java
 */
@Entity
@Table(name = "Classroom", schema = "dbo", catalog = "EMS_DB")
public class Classroom implements java.io.Serializable {

	private Serializable id;
	private Serializable name;
	private Serializable description;
	private Serializable majorId;
	private Serializable status;
	private Set<Schedule> schedules = new HashSet<Schedule>(0);
	private Set<ClassroomStudent> classroomStudents = new HashSet<ClassroomStudent>(0);

	public Classroom() {
	}

	public Classroom(Serializable id) {
		this.id = id;
	}

	public Classroom(Serializable id, Serializable name, Serializable description, Serializable majorId,
			Serializable status, Set<Schedule> schedules, Set<ClassroomStudent> classroomStudents) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.majorId = majorId;
		this.status = status;
		this.schedules = schedules;
		this.classroomStudents = classroomStudents;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public Serializable getId() {
		return this.id;
	}

	public void setId(Serializable id) {
		this.id = id;
	}

	@Column(name = "Name")
	public Serializable getName() {
		return this.name;
	}

	public void setName(Serializable name) {
		this.name = name;
	}

	@Column(name = "Description")
	public Serializable getDescription() {
		return this.description;
	}

	public void setDescription(Serializable description) {
		this.description = description;
	}

	@Column(name = "MajorID")
	public Serializable getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Serializable majorId) {
		this.majorId = majorId;
	}

	@Column(name = "Status")
	public Serializable getStatus() {
		return this.status;
	}

	public void setStatus(Serializable status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "classroom")
	public Set<Schedule> getSchedules() {
		return this.schedules;
	}

	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	public Set<ClassroomStudent> getClassroomStudents() {
		return this.classroomStudents;
	}

	public void setClassroomStudents(Set<ClassroomStudent> classroomStudents) {
		this.classroomStudents = classroomStudents;
	}

}
