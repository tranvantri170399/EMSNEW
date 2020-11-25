package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.example.demo.entities.Depart;
import com.example.demo.repository.DepartResponsitory;

public class DepartServiceimpl implements DepartService{
	@Autowired
	DepartResponsitory departResponsitory;

	@Override
	public List<Depart> getAllDepart() {
		// TODO Auto-generated method stub
		return departResponsitory.findAll();
	}

	@Override
	public void saveDepart(Depart depart) {
		this.departResponsitory.save(depart);
		
	}

	@Override
	public Depart getDepartByid(String id) {
		Optional<Depart> optional = departResponsitory.findById(id);
		Depart depart = null;
		if (optional.isPresent()) {
			depart = optional.get();
		}else {
			throw new RuntimeException(" deapart not found for id :: " + id);
		}
		return depart;
	}

	@Override
	public void deleteDepartByid(String id) {
		this.departResponsitory.deleteById(id);
		
	}

	@Override
	public Page<Depart> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
			Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		return this.departResponsitory.findAll(pageable);
	}
	

}
