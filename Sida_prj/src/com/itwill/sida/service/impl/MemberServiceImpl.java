package com.itwill.sida.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.MemberDao;
import com.itwill.sida.dto.Member;
import com.itwill.sida.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public String login(String email, String pwd) {
		Member findMember = memberDao.findMemberByEmail(email);
		if(findMember==null){
			return "emailErr";
		}
		if(!findMember.getM_pwd().equals(pwd)){
			return "pwdErr";
		}
		return "success";
	}
	@Override
	public Member getMember(String email, String pwd){
		return memberDao.getMember(email, pwd);
	}

	@Override
	public Member findMemberByEmail(String email) {
		return memberDao.findMemberByEmail(email);
	}

	@Override
	public void joinMember(Member member) throws Exception {
		memberDao.joinMember(member);
	}

	@Override
	public void pwdChange(Member sMember) {
		memberDao.pwdChange(sMember);
	}

	@Override
	public void insertImg(Member member) {
		memberDao.insertImg(member);
	}

	@Override
	public void phoneRegistration(Member sMember) {
		memberDao.phoneRegistration(sMember);
	}

	@Override
	public Member findMemberByPhoneNo(String phone) {
		return memberDao.findMemberByPhoneNo(phone);
	}
	
	
}
