package com.example.demo.entities;
// Generated Oct 24, 2020, 7:32:02 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * SchoolroomAmphi generated by hbm2java
 */
@Entity
@Table(name = "schoolroomamphi")
public class SchoolroomAmphi{
	private int id;
	private Amphitheater amphitheater;
	private SchoolRoom schoolroom;
	
	
	public SchoolroomAmphi() {
		super();
	}


	public SchoolroomAmphi(int id, Amphitheater amphitheater, SchoolRoom schoolroom) {
		super();
		this.id = id;
		this.amphitheater = amphitheater;
		this.schoolroom = schoolroom;
	}


	@Id
	@Column(name = "ID")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "Amphiid")
	public Amphitheater getAmphitheater() {
		return amphitheater;
	}
	public void setAmphitheater(Amphitheater amphitheater) {
		this.amphitheater = amphitheater;
	}


	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "Schoolroomid")
	public SchoolRoom getSchoolroom() {
		return schoolroom;
	}
	public void setSchoolroom(SchoolRoom schoolroom) {
		this.schoolroom = schoolroom;
	}
	
	
}
