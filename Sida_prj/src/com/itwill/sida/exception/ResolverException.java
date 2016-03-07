package com.itwill.sida.exception;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ResolverException {

	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, Model model, HttpSession session) {
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		model.addAttribute("path", "dashBoard.jsp");
		return "index";
	
	}
	
	
}
