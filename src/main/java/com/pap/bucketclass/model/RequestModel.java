package com.pap.bucketclass.model;

import java.io.Serializable;

public class RequestModel implements Serializable {
	
	private String req;

	public String getReq() {
		return req;
	}
	
	public void setReq(String req) {
		this.req = req;
	}
	
	public void setNickname(String req) {
		this.req = req;
	}
	

	public void setMemberId(String req) {
		this.req = req;
	}
	

	public void setMemberEmail(String req) {
		this.req = req;
	}

	@Override
	public String toString() {
		return "req : " + req;
	}
	
	
	
}
