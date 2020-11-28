package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Amphitheater;

public interface AmphiResponsitory extends JpaRepository<Amphitheater, Integer>{
	Amphitheater findByamphitheaterName(String amphitheaterName);
}
