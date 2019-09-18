package com.pap.bucketclass.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pap.bucketclass.entity.Member;

//https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
@Repository
public interface MemberRepository extends JpaRepository<Member, String>{
	// 회원가입시 ID 중복검사 및 로그인시 ID 확인
	Member findByMemberId(String memberId);
	// 회원가입시 Email 중복검사
	Member findByMemberEmail(String memberEmail);
	// 회원가입시 Nickname 중복검사
	Member findByMemberNickname(String memberNickname);
}
