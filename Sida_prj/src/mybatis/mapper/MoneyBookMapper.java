package mybatis.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.itwill.sida.dto.MoneyBook;

public interface MoneyBookMapper {
	public MoneyBook findMoneyBookNo(int mb_no);
	public List<MoneyBook> findMoneyBookAll();
	public List<MoneyBook> findMoneyBookEmailResult(String mb_m_email);
	public List<MoneyBook> findMoneyBookDate(String mb_m_email);
	public List<MoneyBook> findMoneyBookDateExpense(String mb_date);
	public List<MoneyBook> findMoneyBookOutTypeResult(String mb_date); //날짜별 지출형태
	public List<MoneyBook> findMinMaxSum(HashMap<String, String> map); //한달기준 처음 소비한 날짜~마지막날짜 or 한달 총사용 금액
	public void insertMoneyBook(HashMap<String, String> mMap); //추가
	public List<MoneyBook> dateList(HashMap<String, String> mMap); //년월 그룹리스트   ex)201601 / 201602 / 201603..
	public List<MoneyBook> findMonthDate(HashMap<String, String> mMap); //달별 날짜별 세부지출목록
	public List<MoneyBook> resultMonthAll(HashMap<String, String> mMap); //달별 소비 전체 출력
	public void deleteMoneyBook(int mb_no); //삭제
	public void editMoneyBook(HashMap<String, String> mMap);
	public List<MoneyBook> test(HashMap<String, String> mMap);
	public List<MoneyBook> findMoneyBookEmailResult_10(String m_email);
	public List<MoneyBook> findMoneyBookOutTypeEmail(HashMap<String, String> map);
	public String selectUsedListByMonth(HashMap<String, String> tMap);
	public List<MoneyBook> percentChart(HashMap<String, String> mMap);
	public String selectMoneyBook_UsedTotal(HashMap<String, String> dMap);
	public String selectMoneyBook_UsedTotal_Month(HashMap<String, String> dMap);
	public String selectMoneyBook_UsedMax(String m_email);
	public String selectMoneyBook_UsedMax_Month(HashMap<String, String> dMap);
	public ArrayList<HashMap<String, String>> selectMoneyBook_CardUsage(HashMap<String, String> dMap);
}
