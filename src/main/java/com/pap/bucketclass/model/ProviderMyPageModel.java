package com.pap.bucketclass.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ProviderMyPageModel implements Serializable{
	
	private String memberEmail;
	private String memberNickname;
	private MultipartFile memberImg;
	private String introduce;
	private String career;
	private String certi;
	
	
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
	public MultipartFile getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(MultipartFile memberImg) {
		this.memberImg = memberImg;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCerti() {
		return certi;
	}
	public void setCerti(String certi) {
		this.certi = certi;
	}
}
