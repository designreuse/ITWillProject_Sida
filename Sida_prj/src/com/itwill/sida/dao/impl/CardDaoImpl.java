package com.itwill.sida.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.CardDao;
import com.itwill.sida.dto.Card;
import com.itwill.util.MyBatisSqlSessionFactory;

import mybatis.mapper.CardMapper;

@Component
public class CardDaoImpl implements CardDao {
	@Autowired
	CardMapper cardMapper;
	
	@Override
	public void cardRegist(HashMap<String, String> cMap) {
		cardMapper.insertCard(cMap);
		System.err.println(cMap);
	}

	@Override
	public ArrayList<Card> getCardListByEmail(String m_email) {
		ArrayList<Card> cardList = null;
		cardList = cardMapper.selectCardListByEmail(m_email);
		return cardList;
	}

	@Override
	public String getKeyword(String c_no) {
		String rtnedKeyword = null;
		rtnedKeyword = cardMapper.selectKeyword(c_no);
		return rtnedKeyword;
	}

	@Override
	public Card getCard(String c_no) {
		Card card = null;
		card = cardMapper.selectCard(c_no);
		return card;
	}

	@Override
	public void editCard(HashMap<String, String> cMap) {
		cardMapper.updateCard(cMap);
	}

	@Override
	public void deleteCard(String c_no) {
		cardMapper.deleteCard(c_no);
	}

	@Override
	public ArrayList<Card> getCardListByPhoneNum(String phone) {
		ArrayList<Card> cardList = null;
		cardList = cardMapper.selectCardListByPhoneNum(phone);
		return cardList;
	}

	@Override
	public ArrayList<Card> getCardListByPhoneNum_smsReceive(String phone) {
		ArrayList<Card> cardList = null;
		cardList = cardMapper.selectCardListByPhoneNum_smsReceive(phone);
		return cardList;
	}
}
