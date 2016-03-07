package com.itwill.sida.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.sida.dto.Card;
import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.MoneyBook;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.MoneyBookService;
import com.itwill.sida.service.SchedulerService;
import com.itwill.sida.service.TextFormatUtil;

@Controller
public class MoneyBookController {
	@Autowired
	MoneyBookService moneyBookService;
	@Autowired
	CardService cardService;
	@Autowired
	TextFormatUtil textFormatUtil;
	@Autowired
	SchedulerService schedulerService;


	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	@RequestMapping("expenseOutTypeResult")
	public List<MoneyBook> expenseOutTypeResult(@RequestParam("mb_date") String mb_date, Model model) throws Exception {
		List<MoneyBook> moneyBookList = null;
		moneyBookList = moneyBookService.findMoneyBookOutTypeResult(mb_date);
		System.err.println("expenseOutTypeResult:" + moneyBookList);
		return moneyBookList;
	}

	@RequestMapping(value = "/expenseDateList", produces = "application/json")
	public @ResponseBody List<MoneyBook> expenseDateList(@RequestParam("mb_date") String mb_date, @RequestParam("mb_m_email") String mb_m_email, Model model)
			throws Exception {
		
		System.err.println("mb_date:" + mb_date);
		System.err.println("mb_m_email:" + mb_m_email);
		
		StringBuffer sb = new StringBuffer(mb_date);
        sb.insert(4, "-");
        sb.insert(7, "-");
	    System.err.println("mb_date:" + sb);
	    String date = sb.toString();
	    
		List<MoneyBook> moneyBookList = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mb_date", date);
		map.put("mb_m_email", mb_m_email);
		//moneyBookList = moneyBookService.findMoneyBookDateExpense(date);
		moneyBookList = moneyBookService.findMoneyBookOutTypeEmail(map);
		
		System.err.println("날짜별 세부지출목록:" + moneyBookList);

		return moneyBookList;

	}

