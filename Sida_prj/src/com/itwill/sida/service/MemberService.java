package com.itwill.sida.service;

import com.itwill.sida.dto.Member;

public interface MemberService {
	public String login(String email, String pwd) throws Exception;
	public Member getMember(String email, String pwd);
	public Member findMemberByEmail(String email);
	public void joinMember(Member member) throws Exception;
	public void pwdChange(Member sMember);
	public void insertImg(Member sMember);
	public void phoneRegistration(Member sMember);
	public Member findMemberByPhoneNo(String phone);
}