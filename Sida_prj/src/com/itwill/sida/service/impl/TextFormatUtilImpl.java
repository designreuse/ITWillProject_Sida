package com.itwill.sida.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dto.Card;
import com.itwill.sida.dto.MoneyBook;
import com.itwill.sida.service.CardService;
import com.itwill.sida.service.MoneyBookService;
import com.itwill.sida.service.TextFormatUtil;

@Component
public class TextFormatUtilImpl implements TextFormatUtil {
	@Autowired
	MoneyBookService moneyBookService;
	@Autowired
	CardService cardService;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.itwill.util.TextFormatUtil1#head_Nav_CardUseList(java.lang.String)
	 */
	@Override
	public ArrayList<HashMap<String, String>> head_Nav_CardUseList(String sMemberEmail) {
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
				moneyMap.add(mMap);
			}
		} catch (Exception e) {
		}
		return moneyMap;
	}

	@Override
	public String getTimeGap(String cardUseTime) {
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
		String timeStr = "";

		if (dayGap > 1) {
			//timeStr += dayGap * -1 + "일 ";
			timeStr += dayGap + "일 ";
		}

		if (hourGap < 1) {
			timeStr += hourGap * -1 + "시간 ";
		} else if (hourGap > 1) {
			timeStr += hourGap + "시간 ";
		}

		if (minGap < 1) {
			timeStr += minGap * -1 + "분전 ";
		} else if (minGap > 1) {
			timeStr += minGap + "분전 ";
		}

		return timeStr;
	}
}
