package com.crimsonlogic.schedulemeeting.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.crimsonlogic.schedulemeeting.entity.HRAdmin;

public interface HrAdminRepository extends JpaRepository<HRAdmin, Long> {
	
	HRAdmin findByUsername(String username);
}
