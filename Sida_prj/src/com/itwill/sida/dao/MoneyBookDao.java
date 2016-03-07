package com.itwill.sida.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.itwill.sida.dto.MoneyBook;

public interface MoneyBookDao {
	MoneyBook findMoneyBookNo(int mb_no);
	List<MoneyBook> findMoneyBookAll();
	List<MoneyBook> findMoneyBookEmailResult(String mb_m_email);
	List<MoneyBook> findMoneyBookDate(String mb_m_email);
	List<MoneyBook> findMoneyBookDateExpense(String mb_date);
	List<MoneyBook> findMoneyBookOutTypeResult(String mb_date);
	//List<MoneyBook> findMinMaxSum(String search_value, String mb_m_email);
	List<MoneyBook> findMinMaxSum(HashMap<String, String> map);
	void insertMoneyBook(HashMap<String, String> mMap);
	List<MoneyBook> dateList(HashMap<String, String> mMap);
	List<MoneyBook> findMonthDate(HashMap<String, String> mMap);
	List<MoneyBook> resultMonthAll(HashMap<String, String> mMap);
	void deleteMoneyBook(int mb_no);
	void editMoneyBook(HashMap<String, String> mMap);
	List<MoneyBook> test(HashMap<String, String> mMap);
	List<MoneyBook> findMoneyBookEmailResult_10(String m_email);
	List<MoneyBook> findMoneyBookOutTypeEmail(HashMap<String, String> map);
	String selectUsedListByMonth(int year, String month, String m_email);
	List<MoneyBook> percentChart(HashMap<String, String> mMap);
	String selectMoneyBook_UsedTotal(String m_email, int year, String month, String day);
	String selectMoneyBook_UsedTotal(String m_email, int year, String month);
	String selectMoneyBook_UsedMax(String m_email);
	String selectMoneyBook_UsedMax(String m_email, int year, String formatMonth);
	ArrayList<HashMap<String, String>> selectMoneyBook_CardUsage(int thisYear, String formatMonth, String m_email);
}
