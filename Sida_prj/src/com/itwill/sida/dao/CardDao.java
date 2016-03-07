package com.itwill.sida.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.sida.dto.Card;

public interface CardDao {
	void cardRegist(HashMap<String, String> cMap);
	ArrayList<Card> getCardListByEmail(String m_email);
	String getKeyword(String c_no);
	Card getCard(String c_no);
	void editCard(HashMap<String, String> cMap);
	void deleteCard(String c_no);
	ArrayList<Card> getCardListByPhoneNum(String phone);
	ArrayList<Card> getCardListByPhoneNum_smsReceive(String phone);
}