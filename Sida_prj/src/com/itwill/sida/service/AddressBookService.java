package com.itwill.sida.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.sida.dto.AddressBook;
import com.itwill.sida.dto.Member;

public interface AddressBookService {
	AddressBook getAddress(String ad_no);
	void addressRegist(AddressBook addressBook);
	void editAddress(AddressBook addressBook);
	void deleteAddress(String ad_no);
	ArrayList<AddressBook> getAddressList(String m_mail);
	
	ArrayList<AddressBook> findAddressByCompany(HashMap<String, String> cMap);
	ArrayList<AddressBook> findAddressByName(HashMap<String, String> cMap);
	ArrayList<AddressBook> findAddressByNumber(HashMap<String, String> cMap);
	void insertImg(String sMember);
	HashMap<String, Object> selectAdImage(String ad_no);
	void addressBookImageModify(AddressBook addressBook);
}