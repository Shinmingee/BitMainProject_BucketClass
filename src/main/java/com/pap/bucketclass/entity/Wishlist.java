package com.pap.bucketclass.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.pap.bucketclass.support.BooleanToLongConverter;

@Entity
@Table(name="wishlist")
public class Wishlist implements Serializable{ 
	
	@Id
	@Column(name="wishlist_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long serviceTemplateId;
	
	@Column(name="wish_date")
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@NotNull
	private Date wishDate;

}