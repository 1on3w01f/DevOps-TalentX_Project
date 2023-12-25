package com.talentx.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.talentx.account.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}