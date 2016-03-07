package com.itwill.sida.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.MemberDao;
import com.itwill.sida.dto.Member;
import com.itwill.util.MyBatisSqlSessionFactory;

import mybatis.mapper.MemberMapper;

@Component
public class MemberDaoImpl implements MemberDao {
	@Autowired
	MemberMapper memberMapper;

	@Override
	public Member findMemberByEmail(String m_email) {
		Member findMember = null;
		findMember = memberMapper.findMemberByEmail(m_email);
		return findMember;
	}

	@Override
	public Member getMember(String email, String pwd) {
		Member findMember = null;
		HashMap<String, String> pMap = new HashMap<String, String>();
		pMap.put("m_email", email);
		pMap.put("m_pwd", pwd);
		findMember = memberMapper.selectMember(pMap);
		return findMember;
	}

	@Override
	public void joinMember(Member member) {
		memberMapper.joinMember(member);
	}

	@Override
	public void pwdChange(Member sMember) {
		memberMapper.updatePwd(sMember);
	}

	@Override
	public void insertImg(Member member) {
		memberMapper.updateImg(member);
	}

	@Override
	public void phoneRegistration(Member sMember) {
		memberMapper.updatePhoneNo(sMember);
	}

	@Override
	public Member findMemberByPhoneNo(String phone) {
		return memberMapper.findMemberByPhoneNo(phone);
	}
}
