package com.itwill.sida.dao;

import com.itwill.sida.dto.Member;

public interface MemberDao {
	public Member findMemberByEmail(String email);
	public Member getMember(String email, String pwd);
	public void joinMember(Member member);
	public void pwdChange(Member sMember);
	public void insertImg(Member member);
	public void phoneRegistration(Member sMember);
	public Member findMemberByPhoneNo(String phone);
}