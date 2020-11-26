package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Device;

public interface DeviceResponsitory extends JpaRepository<Device, Integer>{
	Device findBydeviceName(String deviceName);
}
