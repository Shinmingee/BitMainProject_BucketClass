package com.pap.bucketclass.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TestModel{
	
	@JsonProperty("service_title")
	private String serviceTitle;
	
	@JsonProperty("service_price")
	private String servicePrice;

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public void setServicePrice(String servicePrice) {
		this.servicePrice = servicePrice;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public String getServicePrice() {
		return servicePrice;
	}
	
	
	
}
