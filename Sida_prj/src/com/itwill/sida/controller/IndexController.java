package com.itwill.sida.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.MoneyBookService;
import com.itwill.sida.service.SchedulerService;
import com.itwill.sida.service.TextFormatUtil;

@Controller
public class IndexController {

	@Autowired
	MoneyBookService moneyBookService;
	@Autowired
	SchedulerService schedulerService;
	@Autowired
	CardService cardService;
	@Autowired
	TextFormatUtil textFormatUtil;

	@RequestMapping("/index")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member sMember = (Member) session.getAttribute("sMember");
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
		HashMap<String, String> moneyUsedMap = new HashMap<String, String>();
		Calendar car = Calendar.getInstance();
		//Date date = new Date();
		/*int year = date.getYear() + 1900;
		int month = date.getMonth() + 1;
		int day = date.getDay();*/
		int year = car.get(Calendar.YEAR);
		int month = car.get(Calendar.MONTH)+1;
		int day = car.get(Calendar.DAY_OF_MONTH);
		
		String formatMonth = String.format("%02d", month);
		String formatDay = String.format("%02d", day);
		String todayUsedTotal = moneyBookService.selectMoneyBook_UsedTotal(sMember.getM_email(), year, formatMonth, formatDay);
		String monthlyUsedTotal = moneyBookService.selectMoneyBook_UsedTotal(sMember.getM_email(), year, formatMonth);
		String usedMax_Total = moneyBookService.selectMoneyBook_UsedMax(sMember.getM_email());
		String usedMax_Monthly = moneyBookService.selectMoneyBook_UsedMax(sMember.getM_email(), year, formatMonth);
		
		moneyUsedMap.put("todayUsedTotal", todayUsedTotal==null?"0":todayUsedTotal);
		moneyUsedMap.put("monthlyUsedTotal", monthlyUsedTotal==null?"0":monthlyUsedTotal);
		moneyUsedMap.put("usedMax_Total", usedMax_Total==null?"0":usedMax_Total);
		moneyUsedMap.put("usedMax_Monthly", usedMax_Monthly==null?"0":usedMax_Monthly);
		
