package com.pap.bucketclass.model;

import java.util.Collection;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ServiceListModel extends ResultItems<ServiceListModel> {
	
	public ServiceListModel(Collection<ServiceListModel> items, int page, int size, long totalCount) {
		super(items, page, size, totalCount);
	}
	@JsonProperty("service_id")
	private Long serviceId;
	@JsonProperty("service_title")
	private String serviceTitle;
	@JsonProperty("service_img_uri")
	private String serviceImgUri;
	@JsonProperty("category_subject")
	private String categorySubject;
	@JsonProperty("service_price")
	private String servicePrice;
	@JsonProperty("address_state")
	private String addressState;
	@JsonProperty("address_city")
	private String addressCity;
	@JsonProperty("address_dong")
	private String addressDong;
	
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
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
	public String getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(String servicePrice) {
		this.servicePrice = servicePrice;
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
	
	
}
