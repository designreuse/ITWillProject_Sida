package mybatis.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.sida.dto.Card;

public interface CardMapper {

	void insertCard(HashMap<String, String> cMap);

	String selectKeyword(String keyword);

	Card selectCard(String c_no);

	void updateCard(HashMap<String, String> cMap);

	void deleteCard(String c_no);

	ArrayList<Card> selectCardListByEmail(String m_email);

	ArrayList<Card> selectCardListByPhoneNum(String phone);

	ArrayList<Card> selectCardListByPhoneNum_smsReceive(String phone);
}
