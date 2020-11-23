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
 * SchoolroomDevice generated by hbm2java
 */
@Entity
@Table(name = "schoolroom_device")
public class SchoolroomDevice {
	private int id;
	private SchoolRoom schoolroom;
	private Device device;
	private int amount;
	
	
	public SchoolroomDevice() {
		super();
	}


	public SchoolroomDevice(int id, SchoolRoom schoolroom, Device device, int amount) {
		super();
		this.id = id;
		this.schoolroom = schoolroom;
		this.device = device;
		this.amount = amount;
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
	@JoinColumn(name = "Schoolroomid")
	public SchoolRoom getSchoolroom() {
		return schoolroom;
	}
	
	public void setSchoolroom(SchoolRoom schoolroom) {
		this.schoolroom = schoolroom;
	}


	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "Deviceid")
	public Device getdevice() {
		return device;
	}
	
	public void setdevice(Device device) {
		this.device = device;
	}

	@Column(name = "Amount")
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	

}
