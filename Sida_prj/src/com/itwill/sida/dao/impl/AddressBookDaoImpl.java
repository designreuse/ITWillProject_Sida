package com.itwill.sida.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.AddressBookDao;
import com.itwill.sida.dto.AddressBook;
import com.itwill.sida.dto.Member;

import mybatis.mapper.AddressBookMapper;

@Component
public class AddressBookDaoImpl implements AddressBookDao {
	@Autowired
	AddressBookMapper addressBookMapper;
	
	@Override
	public AddressBook selectAddressOne(String ad_no){
		return addressBookMapper.selectAddressOne(ad_no);
	}

	@Override
	public void createAddress(AddressBook addressBook) {
		addressBookMapper.createAddress(addressBook);
	}

	@Override
	public void updateAddress(AddressBook addressBook) {
		addressBookMapper.updateAddress(addressBook);
	}

	@Override
	public void deleteAddress(String ad_no) {
		addressBookMapper.deleteAddress(ad_no);
	}

	@Override
	public ArrayList<AddressBook> getAddressBookList(String m_email) {
		return addressBookMapper.selectAddressList(m_email);
	}

	@Override
	public ArrayList<AddressBook> findAddressByCompany(HashMap<String, String> cMap) {
		return addressBookMapper.findAddressByCompany(cMap);
	}

	@Override
	public ArrayList<AddressBook> findAddressByName(HashMap<String, String> cMap) {
		return addressBookMapper.findAddressByName(cMap);
	}

	@Override
	public ArrayList<AddressBook> findAddressByNumber(HashMap<String, String> cMap) {
		return addressBookMapper.findAddressByNumber(cMap);
	}

	@Override
	public void insertImg(String sMember) {
		addressBookMapper.updateImg(sMember);
		
	}

	@Override
	public HashMap<String, Object> selectAdImage(String ad_no) {
		return addressBookMapper.selectAdImage(ad_no);
	}

	@Override
	public void updateAddressBookImage(AddressBook addressBook) {
		addressBookMapper.updateAddressBookImage(addressBook);
		
	}
}