	@RequestMapping(value = "/searchDate", produces = "application/json")
	public @ResponseBody List<MoneyBook> searchDate(@RequestParam("mb_date") String mb_date,
			@RequestParam("mb_m_email") String mb_m_email, Model model, HttpSession session) throws Exception {
		List<MoneyBook> minMaxSumResult = null; // findMinMaxSum 결과값
		List<MoneyBook> monthDate = null; // findMinMaxSum 결과값
		List<MoneyBook> moneyBookOutType = null; // 지출형태 결과값
		List<MoneyBook> moneyList = null; // outType 결과값
		List<MoneyBook> resultAll = null; // 전체 출력
		List<MoneyBook> test = null; // 전체 출력
		List<MoneyBook> sumMoneyResult = null; // 전체 출력
		List<MoneyBook> totList = new ArrayList<MoneyBook>();
		List<String> list = new ArrayList<String>();
		List<Object> listSum = new ArrayList<Object>();
		List<Integer> listNo = new ArrayList<Integer>();
		List<HashMap<String, Integer>> arrList = new ArrayList<HashMap<String,Integer>>();

		List<MoneyBook> mbList = new ArrayList<MoneyBook>();
		MoneyBook mb = new MoneyBook();

		System.err.println("db_date : " + mb_date);

		String tempListNo = "";
		int tempMin = 0;
		String tempMinS = "";
		String tempMax = "";
		List<Integer> sumT = new ArrayList<Integer>();
		int sumVar = 0;
		int sumTemp = 0;
		String dateCheck = "";

		List<Map<String, String>> search_list = new ArrayList<Map<String, String>>(); // findMinMaxSum
		HashMap<String, String> map = new HashMap<String, String>();
		List<Map<String, String>> search_listT = new ArrayList<Map<String, String>>(); // findMinMaxSum
		HashMap<String, String> mapT = new HashMap<String, String>();

		int mb_no = 0;

		map.put("mb_date", mb_date);
		map.put("mb_m_email", mb_m_email);
		search_list.add(map);
		/*****************
		 * 지출 소비 시작 ~ 지출 소비 끝 ~ 한달 지출사용 총 금액
		 ************************/
		minMaxSumResult = moneyBookService.dateList(map);

		for (MoneyBook arr : minMaxSumResult) {
			totList.add(arr);
		}

		test = moneyBookService.test(map);
		monthDate = moneyBookService.findMonthDate(map);
		System.err.println("test : " + map);

		String year_Month = "";
		ArrayList<HashMap<String, Integer>> totMoneyList = new ArrayList<HashMap<String, Integer>>();
		int totMoney = 0;
		HashMap<String, Integer> totMoneyMap = new HashMap<String, Integer>();
		List<String> ym = new ArrayList<String>();
		List<Integer> outgo = new ArrayList<Integer>();
		List<String> tot = new ArrayList<String>();
		for (MoneyBook arr : test) {
			String[] trimDate = arr.getMb_date().split("[ ]");
			String[] temp = trimDate[0].split("[-]");
			String[] tempDate = null;
			String[] tempTT = null;
			String tempStr = "";
			HashMap<String, Integer> totMap = new HashMap<String, Integer>();
			year_Month = temp[0] += temp[1] + temp[2];
			
			for (int i = 0; i < test.size(); i++) {
				tempDate = test.get(i).getMb_date().split("[ ]");
				tempTT = tempDate[0].split("[-]");
				tempStr = tempTT[0] += tempTT[1] + tempTT[2];
				
				if (year_Month.equals(tempStr)) {
					//System.out.println(tempStr + "더합니다");
					totMoney += test.get(i).getMb_outgo();
					//System.out.println("totMoney출력:" + totMoney);
				} else {
					//System.out.println("더하지않습니다");
					totMoney += 0;
				}
			}
			totMoneyMap.put(year_Month, totMoney);
			/*********정렬 테스트 중***********************/
			monthDate=moneyBookService.findMonthDate(map);
			System.err.println("monthDate 전:"+monthDate);
			TreeMap<String, Integer> descList = new TreeMap<String,Integer>(Collections.reverseOrder());
			descList.putAll(totMoneyMap);
			Iterator<String> descIter = descList.keySet().iterator();
			while(descIter.hasNext()){
				String key = descIter.next();
				ym.add(key);
				Integer value = descList.get(key);
				outgo.add(value);
				System.err.println("정렬:"+key+":"+value);
				
			}
			/*******************************************************************************************/
			totMoneyList.add(totMoneyMap);
			totMoney = 0;
			totMoneyMap = new HashMap<String, Integer>();
		}
		/*System.err.println("에러나는곳찾자:");
		System.err.println("ymsize:"+ym.size());
		System.err.println("ym:"+ym);
		System.err.println("monthDatesize:"+monthDate.size());
		System.err.println("monthDate:"+monthDate);*/
		try{
		for (int i = 0; i < ym.size(); i++) {
			
			System.err.println("여기냐:"+i);
			monthDate.get(i).setMb_date(ym.get(i));
			monthDate.get(i).setMb_outgo(outgo.get(i));
		}
		} catch (Exception e){
			expense(model, session);
		}
		sumMoneyResult=new ArrayList<MoneyBook>(new HashSet<MoneyBook>(monthDate));
		Collections.sort(sumMoneyResult, new Comparator<MoneyBook>() { //hashSet 내림차순 정렬(날짜기준)
			@Override
			public int compare(MoneyBook o1, MoneyBook o2) {
				return o2.getMb_date().compareTo(o1.getMb_date());
			}
			
		} );
		for (MoneyBook arr : sumMoneyResult) { //날짜기준 정렬 결과 totList에 담기
			System.err.println("sumMoneyResult");
			totList.add(arr);
		}
		//arrList = new ArrayList<HashMap<String, Integer>>(new HashSet<HashMap<String, Integer>>(totMoneyList));
		
		/***********************************************************************/
		List<MoneyBook> chartList=null;
		chartList=moneyBookService.percentChart(map);
		for (MoneyBook arr : chartList) { //날짜기준 정렬 결과 totList에 담기
			System.err.println("chartList");
			totList.add(arr);
		}
		/***********************************************************************/
		System.err.println("test:" + test);
		System.err.println("totList:" + totList);
		return totList;
	}

