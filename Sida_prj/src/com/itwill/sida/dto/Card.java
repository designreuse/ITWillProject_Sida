package com.itwill.sida.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "guest_list")
@XmlAccessorType(XmlAccessType.NONE)
public class Card {
	
	private int c_no;
	private String c_m_email;
	private String c_name;
	private String c_company;
	private String c_keyword;
	private String c_maincard;
	private String c_sms_receive;
	
	@XmlElement(name="c_no")
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	@XmlElement(name="c_m_email")
	public String getC_m_email() {
		return c_m_email;
	}
	public void setC_m_email(String c_m_email) {
		this.c_m_email = c_m_email;
	}
	@XmlElement(name="c_name")
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	@XmlElement(name="c_company")
	public String getC_company() {
		return c_company;
	}
	public void setC_company(String c_company) {
		this.c_company = c_company;
	}
	@XmlElement(name="c_keyword")
	public String getC_keyword() {
		return c_keyword;
	}
	public void setC_keyword(String c_keyword) {
		this.c_keyword = c_keyword;
	}
	@XmlElement(name="c_maincard")
	public String getC_maincard() {
		return c_maincard;
	}
	public void setC_maincard(String c_maincard) {
		this.c_maincard = c_maincard;
	}
	@XmlElement(name="c_sms_receice")
	public String getC_sms_receive() {
		return c_sms_receive;
	}
	public void setC_sms_receive(String c_sms_receive) {
		this.c_sms_receive = c_sms_receive;
	}
	@Override
	public String toString() {
		return "Card [c_no=" + c_no + ", c_m_email=" + c_m_email + ", c_name=" + c_name + ", c_company=" + c_company
				+ ", c_keyword=" + c_keyword + ", c_maincard=" + c_maincard + ", c_sms_receive=" + c_sms_receive + "]";
	}
	
}
