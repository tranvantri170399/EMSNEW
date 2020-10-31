package com.example.demo.entities;
// Generated Oct 24, 2020, 7:32:02 PM by Hibernate Tools 5.1.10.Final

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Parent generated by hbm2java
 */
@Entity
@Table(name = "Parent", schema = "dbo", catalog = "EMS_DB")
public class Parent implements java.io.Serializable {

	private Serializable id;
	private Serializable fname;
	private Serializable lname;
	private Serializable image;
	private String email;
	private Date dob;
	private String phone;
	private Serializable address;
	private Serializable status;
	private Serializable relationship;
	private Set<Student> students = new HashSet<Student>(0);

	public Parent() {
	}

	public Parent(Serializable id, Serializable fname, Serializable lname, Date dob) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
	}

	public Parent(Serializable id, Serializable fname, Serializable lname, Serializable image, String email, Date dob,
			String phone, Serializable address, Serializable status, Serializable relationship, Set<Student> students) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.image = image;
		this.email = email;
		this.dob = dob;
		this.phone = phone;
		this.address = address;
		this.status = status;
		this.relationship = relationship;
		this.students = students;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public Serializable getId() {
		return this.id;
	}

	public void setId(Serializable id) {
		this.id = id;
	}

	@Column(name = "Fname", nullable = false)
	public Serializable getFname() {
		return this.fname;
	}

	public void setFname(Serializable fname) {
		this.fname = fname;
	}

	@Column(name = "Lname", nullable = false)
	public Serializable getLname() {
		return this.lname;
	}

	public void setLname(Serializable lname) {
		this.lname = lname;
	}

	@Column(name = "Image")
	public Serializable getImage() {
		return this.image;
	}

	public void setImage(Serializable image) {
		this.image = image;
	}

	@Column(name = "Email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "Dob", nullable = false, length = 10)
	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	@Column(name = "Phone", length = 15)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "Address")
	public Serializable getAddress() {
		return this.address;
	}

	public void setAddress(Serializable address) {
		this.address = address;
	}

	@Column(name = "Status")
	public Serializable getStatus() {
		return this.status;
	}

	public void setStatus(Serializable status) {
		this.status = status;
	}

	@Column(name = "Relationship")
	public Serializable getRelationship() {
		return this.relationship;
	}

	public void setRelationship(Serializable relationship) {
		this.relationship = relationship;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<Student> getStudents() {
		return this.students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

}
