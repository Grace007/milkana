package com.bds.milkana.model.common;

import com.bds.milkana.model.TUser;


public class UserSession {
	public final static String sessionKey = "sessionContext";
	public final static String verifyCode = "verifyCode";

	private TUser user;
	private String user_name;
	private Long user_id;
	private String role;
	private String company_id;

	public UserSession(TUser user) {
		this.user = user;
		this.user_name = user.getUsername();
		this.user_id = user.getId();
		this.role = user.getRole();
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public TUser getUser() {
		return this.user;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

}
