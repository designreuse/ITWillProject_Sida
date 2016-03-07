package com.itwill.sida.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.AddressBookDao;
import com.itwill.sida.dto.AddressBook;
import com.itwill.sida.dto.Member;
import com.itwill.sida.service.AddressBookService;

@Component
public class AddressBookServiceImpl implements AddressBookService {
	@Autowired
	public AddressBookDao addressBookDao;
	
	public void setAddressBookDao(AddressBookDao addressBookDao) {
		this.addressBookDao = addressBookDao;
	}

	@Override
	public AddressBook getAddress(String ad_no) {
		return addressBookDao.selectAddressOne(ad_no);
	}

	@Override
	public void addressRegist(AddressBook addressBook) {
		addressBookDao.createAddress(addressBook);
		
	}

	@Override
	public void editAddress(AddressBook addressBook) {
		addressBookDao.updateAddress(addressBook);
		
	}

	@Override
	public void deleteAddress(String ad_no) {
		addressBookDao.deleteAddress(ad_no);
		
	}

	@Override
	public ArrayList<AddressBook> getAddressList(String m_mail) {
		return addressBookDao.getAddressBookList(m_mail);
	}

	@Override
	public ArrayList<AddressBook> findAddressByCompany(HashMap<String, String> cMap) {
		return addressBookDao.findAddressByCompany(cMap);
	}

	@Override
	public ArrayList<AddressBook> findAddressByName(HashMap<String, String> cMap) {
		return addressBookDao.findAddressByName(cMap);
	}

	@Override
	public ArrayList<AddressBook> findAddressByNumber(HashMap<String, String> cMap) {
		return addressBookDao.findAddressByNumber(cMap);
	}

	@Override
	public void insertImg(String sMember) {
		addressBookDao.insertImg(sMember);
		
	}

	@Override
	public HashMap<String, Object> selectAdImage(String ad_no) {
		return addressBookDao.selectAdImage(ad_no);
	}

	@Override
	public void addressBookImageModify(AddressBook addressBook) {
		addressBookDao.updateAddressBookImage(addressBook);
	}
	
}
