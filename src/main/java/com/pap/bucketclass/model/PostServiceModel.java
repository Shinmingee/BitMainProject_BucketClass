package com.pap.bucketclass.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pap.bucketclass.entity.ServiceAddress;

public class PostServiceModel implements Serializable{

	@JsonProperty("serviceprice")
	private String servicePrice;
	
	@JsonProperty("servicedatedescription")
	private String serviceDateDescription;
	
	@JsonProperty("servicestartdate")
	private String serviceStartDate;	
	
	@JsonProperty("serviceenddate")
	private String serviceEndDate;
	
	@JsonProperty("addressstate")
	private String addressState;
	
	@JsonProperty("addresscity")
	private String addressCity;
	
	@JsonProperty("addressdong")
	private String addressDong;
	
	@JsonProperty("addressdetail")
	private String addressDetail;

	public String getServicePrice() {
		return servicePrice;
	}

	public void setServicePrice(String servicePrice) {
		this.servicePrice = servicePrice;
	}

	public String getServiceDateDescription() {
		return serviceDateDescription;
	}

	public void setServiceDateDescription(String serviceDateDescription) {
		this.serviceDateDescription = serviceDateDescription;
	}

	public String getServiceStartDate() {
		return serviceStartDate;
	}

	public void setServiceStartDate(String serviceStartDate) {
		this.serviceStartDate = serviceStartDate;
	}

	public String getServiceEndDate() {
		return serviceEndDate;
	}

	public void setServiceEndDate(String serviceEndDate) {
		this.serviceEndDate = serviceEndDate;
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

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	
	public ServiceAddress toServiceAddress() {
		ServiceAddress serviceAddress = new ServiceAddress();
		serviceAddress.setAddressState(addressState);
		serviceAddress.setAddressCity(addressCity);
		serviceAddress.setAddressDong(addressDong);
		serviceAddress.setAddressDetail(addressDetail);
		return serviceAddress;
	}

	@Override
	public String toString() {
		return  " servicePrice : " + servicePrice
				+ "\n serviceDateDescription : " + serviceDateDescription
				+ "\n serviceStartDate : " + serviceStartDate
				+ "\n serviceEndDate : " + serviceEndDate
				+ "\n addressState : " +addressState
				+ "\n addressCity : " + addressCity
				+ "\n addressDong : " + addressDong
				+ "\n addressDetail : " + addressDetail;
	}

	
}
