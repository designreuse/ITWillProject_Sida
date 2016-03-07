package com.itwill.sida.dto;

import java.io.Serializable;

public class AddressBook implements Serializable {
	
	private int ad_no;
	private String ad_m_email;
	private String ad_name;
	private String ad_company;
	private String ad_mnumber;
	private String ad_hnumber;
	private String ad_cnumber;
	private String ad_address;
	private byte[] ad_image;
	private String ad_memo;
	private String ad_email;
	
	public AddressBook(int ad_no, String ad_m_email, String ad_name, String ad_company, String ad_mnumber,
			String ad_hnumber, String ad_cnumber, String ad_address, byte[] ad_image, String ad_memo, String ad_email) {
		super();
		this.ad_no = ad_no;
		this.ad_m_email = ad_m_email;
		this.ad_name = ad_name;
		this.ad_company = ad_company;
		this.ad_mnumber = ad_mnumber;
		this.ad_hnumber = ad_hnumber;
		this.ad_cnumber = ad_cnumber;
		this.ad_address = ad_address;
		this.ad_image = ad_image;
		this.ad_memo = ad_memo;
		this.ad_email = ad_email;
	}


	public AddressBook() {}
	

	public String getAd_email() {
		return ad_email;
	}

	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}


	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}

	public String getAd_m_email() {
		return ad_m_email;
	}

	public void setAd_m_email(String ad_m_email) {
		this.ad_m_email = ad_m_email;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

	public String getAd_company() {
		return ad_company;
	}

	public void setAd_company(String ad_company) {
		this.ad_company = ad_company;
	}

	public String getAd_mnumber() {
		return ad_mnumber;
	}

	public void setAd_mnumber(String ad_mnumber) {
		this.ad_mnumber = ad_mnumber;
	}

	public String getAd_hnumber() {
		return ad_hnumber;
	}

	public void setAd_hnumber(String ad_hnumber) {
		this.ad_hnumber = ad_hnumber;
	}

	public String getAd_cnumber() {
		return ad_cnumber;
	}

	public void setAd_cnumber(String ad_cnumber) {
		this.ad_cnumber = ad_cnumber;
	}

	public String getAd_address() {
		return ad_address;
	}

	public void setAd_address(String ad_address) {
		this.ad_address = ad_address;
	}

	public byte[] getAd_image() {
		return ad_image;
	}


	public void setAd_image(byte[] ad_image) {
		this.ad_image = ad_image;
	}


	public String getAd_memo() {
		return ad_memo;
	}

	public void setAd_memo(String ad_memo) {
		this.ad_memo = ad_memo;
	}

	@Override
	public String toString() {
		return "AddressBook [ad_no=" + ad_no + ", ad_m_email=" + ad_m_email + ", ad_name=" + ad_name + ", ad_company="
				+ ad_company + ", ad_mnumber=" + ad_mnumber + ", ad_hnumber=" + ad_hnumber + ", ad_cnumber="
				+ ad_cnumber + ", ad_address=" + ad_address + ", ad_image=" + ad_image + ", ad_memo=" + ad_memo
				+ ", ad_email=" + ad_email + "]";
	}
}
