package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.SchoolroomDevice;

public interface SchoolroomDeviceResponsitory extends JpaRepository<SchoolroomDevice, Integer> {

}
