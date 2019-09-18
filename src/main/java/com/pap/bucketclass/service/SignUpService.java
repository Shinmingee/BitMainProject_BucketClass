package com.pap.bucketclass.service;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.entity.Role;
import com.pap.bucketclass.model.ResponseModel;
import com.pap.bucketclass.model.SignUpModel;
import com.pap.bucketclass.repository.MemberRepository;
import com.pap.bucketclass.repository.RoleRepository;

@Service
public class SignUpService {

	@Autowired
	private MemberRepository memberRepo;

	@Autowired
	private RoleRepository roleRepo;


	// ID중복검사
	public Boolean checkId(String memberId) {
		if(memberRepo.findByMemberId(memberId) != null) {
			System.out.println("이미 존재하는 ID");
			return false;
		}
		return true;
	}

	// NickName 중복검사
	public Boolean checkNickname(String memberNickname) {
		if(memberRepo.findByMemberNickname(memberNickname) != null) {
			System.out.println("이미 존재하는 Nickname");
			return false;
		}
		return true;
	}

	// Email 중복검사 
	public Boolean checkEmail(String memberEmail) {
		if(memberRepo.findByMemberEmail(memberEmail) != null) {
			System.out.println("이미 존재하는 Email");
			return false;
		}
		return true;
	}

	@Transactional
	public Member insertMember(SignUpModel signup) {
		try {
			if(checkId(signup.getMemberId()) && checkEmail(signup.getMemberEmail()) && checkNickname(signup.getMemberNickname())) {
				Member member = signup.toMember();
				Role role = roleRepo.findByRoleName(signup.getRoleName());
				member.setRoles(Stream.of(role).collect(Collectors.toSet()));
				member.setMemberIsActive(true);
				return memberRepo.save(member);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
}
