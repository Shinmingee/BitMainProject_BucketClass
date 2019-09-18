package com.pap.bucketclass.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pap.bucketclass.entity.Privilege;
@Repository
public interface PrivilegeRepository extends JpaRepository<Privilege, String> {

}