		/******************** schedule 알람 *****************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", sMember.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		
		model.addAttribute("moneyUsedMap", moneyUsedMap);
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		model.addAttribute("path", "dashBoard.jsp");
		return "index";
	}


	@RequestMapping("/calendar")
	public String calendar(Model model, HttpSession session) {
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member sMember = (Member) session.getAttribute("sMember");
		// 상단 Nav바 지출내역 리스트
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/******************** schedule 알람 *****************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", sMember.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		model.addAttribute("path", "calendar.jsp");
		return "index";
	}

	@RequestMapping("/charts")
	public String charts(Model model, HttpSession session) {
		model.addAttribute("path", "charts.jsp");
		return "index";
	}

	@RequestMapping("/datatables")
	public String datatables(Model model) {
		
		model.addAttribute("path", "datatables.jsp");
		return "index";
	}

	@RequestMapping("/error_404")
	public String error_404(Model model) {
		model.addAttribute("path", "error_404.jsp");
		return "index";
	}

	@RequestMapping("/error_500")
	public String error_500(Model model) {
		model.addAttribute("path", "error_500.jsp");
		return "index";
	}

	@RequestMapping("/forgot")
	public String forgot(Model model) {
		return "forgot";
	}

	@RequestMapping("/forms")
	public String forms(Model model) {
		model.addAttribute("path", "forms.jsp");
		return "index";
	}

	@RequestMapping("/gallery")
	public String gallery(Model model) {
		model.addAttribute("path", "gallery.jsp");
		return "index";
	}

	@RequestMapping("/google_maps")
	public String google_maps(Model model) {
		model.addAttribute("path", "google_maps.jsp");
		return "index";
	}

	@RequestMapping("/grid")
	public String grid(Model model) {
		model.addAttribute("path", "grid.jsp");
		return "index";
	}

	@RequestMapping("/profile")
	public String profile(Model model) {
		return "profile";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		return "register";
	}

	@RequestMapping("/search_results")
	public String search_results(Model model) {
		model.addAttribute("path", "search_results.jsp");
		return "index";
	}

	@RequestMapping("/tables")
	public String tables(Model model) {
		model.addAttribute("path", "tables.jsp");
		return "index";
	}

	@RequestMapping("/topnav")
	public String topnav(Model model) {
		model.addAttribute("path", "topnav.jsp");
		return "index";
	}

	@RequestMapping("/typography")
	public String typography(Model model) {
		model.addAttribute("path", "typography.jsp");
		return "index";
	}

	@RequestMapping("/ui_buttons")
	public String ui_buttons(Model model) {
		model.addAttribute("path", "ui_buttons.jsp");
		return "index";
	}

	@RequestMapping("/ui_components")
	public String ui_components(Model model) {
		model.addAttribute("path", "ui_components.jsp");
		return "index";
	}

	@RequestMapping("/ui_images")
	public String ui_images(Model model) {
		model.addAttribute("path", "ui_images.jsp");
		return "index";
	}

	@RequestMapping("/ui_nested_lists")
	public String ui_nested_lists(Model model) {
		model.addAttribute("path", "ui_nested_lists.jsp");
		return "index";
	}

	@RequestMapping("/wysiwyg_editor")
	public String wysiwyg_editor(Model model) {
		model.addAttribute("path", "wysiwyg_editor.jsp");
		return "index";
	}
	
/*	private ArrayList<HashMap<String, String>> head_Nav_CardUseList(String sMemberEmail) {
		ArrayList<HashMap<String, String>> moneyMap = new ArrayList<>();
		try {
			List<MoneyBook> mbList = moneyBookService.findMoneyBookEmailResult_10(sMemberEmail);
			for (MoneyBook arr : mbList) {
				HashMap<String, String> mMap = new HashMap<String, String>();
				mMap.put("mb_m_email", arr.getMb_m_email());
				mMap.put("mb_date", arr.getMb_date());
				mMap.put("mb_category", arr.getMb_category());
				mMap.put("mb_income", arr.getMb_income() + "");
				mMap.put("mb_outgo", arr.getMb_outgo() + "");
				Pattern p = Pattern.compile("\\d+");
				Matcher m = p.matcher(arr.getMb_outType());
				if (m.matches()) {
					Card card = cardService.getCard(arr.getMb_outType());
					mMap.put("c_no", card.getC_no() + "");
					mMap.put("c_name", card.getC_name());
				} else {
					mMap.put("c_name", "현금");
				}
				mMap.put("mb_memo", arr.getMb_memo());
				mMap.put("mb_date_result", getTimeGap(mMap.get("mb_date")));
				getTimeGap(mMap.get("mb_date"));
				moneyMap.add(mMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return moneyMap;
	}

	private String getTimeGap(String cardUseTime) {
		Date useTime = new Date(); // 사용 시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		String[] time = cardUseTime.split("[ ]");

		useTime.setYear(Integer.parseInt(time[0].split("[-]")[0]) - 1900);
		useTime.setMonth(Integer.parseInt(time[0].split("[-]")[1]) - 1);
		useTime.setDate(Integer.parseInt(time[0].split("[-]")[2]));
		useTime.setHours(Integer.parseInt(time[1].split("[:]")[0]));
		useTime.setMinutes(Integer.parseInt(time[1].split("[:]")[1]));
		Date endDate = new Date();
		// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		long diff = endDate.getTime() - useTime.getTime();

		int dayGap = (int) diff / (24 * 60 * 60 * 1000);
		int hourGap = (int) diff / (60 * 60 * 1000) % 24;
		int minGap = (int) (diff / (60 * 1000) % 60);
		String timeStr="";
		
		if(dayGap!=0){
			timeStr += dayGap+"일 ";
		}
		if(hourGap!=0){
			timeStr += hourGap+"시간 ";
		}
		if(minGap!=0){
			timeStr += minGap+"분전 ";
		}
		return timeStr;
	}*/
}
