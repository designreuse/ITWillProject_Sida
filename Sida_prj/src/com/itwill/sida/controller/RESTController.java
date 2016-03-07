package com.itwill.sida.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.sida.dto.Card;
import com.itwill.sida.dto.CardResult;
import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.MoneyBook;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.MemberService;
import com.itwill.sida.service.MoneyBookService;

@Controller
public class RESTController {
	@Autowired
	CardService cardService;
	@Autowired
	MemberService memberService;
	@Autowired
	MoneyBookService moneyBookService;
	
	
	@RequestMapping(value = "getCardListREST", produces = "application/xml; charset=utf-8")
	public @ResponseBody CardResult getCardListREST(@RequestParam("phoneNum") String phoneNum) {
		ArrayList<Card> cardList = cardService.getCardListByPhoneNum_smsReceive(phoneNum);
		CardResult cardResult = new CardResult();
		cardResult.setCardList(cardList);
		cardResult.setSize(cardList.size());
		return cardResult;
	}

	@RequestMapping(value = "sendCardDataREST")
	public void sendCardData(@RequestParam("phoneNum") String phoneNum, @RequestParam("pay") String pay,
			@RequestParam("c_no") String c_no) {
		
		System.err.println(phoneNum+":"+c_no+":"+pay);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		String regxPay = pay.replaceAll("[가-힣,]+", "");
		Member member = memberService.findMemberByPhoneNo(phoneNum);
		HashMap<String, String> mMap = new HashMap<String, String>();
		
		mMap.put("mb_m_email", member.getM_email());
		mMap.put("mb_date", sdf.format(date));
		mMap.put("mb_outgo", regxPay);
		mMap.put("mb_outType", c_no);
		
		try {
			moneyBookService.insertMoneyBook(mMap);
		} catch (Exception e) {
		}
	}
}