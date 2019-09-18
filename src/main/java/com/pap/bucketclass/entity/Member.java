package com.pap.bucketclass.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Email;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.pap.bucketclass.support.BooleanToLongConverter;

@Entity
@Table(name = "member", uniqueConstraints = {@UniqueConstraint(columnNames = {"member_email", "member_nickname"})})
public class Member implements UserDetails, Serializable{

	@Id
	@Column(name = "member_id", updatable = false, nullable = false)
	private String memberId;

	@Column(name = "member_password", nullable = false)
	private String memberPassword;

	@Email
	@Column(name = "member_email", unique = true, nullable = false)
	private String memberEmail;

	@Column(name = "member_nickname", unique = true, nullable = false)
	private String memberNickname;

	@Column(name = "member_join_date", nullable = false)
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date memberJoinDate;

	@Column(name = "member_img", nullable = true)
	private String memberImg;

	@Column(name = "member_isActive", nullable = false)
	@Convert(converter = BooleanToLongConverter.class)
	private Boolean memberIsActive;

	@Column(name = "career", nullable = true)
	private String career;

	@Column(name = "certi", nullable = true)
	private String certi;

	@Column(name = "introduce", nullable = true)
	private String introduce;

	/*********************************************************************************/
	@JsonManagedReference
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name = "member_role",
			joinColumns = @JoinColumn(name = "member_id"),
			inverseJoinColumns = @JoinColumn(name = "role_id")
			)
	private Set<Role> roles = new HashSet<>();

	/*
	 * member -- ServiceTemplate
	 */
	@JsonBackReference
	@OneToMany(mappedBy = "member")
	private Set<ServiceTemplate> serviceTemplates = new HashSet<>();
	
	/*
	 * member -- [wishlist] -- services
	 */
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name = "wishlist",
			joinColumns = @JoinColumn(name = "member_id"),
			inverseJoinColumns = @JoinColumn(name = "service_id")
			)
	private Set<Services> services = new HashSet<>();
	/*********************************************************************************/

	/*
	 * Member Attributes
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
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

	public Date getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public Boolean getMemberIsActive() {
		return memberIsActive;
	}

	public void setMemberIsActive(Boolean memberIsActive) {
		this.memberIsActive = memberIsActive;
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

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<ServiceTemplate> getServiceTemplates() {
		return serviceTemplates;
	}

	public void setServiceTemplates(Set<ServiceTemplate> serviceTemplates) {
		this.serviceTemplates = serviceTemplates;
	}

	/*
	 * UserDetails 
	 */
	@JsonIgnore
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role : getRoles()) {
			authorities.addAll(role.getPrivileges());
		}
		return authorities;
	}	

	@Override //ID
	public String getUsername() {
		return memberId;
	}

	@Override //PASSWORD
	public String getPassword() {
		return memberPassword;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
