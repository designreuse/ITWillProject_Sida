package com.itwill.sida.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.CardDao;
import com.itwill.sida.dto.Card;
import com.itwill.sida.service.CardService;

@Component
public class CardServiceImpl implements CardService {
	@Autowired
	public CardDao cardDao;

	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}

	@Override
	public void cardRegist(HashMap<String, String> cMap) {
		cardDao.cardRegist(cMap);
	}

	@Override
	public ArrayList<Card> getCardListByEmail(String m_email) {
		return cardDao.getCardListByEmail(m_email);
	}

	@Override
	public String getKeyword(String c_no) {
		return cardDao.getKeyword(c_no);
	}

	@Override
	public Card getCard(String c_no) {
		return cardDao.getCard(c_no);
	}

	@Override
	public void editCard(HashMap<String, String> cMap) {
		cardDao.editCard(cMap);
	}

	@Override
	public void deleteCard(String c_no) {
		cardDao.deleteCard(c_no);
	}

	@Override
	public ArrayList<Card> getCardListByPhoneNum(String phone) {
		return cardDao.getCardListByPhoneNum(phone);
	}

	@Override
	public ArrayList<Card> getCardListByPhoneNum_smsReceive(String phone) {
		return cardDao.getCardListByPhoneNum_smsReceive(phone);
	}
}
