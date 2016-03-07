package com.itwill.sida.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.SchedulerService;

@Controller
public class SchedulerController {

	@Autowired
	SchedulerService schedulerService;
	
	/*
	 * 	selectById : email 로 스케쥴 찾기 (event를 json 형태로 제공)
	 */
	@RequestMapping(value = "/selectById", method = RequestMethod.GET)
	@ResponseBody
	public String selectById(Model model, HttpSession session){
		/*if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}*/
		Member member = (Member) session.getAttribute("sMember");
		StringBuffer sb = new StringBuffer();
		List<Scheduler> scList = schedulerService.selectById(member.getM_email());
		sb.append("[");
		for (int i = 0; i < scList.size(); i++) {
			Scheduler tempSc = scList.get(i);
			boolean allday = true;
			if (tempSc.getS_allday().equals("f")) {		
				allday = false;
			}
			sb.append("{\"id\":\"" + tempSc.getS_no() + 
					"\",\"title\":\"" + tempSc.getS_title() + 
					"\",\"memo\":\"" + tempSc.getS_memo() +
					"\",\"start\":\"" + tempSc.getS_start() +
					"\",\"end\":\"" + tempSc.getS_end());
			if (allday == false) {
				sb.append("\",\"allDay\":\"" + allday);
			}
			if (tempSc.getS_looptype()!=null){
				sb.append("\",\"loopType\":\"" + tempSc.getS_looptype());
			}
			sb.append("\"}");
			if (i != (scList.size() - 1)) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString(); // json형식으로 출력 (fullcalendar에서 필요한 형식)
	}
	
	/*
	 * 	deleteSchedule : 선택한 이벤트 삭제
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteSchedule(@RequestParam int s_no){
		schedulerService.deleteSchedule(s_no);
	}
	
	/*
	 * 	saveSchedule : 이벤트 수정 및 추가
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public void saveSchedule(@RequestParam String s_no, 
							   @RequestParam String s_start,
							   @RequestParam String s_end,
							   @RequestParam String s_title,
							   @RequestParam String s_memo,
							   @RequestParam String s_allday,
							   @RequestParam String s_looptype,
							   HttpSession session){
		Member member = (Member) session.getAttribute("sMember");
		Scheduler schedule = null;
		if(s_no == ""){	// insert : 새로 입력한 이벤트
			schedule = new Scheduler( 0, member.getM_email(), s_looptype, s_allday, s_start, s_end, s_title, s_memo);	// member id로 변경
			schedulerService.insertSchedule(schedule);
		} else{				// update : 원래 있던 이벤트
			schedule =  schedulerService.selectByNo(Integer.parseInt(s_no));
			Scheduler upSchedule = new Scheduler(schedule.getS_no(), member.getM_email(), s_looptype, s_allday, s_start, s_end, s_title, s_memo);	// member id로 변경
			schedulerService.updateSchedule(upSchedule);
		}
	}
	
	/*
	 *	countForAlarm : 일정 알람 용 카운트 ( 남은 일정 갯수 )
	 */
	@RequestMapping(value = "/count", method = RequestMethod.POST)
	@ResponseBody
	public int countForAlarm(@RequestParam String s_end, HttpSession session){
		Member member = (Member) session.getAttribute("sMember");
		HashMap<String, String> sMap = new HashMap<String, String>();
		int count = 0;
		sMap.put("s_end", s_end);
		sMap.put("s_m_email", member.getM_email());
		count = schedulerService.countForAlarm(sMap);
		return count;
	}

}
