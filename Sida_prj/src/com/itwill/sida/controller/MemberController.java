package com.itwill.sida.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.mail.Mail;
import com.itwill.sida.mail.MailServiceImpl;
import com.itwill.sida.service.MemberService;
import com.itwill.sida.service.MoneyBookService;
import com.itwill.sida.service.SchedulerService;
import com.itwill.sida.service.TextFormatUtil;
import com.itwill.sida.service.impl.MemberServiceImpl;

@Controller
public class MemberController {
	String LOCAL_FILE_SAVE_PATH;
	public final String LOCAL_FILE_LOAD_PATH = "localImg" + File.separator;
	
	@Autowired
	MemberService memberService;
	@Autowired
	TextFormatUtil textFormatUtil;
	@Autowired
	MemberServiceImpl memberServiceImpl;
	@Autowired
	SchedulerService schedulerService;
	@Autowired
	MoneyBookService moneyBookService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, HttpSession session) {
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member sMember = (Member)session.getAttribute("sMember");
		// 상단 Nav바 지출내역 리스트
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
		model.addAttribute("path", "profile.jsp");
		return "index";
	}

	@RequestMapping(value = "/imgRegist")
	public String process(@RequestParam("userImg") MultipartFile userImg, HttpSession session, Model model,
			HttpServletRequest request) {
		LOCAL_FILE_SAVE_PATH = request.getSession().getServletContext().getRealPath("") + "resource" + File.separator
				+ "localImg" + File.separator;
		String forwardPath = "index";
		
		if (session.getAttribute("sMember") == null)
			return "redirect:login";
		
		Member sMember = (Member) session.getAttribute("sMember");
		
		if(userImg.getOriginalFilename()==null || userImg.getOriginalFilename().equals("")){
			model.addAttribute("path", "accountSetting.jsp");
			ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(sMember.getM_email());
			model.addAttribute("head_nav_moneyList_size", moneyMap.size());
			model.addAttribute("head_nav_moneyList", moneyMap);
			return forwardPath;
		}
		
		
		String imgName = userImg.getOriginalFilename().split("[.]")[0];
		String imgType = userImg.getOriginalFilename().split("[.]")[1];
		Calendar car = Calendar.getInstance();
		int year = car.get(Calendar.YEAR);
		int month = car.get(Calendar.MONTH)+1;
		int day = car.get(Calendar.DAY_OF_MONTH);
		
		String formatMonth = String.format("%02d", month);
		String formatDay = String.format("%02d", day);
		String todayUsedTotal = moneyBookService.selectMoneyBook_UsedTotal(sMember.getM_email(), year, formatMonth, formatDay);
		String monthlyUsedTotal = moneyBookService.selectMoneyBook_UsedTotal(sMember.getM_email(), year, formatMonth);
		String usedMax_Total = moneyBookService.selectMoneyBook_UsedMax(sMember.getM_email());
		String usedMax_Monthly = moneyBookService.selectMoneyBook_UsedMax(sMember.getM_email(), year, formatMonth);
		HashMap<String, String> moneyUsedMap = new HashMap<String, String>();
		
		
		File file = new File(LOCAL_FILE_SAVE_PATH);
		boolean flag = file.exists();
		if (!flag) {
			file.mkdir();
		}
		switch (imgType.toLowerCase()) {
		case "jpg":
		case "png":
		case "jpeg":
		case "bmp":
			writeFile(userImg, LOCAL_FILE_SAVE_PATH, sMember.getM_email() + "_" + imgName + "." + imgType);
			String imgPath = LOCAL_FILE_LOAD_PATH + sMember.getM_email() + "_" + imgName + "." + imgType;
			sMember.setM_image(imgPath);
			memberService.insertImg(sMember);
			session.setAttribute("sMember", sMember);
			model.addAttribute("path", "dashBoard.jsp");
			break;
		default:
			model.addAttribute("msg", "You will be able to upload photos");
			model.addAttribute("path", "accountSetting.jsp");
			break;
		}
		

		//
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
		
		//
		moneyUsedMap.put("todayUsedTotal", todayUsedTotal==null?"0":todayUsedTotal);
		moneyUsedMap.put("monthlyUsedTotal", monthlyUsedTotal==null?"0":monthlyUsedTotal);
		moneyUsedMap.put("usedMax_Total", usedMax_Total==null?"0":usedMax_Total);
		moneyUsedMap.put("usedMax_Monthly", usedMax_Monthly==null?"0":usedMax_Monthly);
		//
		
		model.addAttribute("moneyUsedMap", moneyUsedMap);
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		
		return forwardPath;
	}

	private void writeFile(MultipartFile file, String path, String fileName) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream(path + fileName);
			fos.write(fileData);
		} catch (Exception e) {

		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}

	@RequestMapping(value = "pwdChange", produces = "application/json; charset=utf-8")
	public @ResponseBody String pwdCheck(@RequestParam("asIsPwd") String asIsPwd,
			@RequestParam("toBePwd") String toBePwd, HttpSession session) {
		Member sMember = (Member) session.getAttribute("sMember");
		try {
			if (sMember == null)
				throw new Exception();
		} catch (Exception e) {
		}
		if (sMember.getM_pwd().equals(asIsPwd)) {
			sMember.setM_pwd(toBePwd);
			memberService.pwdChange(sMember);
			session.setAttribute("sMember", sMember);
			return "{\"pwdEqul\":true}";
		} else {
			return "{\"pwdEqul\":false}";
		}
	}

	@RequestMapping(value = "phoneRegistration", produces = "application/json; charset=utf-8")
	public @ResponseBody String phoneRegistration(@RequestParam("phone") String phone, HttpSession session) {
		Member sMember = (Member) session.getAttribute("sMember");
		try {
			if (sMember == null) {
				return "{\"phoneMsg\":false}";
			}
		} catch (Exception e) {
		}
		sMember.setM_phone(phone);
		memberService.phoneRegistration(sMember);
		session.setAttribute("sMember", sMember);
		return "{\"phoneMsg\":true}";
	}

	@RequestMapping(value = "accountSetting", produces = "application/json; charset=utf-8")
	public String accountSettingForm(HttpSession session, Model model) {
		Member sMember = (Member) session.getAttribute("sMember");
		String forwardPath = "";
		try {
			if (sMember == null)
				return "redirect:login";
			Member rtnMember = memberService.findMemberByEmail(sMember.getM_email());
			
			//
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
			model.addAttribute("path", "accountSetting.jsp");
			model.addAttribute("member", rtnMember);
		} catch (Exception e) {
			return "redirect:login";
		}
		return "index";
	}

	@RequestMapping(value = "/emailCheck", produces = "application/json; charset=utf-8")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {
		String returnText = null;
		Member member = memberService.findMemberByEmail(email);
		if (member == null) {
			returnText = "{\"data\":\"E-mail is available\",\"flag\":true,\"color\":\"green\"}";
		} else {
			returnText = "{\"data\":\"E-mail is Unavailable\",\"flag\":false,\"color\":\"red\"}";
		}
		return returnText;
	}

	@RequestMapping("/joinMember")
	public String joinMember(@ModelAttribute("member") Member member) {
		String forwradPath = "";
		try {
			forwradPath = "login";
			memberService.joinMember(member);
		} catch (Exception e) {
		}
		return forwradPath;
	}

	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		session.invalidate();
		return mv;
	}

	@RequestMapping(value = "/loginCheck", produces = "application/json")
	public @ResponseBody String loginCheck(@RequestParam("email") String email,
			@RequestParam(value = "pwd", required = true) String pwd, HttpSession session) throws Exception {
		String returnText = null;
		String flag = memberService.login(email, pwd);
		switch (flag) {
		case "emailErr":
			returnText = "{\"data\":\"Check Email\",\"stat\":false}";
			break;
		case "pwdErr":
			returnText = "{\"data\":\"Check Password\",\"stat\":false}";
			break;
		case "success":
			returnText = "{\"data\":\"Success Login\",\"stat\":true}";
			session.setAttribute("sMember", memberService.getMember(email, pwd));
			break;
		}
		return returnText;
	}
	
	
	@Autowired
    private MailServiceImpl mailService;
     
    @RequestMapping("/findPwdByEmail")
    public ModelAndView sendEmailAction (HttpServletRequest request) throws Exception {
    	
    	ModelAndView mv = new ModelAndView();

		Mail mail = new Mail();
		
		//setting Resume mail sending
		StringBuffer sb = new StringBuffer();

		// 메일 제목
		mail.setSubject("Ark Admin 비밀번호입니다.");
		
		
		//받는 사람 리스트
		List<String> toList = new ArrayList<String>();
//		for(Manager toUser : managerList){
//			toList.add(toUser.getEmail());
//		}
		String email = request.getParameter("m_email");
		toList.add(email);
		mail.setToUser(toList);
		
		// 받는 내용 
		StringBuffer sbText = new StringBuffer();
		sbText.append("비밀번호 : "+memberServiceImpl.findMemberByEmail(email).getM_pwd());
		mail.setText(sbText.toString());
		
		// 파일 첨부
//		List<File> attcheFiles = new ArrayList<File>();
//		List<String> attcheFileName = new ArrayList<String>();
//		if(filesList!=null){
//			for(int i=0; i<filesList.size(); i++){
//				Files files = filesList.get(i);
//				File file = new File(saveFileLocation + File.separator + files.getRenameFileName());
//				attcheFiles.add(file);
//				attcheFileName.add(files.getRenameFileName());
//			}
//		}
//		mail.setFile(attcheFiles);
//		mail.setAttcheFileName(attcheFileName);
//		
		boolean result = mailService.sendMail(mail);
		System.out.println("result : "+result);
		
		mv.setViewName("login");
		return mv;
    }
   
	
}