	/*
	 * @RequestMapping(value="/searchDate", produces="application/json")
	 * public @ResponseBody List<MoneyBook> searchDate(@RequestParam("mb_date")
	 * String mb_date, @RequestParam("mb_m_email") String mb_m_email, Model
	 * model, HttpSession session) throws Exception{ List<MoneyBook>
	 * minMaxSumResult = null; // findMinMaxSum 결과값 List<MoneyBook> monthDate =
	 * null; // findMinMaxSum 결과값 List<MoneyBook> moneyBookOutType = null; //
	 * 지출형태 결과값 List<MoneyBook> moneyList = null; //outType 결과값 List<MoneyBook>
	 * resultAll = null; //전체 출력 List<MoneyBook> totList = new
	 * ArrayList<MoneyBook>(); List<String> list = new ArrayList<String>();
	 * List<Integer> listNo = new ArrayList<Integer>(); String tempListNo="";
	 * 
	 * List<Map<String, String>> search_list = new ArrayList<Map<String,
	 * String>>(); // findMinMaxSum HashMap<String, String> map = new
	 * HashMap<String, String>(); int mb_no=0;
	 * 
	 * map.put("mb_date", mb_date); map.put("mb_m_email", mb_m_email);
	 * search_list.add(map);
	 * 
	 * minMaxSumResult = moneyBookService.dateList(map); for(MoneyBook arr :
	 * minMaxSumResult){ totList.add(arr); } monthDate
	 * =moneyBookService.findMonthDate(map);
	 * System.err.println("monthDate:"+monthDate);
	 * 
	 *//**************************/

