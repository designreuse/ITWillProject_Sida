package com.itwill.sida.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.sida.dto.Card;
import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.SchedulerService;
import com.itwill.sida.service.TextFormatUtil;

@Controller
public class CardController {
	@Autowired
	CardService cardService;
	@Autowired
	TextFormatUtil textFormatUtil;
	@Autowired
	SchedulerService schedulerService;

	@RequestMapping("/registrationForm")
	public String cardRegistForm(Model model, HttpSession session) {
		String forwardPath = "index";
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		//
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", member.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		
		model.addAttribute("path", "cardRegist.jsp");
		return forwardPath;
	}

	@RequestMapping("/cardInfomation")
	public String cardInfomation(Model model, HttpSession session) {
		String forwardPath = "index";
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		//
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", member.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		ArrayList<Card> cardList = cardService.getCardListByEmail(member.getM_email());
		model.addAttribute("cardList", cardList);
		model.addAttribute("path", "cardInfomation.jsp");
		return forwardPath;
	}

	@RequestMapping("/registration")
	public String cardRegist(@RequestParam("name") String name, @RequestParam("company") String company,
			@RequestParam(value="keyword") String[] keyword,
			@RequestParam(value = "mainCard", required = false) String mainCard,
			@RequestParam(value = "sms", required = false) String sms, @RequestParam("m_email") String sm_email,
			Model model, HttpSession session) {

		String forwardPath = "index";
		
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		
		HashMap<String, String> cMap = new HashMap<String, String>();
		cMap.put("c_name", name);
		cMap.put("c_company", company);
		cMap.put("c_m_email", sm_email);
		StringBuffer sb = new StringBuffer();
		for (String arr : keyword) {
			sb.append(arr + "`");
		}
		cMap.put("c_keyword", sb.toString());
		cMap.put("c_maincard", mainCard != null ? "1" : "0");
		cMap.put("c_sms_receive", sms != null ? "1" : "0");

		cardService.cardRegist(cMap);
		forwardPath = "index";
		
		//
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", member.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		ArrayList<Card> cardList = cardService.getCardListByEmail(member.getM_email());
		model.addAttribute("cardList", cardList);
		model.addAttribute("path", "cardInfomation.jsp");
		
		return forwardPath;
	}

	@RequestMapping(value = "keywordLoader", produces = "application/json; charset=utf-8")
	public @ResponseBody String keywordLoader(@RequestParam("c_no") String c_no) {
		String rtnedKeyword = cardService.getKeyword(c_no);
		return "{\"keyword\":\"" + rtnedKeyword + "\"}";
	}

	@RequestMapping("/editCardForm")
	public String cardKeywordEditForm(@RequestParam("c_no") String c_no, Model model) {
		String forwardPath = "editCardForm";
		Card card = cardService.getCard(c_no);
		String[] arr = card.getC_keyword().split("[`]");
		ArrayList<String> keywordList = new ArrayList<String>();
		for (String a : arr) {
			if (!a.equals(""))
				keywordList.add(a);
		}
		model.addAttribute("card", card);
		model.addAttribute("keywordList", keywordList);
		return forwardPath;
	}

	@RequestMapping("editCardInfo")
	public String editCardInfo(@RequestParam("c_no") String c_no, @RequestParam("keywordList") String[] keywordList,
			@RequestParam(value = "addedKeywordList", required = false) String[] addedKeywordList,
			@RequestParam(value = "mainCard", required = false) String mainCard,
			@RequestParam(value = "sms", required = false) String sms, Model model) {
		HashMap<String, String> cMap = new HashMap<String, String>();
		String keywordSet = "";

		if (keywordList != null) {
			for (String arr : keywordList) {
				if (arr != null)
					keywordSet += arr + "`";
			}
		}

		if (addedKeywordList != null) {
			for (String arr : addedKeywordList) {
				if (arr != null)
					keywordSet += arr + "`";
			}
		}
		
		String temp = keywordSet.replaceAll("[`]+", " ");
		
		cMap.put("c_no", c_no);
		cMap.put("c_keyword", keywordSet);
		cMap.put("c_mailcard", mainCard != null ? "1" : "0");
		cMap.put("c_sms_receive", sms != null ? "1" : "0");
		cardService.editCard(cMap);
		model.addAttribute("closeFlag", true);
		return "editCardForm";
	}

	@RequestMapping("/deleteCard")
	public String deleteCard(@RequestParam("c_no") String c_no, Model model, HttpSession session) {
		String forwardPath = "index";
		cardService.deleteCard(c_no);

		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		ArrayList<Card> cardList = cardService.getCardListByEmail(member.getM_email());

		model.addAttribute("cardList", cardList);
		model.addAttribute("path", "cardInfomation.jsp");
		return forwardPath;
	}
}
