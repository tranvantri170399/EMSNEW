package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.example.demo.entities.Role;
import com.example.demo.repository.RoleRespository;

public class RoleServiceimpl implements RoleService{
	@Autowired
	RoleRespository roleRespository;

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return roleRespository.findAll();
	}

	@Override
	public void saveRole(Role role) {
		// TODO Auto-generated method stub
		this.roleRespository.save(role);
		
	}

	@Override
	public Role getRoleByid(String id) {
		// TODO Auto-generated method stub
		Optional<Role> optional = roleRespository.findById(id);
		Role role = null;
		if (optional.isPresent()) {
			role = optional.get();
		}else {
			throw new RuntimeException(" role not found for id :: " + id);
		}
		return role;
	}

	@Override
	public void deleteRoleByid(String id) {
		this.roleRespository.deleteById(id);
		
	}

	@Override
	public Page<Role> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
			Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		return this.roleRespository.findAll(pageable);
	}
}
