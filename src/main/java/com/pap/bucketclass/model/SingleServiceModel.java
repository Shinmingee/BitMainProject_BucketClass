package com.pap.bucketclass.model;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.entity.ServiceAddress;
import com.pap.bucketclass.entity.ServiceCategory;
import com.pap.bucketclass.entity.Services;

public class SingleServiceModel {
	
	//services
    private String serviceTitle;
    private String serviceDateDescription;
    private String accountBank;
    private String accountNumber;
    private String servicePrice;
    private String serviceDescription;
    private String hashTag;
    private String serviceImgUri;
    
    //service_category
    private String categorySubject;
    
    //member
    private String memberNickname;
    private String career;
    private String certi;
    private String memberEmail;
    private String introduce;
    private String memberImg;
    
    //service_address
    private String addressState;
    private String addressCity;
    private String addressDong;
    
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getServiceDateDescription() {
		return serviceDateDescription;
	}
	public void setServiceDateDescription(String serviceDateDescription) {
		this.serviceDateDescription = serviceDateDescription;
	}
	public String getAccountBank() {
		return accountBank;
	}
	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(String servicePrice) {
		this.servicePrice = servicePrice;
	}
	public String getServiceDescription() {
		return serviceDescription;
	}
	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getServiceImgUri() {
		return serviceImgUri;
	}
	public void setServiceImgUri(String serviceImgUri) {
		this.serviceImgUri = serviceImgUri;
	}
	public String getCategorySubject() {
		return categorySubject;
	}
	public void setCategorySubject(String categorySubject) {
		this.categorySubject = categorySubject;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getAddressState() {
		return addressState;
	}
	public void setAddressState(String addressState) {
		this.addressState = addressState;
	}
	public String getAddressCity() {
		return addressCity;
	}
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}
	public String getAddressDong() {
		return addressDong;
	}
	public void setAddressDong(String addressDong) {
		this.addressDong = addressDong;
	}
    
    public void settingDataForSendToSinglePage(
    		Services services, ServiceCategory serviceCategory, Member member, ServiceAddress serviceAddress) {
    	
    	//services
        serviceTitle = services.getServiceTitle();
        serviceDateDescription = services.getServiceDateDescription();
       accountBank = services.getAccountBank();
       accountNumber = services.getAccountNumber();
       servicePrice = services.getServicePrice();
       serviceDescription = services.getServiceDescription();
       hashTag = services.getHashTag();
       serviceImgUri = services.getServiceImgUri();
        
        //service_category
       categorySubject = serviceCategory.getCategorySubject();
        
        //member
       memberNickname = member.getMemberNickname();
       career = member.getCareer();
       certi = member.getCerti();
       memberEmail = member.getMemberEmail();
       introduce = member.getIntroduce();
       memberImg = member.getMemberImg();
        
        //service_address
       addressState = serviceAddress.getAddressState();
       addressCity = serviceAddress.getAddressCity();
       addressDong = serviceAddress.getAddressDong();
    	
    }
    
}

