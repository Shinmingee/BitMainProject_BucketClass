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
@Table(name="service_address")
public class ServiceAddress implements Serializable {
	
	@Id
	@Column(name="address_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long addressId;
	
	@Column(name="address_state")
	@NotNull
	private String addressState;
	
	@Column(name="address_city")
	@NotNull
	private String addressCity;
	
	@Column(name="address_dong")
	@NotNull
	private String addressDong;

	@Column(name="address_detail")
	private String addressDetail;

	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
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
	
}
