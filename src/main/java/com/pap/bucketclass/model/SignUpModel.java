package com.pap.bucketclass.model;

import java.io.Serializable;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.entity.Role;

@Entity
public class SignUpModel implements Serializable{
	
	@JsonProperty("memberId")
	private String memberId;
	
	@JsonProperty("memberPassword")
	private String memberPassword;
	
	@JsonProperty("confirmPassword")
	private String confirmPassword;
	
	@JsonProperty("memberEmail")
	private String memberEmail;
	
	@JsonProperty("memberNickname")
	private String memberNickname;
	
	@JsonProperty("roleName")
	private String roleName;
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Member toMember() {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberNickname(memberNickname);
		member.setMemberEmail(memberEmail);
		member.setMemberPassword(memberPassword);
		return member;
	}
	
	@Override
	public String toString() {
		return " memberId : " + memberId 
				+"\n memberNickname : " + memberNickname 
				+"\n memberEmail : " + memberEmail
				+"\n memberPassword : " + memberPassword 
				+"\n confirmPassword : " + confirmPassword 
				+"\n roleName : " + roleName;
	}

}