	/*
	 * for (int i = 0; i < monthDate.size(); i++) {
	 * 
	 * mb_date = monthDate.get(i).getMb_date(); String temp = ""; String
	 * tempList = "";
	 * 
	 * 
	 * moneyBookOutType = moneyBookService.findMoneyBookOutTypeResult(mb_date);
	 * for(MoneyBook arr : moneyBookOutType){ totList.add(arr); }
	 * System.err.println("&&moneyBookOutType:" + moneyBookOutType);
	 * 
	 * for (int j = 0; j < moneyBookOutType.size(); j++) { temp +=
	 * moneyBookOutType.get(j).getMb_outType(); }
	 * 
	 * System.err.println("test@@@@@@@@@@@@@@@:"+temp);
	 * 
	 * if (temp.matches(".*[0-9]+현금*")) { System.err.println("1"); tempList =
	 * "CARD/CASH"; } else if (temp.matches(".*현금.*[0-9]")) {
	 * System.err.println("2"); tempList = "CARD/CASH"; } else if
	 * (temp.matches(".*[0-9]+현금.*")) { System.err.println("3"); tempList =
	 * "CARD/CASH"; } else if (temp.matches("^\\d+\\n")) {
	 * System.err.println("4"); tempList = "CARD"; } else if
	 * (temp.matches(".*현금*.")) { System.err.println("5"); tempList = "CASH"; }
	 * 
	 * // 카드만 있으면 카드 출력 // 카드+현금 둘다있으면 카드/현금 출력 // 현금만 썼으면 현금출력 if
	 * (temp.matches(".*카드현금*")) { // System.err.println("1"); tempList =
	 * "CARD/CASH"; } else if (temp.matches(".*현금.*카드")) { //
	 * System.err.println("2"); tempList = "CARD/CASH"; } else if
	 * (temp.matches(".*카드현금.*")) { // System.err.println("3"); tempList =
	 * "CARD/CASH"; } else if (temp.matches(".*카드*.")) { //
	 * System.err.println("4"); tempList = "CARD"; } else if
	 * (temp.matches(".*현금*.")) { // System.err.println("5"); tempList = "CASH";
	 * } list.add(tempList); monthDate.get(i).setMb_outType(tempList);
	 * 
	 * resultAll = moneyBookService.resultMonthAll(map); for(int j=0;
	 * j<resultAll.size();j++){ mb_no=resultAll.get(i).getMb_no();
	 * listNo.add(mb_no); } monthDate.get(i).setMb_no(mb_no);
	 * 
	 * } for(MoneyBook arr : monthDate){ totList.add(arr); }
	 *//************************************//*
											 * for (int i = 0; i < list.size();
											 * i++) { System.err.println("list["
											 * + i + "]:" + list.get(i)); }
											 * 
											 * System.err.println("totList:"+
											 * totList); return totList; }
											 */
	private HashMap<String, Object> rtnMoneyBookList_frontExpense(Member member) throws Exception {
		List<MoneyBook> moneyBookList = null; // 이메일별 정보
		List<MoneyBook> moneyBookResult = null; // 날짜별 지출 총 금액
		List<MoneyBook> moneyBookOutType = null; // 지출형태(현금or카드)
		List<MoneyBook> minMaxSumResult = null; // findMinMaxSum 결과값

		List<Map<String, String>> search_list = new ArrayList<Map<String, String>>(); // findMinMaxSum
		// 결과값
		String mb_m_email = member.getM_email();
		String mb_date = null;
		String search_value = null; // ex)201601__ subString한 값
		List<String> search_test = new ArrayList<String>();
		List<String> uniqueItems = new ArrayList<String>();
		List<String> unique = new ArrayList<String>();

		moneyBookList = moneyBookService.findMoneyBookEmailResult(mb_m_email);

		System.err.println("전체 정보:" + moneyBookList);
		moneyBookResult = moneyBookService.findMoneyBookDate(mb_m_email);
		System.err.println("날짜별 지출총액:" + moneyBookResult);

		for (int i = 0; i < moneyBookResult.size(); i++) {

			mb_date = moneyBookResult.get(i).getMb_date();

			String temp = "";
			String tempList = "";
			search_value = mb_date.substring(0, 7); // 2016-01

			moneyBookOutType = moneyBookService.findMoneyBookOutTypeResult(mb_date);
			System.err.println("!date:" + mb_date);
			System.err.println("subString test!!!!!!:" + search_value);

			for (int j = 0; j < moneyBookOutType.size(); j++) {
				temp += moneyBookOutType.get(j).getMb_outType();
			}
			System.err.println("뭐가나올까:" + temp);

			search_test.add(search_value);
			uniqueItems = new ArrayList<String>(new HashSet<String>(search_test));
			Collections.sort(uniqueItems, new Comparator<String>() { //hashSet 내림차순 정렬(날짜기준)
				@Override
				public int compare(String o1, String o2) {
					return o2.compareTo(o1);
				}
				
			} );
			System.err.println("uniqueItems:" + uniqueItems);
		}
		System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!search_value:" + search_value);
		System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!mb_m_email:" + mb_m_email);
		System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!uniqueItems:" + uniqueItems);

		/*HashMap<String, String> map = new HashMap<String, String>();
		map.put("search_value", search_value);
		map.put("mb_m_email", mb_m_email);
		search_list.add(map);

		minMaxSumResult = moneyBookService.findMinMaxSum(map);
		System.err.println("minMaxSumResult:" + minMaxSumResult);
*/
		HashMap<String, Object> mMap = new HashMap<String, Object>();

		//mMap.put("minMaxSumResult", minMaxSumResult);
		mMap.put("uniqueItems", uniqueItems);
		mMap.put("moneyBookList", moneyBookList);
		mMap.put("moneyBookResult", moneyBookResult);
		mMap.put("mb_m_email", mb_m_email);
		return mMap;
	}

	@RequestMapping("expense")
	public String expense(Model model, HttpSession session) throws Exception {
		String forwardPath = "index";

		Member member = (Member) session.getAttribute("sMember");

		if (member == null) {
			forwardPath = "redirect:login";
		} else {
			HashMap<String, Object> mMap = rtnMoneyBookList_frontExpense(member);

			// 상단 Nav바 지출내역 리스트
			ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
			model.addAttribute("head_nav_moneyList_size", moneyMap.size());
			model.addAttribute("head_nav_moneyList", moneyMap);
			//
			/******************** schedule 알람 *****************************/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = sdf.format(new Date());
			HashMap<String, String> sMap = new HashMap<String, String>();
			sMap.put("s_m_email", member.getM_email());
			sMap.put("s_end", strDate);
			List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
			model.addAttribute("scList", scList);
			/*****************************************************************/
			//model.addAttribute("minMaxSumResult", mMap.get("minMaxSumResult"));
			model.addAttribute("uniqueItems", mMap.get("uniqueItems"));
			model.addAttribute("moneyBookList", mMap.get("moneyBookList"));
			model.addAttribute("moneyBookResult", mMap.get("moneyBookResult"));
			model.addAttribute("mb_m_email", mMap.get("mb_m_email"));
			model.addAttribute("path", "expense.jsp");
		}
		return forwardPath;
	}

