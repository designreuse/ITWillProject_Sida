package com.itwill.sida.dto;

public class Member {
	
	private String m_email; 
	private String m_pwd; 
	private String m_name; 
	private String m_image;
	private String m_profile;
	private String m_phone;
	
	public Member() {
	}
	
	public Member(String m_email, String m_pwd, String m_name, String m_image, String m_profile, String m_phone) {
		super();
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_image = m_image;
		this.m_profile = m_profile;
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	@Override
	public String toString() {
		return "Member [m_email=" + m_email + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_image=" + m_image
				+ ", m_profile=" + m_profile + ", m_phone=" + m_phone + "]";
	}
}
