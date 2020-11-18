package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.demo.entities.Role;


public interface RoleService {
	List<Role> getAllRole();

	void saveRole(Role role);

	Role getRoleByid(String id);

	void deleteRoleByid(String id);

	Page<Role> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);

}
