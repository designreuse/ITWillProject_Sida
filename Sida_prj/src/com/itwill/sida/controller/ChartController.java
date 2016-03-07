package com.itwill.sida.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.MoneyUseResult;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.MoneyBookService;

@Controller
public class ChartController {

	@Autowired
	MoneyBookService moneyBookService;
	
	@Autowired
	CardService cardService;

	@RequestMapping(value="/mainChart_RevenuesPrinter", produces = "application/json; charset=utf-8")
	public String mainChart_RevenuesPrinter(HttpSession session){
		if ((Member) session.getAttribute("sMember") == null) {
			return null;
		}
		Member member = (Member) session.getAttribute("sMember");
		return null;
	}
	
	@RequestMapping(value="/mainChart_ConversionPrinter", produces = "application/json; charset=utf-8")
	public @ResponseBody MoneyUseResult mainChart_ConversionPrinter(HttpSession session){
		if ((Member) session.getAttribute("sMember") == null) {
			return null;
		}
		Member member = (Member) session.getAttribute("sMember");
		MoneyUseResult moneyUseList = mainChartResourceMapper(member);
		return moneyUseList;
	}
	
	@RequestMapping(value="mainChart_RevenueCardNamePrinter", produces="application/json; charset=utf-8")
	public @ResponseBody String mainChart_RevenueCardNamePrinter(HttpSession session){
		if ((Member) session.getAttribute("sMember") == null) {
			return null;
		}
		Member member = (Member) session.getAttribute("sMember");
		
		Date date = new Date();
		String formatMonth = String.format("%02d", date.getMonth()+1);
		int thisYear = date.getYear()+1900;
		ArrayList<HashMap<String, String>> cardListTemp = moneyBookService.selectMoneyBook_CardUsage(thisYear, formatMonth, member.getM_email());
		
		String jsonTemp = "[";
		for(int i=0 ;i<cardListTemp.size();i++){
			jsonTemp += "{\"cardName\":\""+cardListTemp.get(i).get("c_name")+"\"}";
			if(i!=cardListTemp.size()-1)
				jsonTemp +=",";
		}
		jsonTemp += "]";
		return jsonTemp;
	}

	private MoneyUseResult mainChartResourceMapper(Member member) {
		Date date = new Date();
		String[] thisYear_MonthlyUsed = new String[12];
		String[] lastYear_MonthlyUsed = new String[12];
		
		// 올해 총액
		int thisYear = date.getYear() + 1900;
		for (int i = 0; i <= 11; i++) {
			String format = String.format("%02d", i+1);
			thisYear_MonthlyUsed[i] = moneyBookService.selectUsedListByMonth(thisYear, format, member.getM_email());
		}
		// 작년 총액
		for (int i = 0; i <= 11; i++) {
			String format = String.format("%02d", i+1);
			lastYear_MonthlyUsed[i] = moneyBookService.selectUsedListByMonth(thisYear-1, format, member.getM_email());
		}
		
		//
		String formatMonth = String.format("%02d", date.getMonth()+1);
		
		ArrayList<HashMap<String, String>> cardListTemp = moneyBookService.selectMoneyBook_CardUsage(thisYear, formatMonth, member.getM_email());
		ArrayList<HashMap<String, String>> cardList = new ArrayList<HashMap<String, String>>();
		
		for(HashMap<String, String> arr : cardListTemp){
			Iterator it = arr.keySet().iterator();
			HashMap<String, String> tempMap = new HashMap<String, String>();
			while(it.hasNext()){
				String key = (String) it.next();
				tempMap.put(key, String.valueOf(arr.get(key)));
			}
			cardList.add(tempMap);
		}
		
		MoneyUseResult myr = new MoneyUseResult();
		
		myr.setThis_Jan(thisYear_MonthlyUsed[0]==null?"0":thisYear_MonthlyUsed[0]);
		myr.setThis_Feb(thisYear_MonthlyUsed[1]==null?"0":thisYear_MonthlyUsed[1]);
		myr.setThis_Mar(thisYear_MonthlyUsed[2]==null?"0":thisYear_MonthlyUsed[2]);
		myr.setThis_Apr(thisYear_MonthlyUsed[3]==null?"0":thisYear_MonthlyUsed[3]);
		myr.setThis_May(thisYear_MonthlyUsed[4]==null?"0":thisYear_MonthlyUsed[4]);
		myr.setThis_Jun(thisYear_MonthlyUsed[5]==null?"0":thisYear_MonthlyUsed[5]);
		myr.setThis_Jul(thisYear_MonthlyUsed[6]==null?"0":thisYear_MonthlyUsed[6]);
		myr.setThis_Aug(thisYear_MonthlyUsed[7]==null?"0":thisYear_MonthlyUsed[7]);
		myr.setThis_Sep(thisYear_MonthlyUsed[8]==null?"0":thisYear_MonthlyUsed[8]);
		myr.setThis_Oct(thisYear_MonthlyUsed[9]==null?"0":thisYear_MonthlyUsed[9]);
		myr.setThis_Nov(thisYear_MonthlyUsed[10]==null?"0":thisYear_MonthlyUsed[10]);
		myr.setThis_Dec(thisYear_MonthlyUsed[11]==null?"0":thisYear_MonthlyUsed[11]);
		
		myr.setLast_Jan(lastYear_MonthlyUsed[0]==null?"0":lastYear_MonthlyUsed[0]);
		myr.setLast_Feb(lastYear_MonthlyUsed[1]==null?"0":lastYear_MonthlyUsed[1]);
		myr.setLast_Mar(lastYear_MonthlyUsed[2]==null?"0":lastYear_MonthlyUsed[2]);
		myr.setLast_Apr(lastYear_MonthlyUsed[3]==null?"0":lastYear_MonthlyUsed[3]);
		myr.setLast_May(lastYear_MonthlyUsed[4]==null?"0":lastYear_MonthlyUsed[4]);
		myr.setLast_Jun(lastYear_MonthlyUsed[5]==null?"0":lastYear_MonthlyUsed[5]);
		myr.setLast_Jul(lastYear_MonthlyUsed[6]==null?"0":lastYear_MonthlyUsed[6]);
		myr.setLast_Aug(lastYear_MonthlyUsed[7]==null?"0":lastYear_MonthlyUsed[7]);
		myr.setLast_Sep(lastYear_MonthlyUsed[8]==null?"0":lastYear_MonthlyUsed[8]);
		myr.setLast_Oct(lastYear_MonthlyUsed[9]==null?"0":lastYear_MonthlyUsed[9]);
		myr.setLast_Nov(lastYear_MonthlyUsed[10]==null?"0":lastYear_MonthlyUsed[10]);
		myr.setLast_Dec(lastYear_MonthlyUsed[11]==null?"0":lastYear_MonthlyUsed[11]);
		
		myr.setCardList(cardList);
		
		return myr;
	}
}
