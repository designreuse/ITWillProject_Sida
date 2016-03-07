package mybatis.mapper;

import java.util.HashMap;

import com.itwill.sida.dto.Member;

public interface MemberMapper {
	public Member selectMember(HashMap<String, String> map);
	public Member findMemberByEmail(String m_email);
	public void joinMember(Member member);
	public void updatePwd(Member sMember);
	public void updateImg(Member member);
	public void updatePhoneNo(Member sMember);
	public Member findMemberByPhoneNo(String phone);
}