	@RequestMapping("moneyBookInsert")
	public String moneyBookInsert(Model model, HttpSession session) {
		String forwardPath = "index";
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}

		ArrayList<Card> cardList = null;

		Member member = (Member) session.getAttribute("sMember");
		String m_email = member.getM_email();

		cardList = cardService.getCardListByEmail(m_email);

		// 상단 Nav바 지출내역 리스트
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/******************** schedule 알람 *****************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", member.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/

		model.addAttribute("mb_m_email", m_email);
		model.addAttribute("cardList", cardList);
		model.addAttribute("path", "moneyBookInsert.jsp");
		return forwardPath;

	}

	@RequestMapping("moneyBookInsertAction")
	public String moneyBookInsertAction(@RequestParam("mb_date") String mb_date,
			@RequestParam(value = "mb_outgo", required = false) int mb_outgo,
			@RequestParam(value = "mb_income", required = false) int mb_income,
			@RequestParam(value = "mb_memo", required = false) String mb_memo,
			@RequestParam(value = "mb_category", required = false) String mb_category,
			@RequestParam("mb_m_email") String mb_m_email, @RequestParam("mb_outType") String mb_outType, Model model,
			HttpSession session) throws Exception {
		String forwardPath = "redirect:expense";
		HashMap<String, String> mMap = new HashMap<String, String>();
		String[] temp;
		String tempAdd = "";
		temp = mb_date.split("/");
		for (int i = 0; i < temp.length; i++) {
			tempAdd += temp[i];
		}

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		Date currentTime = new Date();
		currentTime.setYear(Integer.parseInt(temp[0]) - 1900);
		currentTime.setMonth(Integer.parseInt(temp[1]) - 1);
		currentTime.setDate(Integer.parseInt(temp[2]));

		String dTime = sdf.format(currentTime);

		mMap.put("mb_m_email", mb_m_email);
		mMap.put("mb_date", dTime);
		mMap.put("mb_category", mb_category);
		mMap.put("mb_income", mb_income + "");
		mMap.put("mb_outgo", mb_outgo + "");
		mMap.put("mb_outType", mb_outType);
		mMap.put("mb_memo", mb_memo);

		System.err.println("moneyBookInsert:" + tempAdd + "," + mb_outgo + "," + mb_memo + "," + mb_category + ","
				+ mb_m_email + "," + mb_outType + "," + mb_income);

		moneyBookService.insertMoneyBook(mMap);

		Member member = (Member) session.getAttribute("sMember");

		rtnMoneyBookList_frontExpense(member);
		HashMap<String, Object> tMap = rtnMoneyBookList_frontExpense(member);

		//model.addAttribute("minMaxSumResult", tMap.get("minMaxSumResult"));
		
		// 상단 Nav바 지출내역 리스트
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		
		model.addAttribute("uniqueItems", tMap.get("uniqueItems"));
		model.addAttribute("moneyBookList", tMap.get("moneyBookList"));
		model.addAttribute("moneyBookResult", tMap.get("moneyBookResult"));
		model.addAttribute("mb_m_email", tMap.get("mb_m_email"));
		model.addAttribute("path", "expense.jsp");
		
		return forwardPath;

	}

	@RequestMapping("deleteMoneyBook")
	public String deleteMoneyBook(@RequestParam("mb_no") int mb_no, Model model, HttpSession session) throws Exception {
		String forwardPath = "index";

		moneyBookService.deleteMoneyBook(mb_no);

		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		rtnMoneyBookList_frontExpense(member);
		HashMap<String, Object> tMap = rtnMoneyBookList_frontExpense(member);

		//model.addAttribute("minMaxSumResult", tMap.get("minMaxSumResult"));
		model.addAttribute("uniqueItems", tMap.get("uniqueItems"));
		model.addAttribute("moneyBookList", tMap.get("moneyBookList"));
		model.addAttribute("moneyBookResult", tMap.get("moneyBookResult"));
		model.addAttribute("mb_m_email", tMap.get("mb_m_email"));
		
		// 상단 Nav바 지출내역 리스트
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		
		model.addAttribute("path", "expense.jsp");
		return forwardPath;

	}

	@RequestMapping("editMoneyBook")
	public String editMoneyBook(@RequestParam("mb_no") int mb_no, Model model, HttpSession session) throws Exception {
		String forwardPath = "editMoneyBook";
		MoneyBook moneyBookResult = null;

		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");

		moneyBookResult = moneyBookService.findMoneyBookNo(mb_no);
		String temp=moneyBookResult.getMb_date();
		temp=temp.substring(0,10);
		String[] tempL=temp.split("-");
		String tempAdd="";
		for (int i = 0; i < tempL.length; i++) {
			tempAdd += tempL[i];
		}
		
		StringBuffer sb = new StringBuffer(tempAdd);
        sb.insert(4, "/");
        sb.insert(7, "/");
	    System.err.println("mb_date:" + sb);
	    String date = sb.toString();
	    moneyBookResult.setMb_date(date);
	
		
		ArrayList<Card> cardList = null;
		String m_email = member.getM_email();
		cardList = cardService.getCardListByEmail(m_email);
		
		System.err.println("edit:"+moneyBookResult);
		System.err.println("editMoneyBook cardList:" + cardList);
		System.err.println("mb_no:" + mb_no);

		model.addAttribute("mb_no", mb_no);
		model.addAttribute("mb_m_email", m_email);
		model.addAttribute("cardList", cardList);
		model.addAttribute("editMoneyBook", moneyBookResult);
		model.addAttribute("path", "editMoneyBook.jsp");
		return forwardPath;

	}

	@RequestMapping("/editMoneyBookAction")
	public String editMoneyBookAction(@RequestParam("mb_no") int mb_no, @RequestParam("mb_date") String mb_date,
			@RequestParam(value = "mb_outgo", required = false) int mb_outgo,
			@RequestParam(value = "mb_income", required = false) int mb_income,
			@RequestParam(value = "mb_memo", required = false) String mb_memo,
			@RequestParam(value = "mb_category", required = false) String mb_category,
			@RequestParam("mb_m_email") String mb_m_email, @RequestParam("mb_outType") String mb_outType, Model model,
			HttpSession session) throws Exception {
		String forwardPath = "editMoneyBook";
		HashMap<String, String> mMap = new HashMap<String, String>();
		String[] temp;
		String tempAdd = "";
		temp = mb_date.split("/");

		for (int i = 0; i < temp.length; i++) {
			tempAdd += temp[i];
		}

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		Date currentTime = new Date();
		currentTime.setYear(Integer.parseInt(temp[0]) - 1900);
		currentTime.setMonth(Integer.parseInt(temp[1]) - 1);
		currentTime.setDate(Integer.parseInt(temp[2]));

		String dTime = sdf.format(currentTime);

		mMap.put("mb_date", dTime);
		mMap.put("mb_category", mb_category);
		mMap.put("mb_income", mb_income + "");
		mMap.put("mb_outgo", mb_outgo + "");
		mMap.put("mb_outType", mb_outType);
		mMap.put("mb_memo", mb_memo);
		mMap.put("mb_no", mb_no + "");

		moneyBookService.editMoneyBook(mMap);
		
		System.err.println("머니북 에디트:"+mMap);

		model.addAttribute("close", true);
		model.addAttribute("path", "expense.jsp");
		return forwardPath;

	}

	@RequestMapping("budget")
	public String budget(Model model, HttpSession session) {
		String forwardPath = "index";
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}

		// 상단 Nav바 지출내역 리스트
		Member sMember = (Member) session.getAttribute("sMember");
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", sMember.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		model.addAttribute("path", "budget.jsp");
		return forwardPath;
	}

	@RequestMapping("dataStatistic")
	public String dataStatistic(Model model, HttpSession session) {
		String forwardPath = "index";
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}

		// 상단 Nav바 지출내역 리스트
		Member sMember = (Member) session.getAttribute("sMember");
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", sMember.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		model.addAttribute("path", "dataStatistic.jsp");
		return forwardPath;
	}

	@RequestMapping("dataChart")
	public String dataChart(Model model, HttpSession session) {
		String forwardPath = "index";
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		// 상단 Nav바 지출내역 리스트
		Member sMember = (Member) session.getAttribute("sMember");
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", sMember.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		model.addAttribute("path", "dataChart.jsp");
		return forwardPath;
	}

}
