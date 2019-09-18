package com.pap.bucketclass.model;

import java.io.Serializable;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class QueryServiceModel implements Serializable{
	
	@JsonProperty("service_title") //키워드
	private String serviceTitle;
	@JsonProperty("category_subject")
	private String categorySubject;
	@JsonProperty("category_type")
	private String categoryType;
	@JsonProperty("category_period")
	private String categoryPeriod;
	@JsonProperty("category_scale")
	private String categoryScale;
	@JsonProperty("category_place")
	private String categoryPlace;
	@JsonProperty("order_by")
	private String orderBy;

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public String getCategorySubject() {
		return categorySubject;
	}

	public void setCategorySubject(String categorySubject) {
		this.categorySubject = categorySubject;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public String getCategoryPeriod() {
		return categoryPeriod;
	}

	public void setCategoryPeriod(String categoryPeriod) {
		this.categoryPeriod = categoryPeriod;
	}

	public String getCategoryScale() {
		return categoryScale;
	}

	public void setCategoryScale(String categoryScale) {
		this.categoryScale = categoryScale;
	}

	public String getCategoryPlace() {
		return categoryPlace;
	}

	public void setCategoryPlace(String categoryPlace) {
		this.categoryPlace = categoryPlace;
	}
	
	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	@Override
	public String toString() {
		return " serviceTitle : " + serviceTitle
				+"\n categorySubject : " + categorySubject
				+"\n categoryType : " + categoryType
				+"\n categoryPeriod : " + categoryPeriod
				+"\n categoryScale : " + categoryScale
				+"\n categoryPlace : " + categoryPlace
				+"\n orderBy : " + orderBy;
	}
}
