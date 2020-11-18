package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.demo.entities.Depart;


public interface DepartService {
	List<Depart> getAllDepart();

	void saveDepart(Depart depart);

	Depart getDepartByid(String id);

	void deleteDepartByid(String id);

	Page<Depart> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);

}
