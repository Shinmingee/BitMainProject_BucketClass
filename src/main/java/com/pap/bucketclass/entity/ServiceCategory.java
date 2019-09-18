package com.pap.bucketclass.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="service_category")
public class ServiceCategory implements Serializable {
	
	@Id
	@Column(name="category_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long categoryId;
	
	@Column(name="category_subject")
	private String categorySubject;
	
	@Column(name="category_type")
	private String categoryType;
	
	@Column(name="category_period")
	private String categoryPeriod;
	
	@Column(name="category_scale")
	private String categoryScale;
	
	@Column(name="category_place")
	private String categoryPlace;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
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
	
	
}
