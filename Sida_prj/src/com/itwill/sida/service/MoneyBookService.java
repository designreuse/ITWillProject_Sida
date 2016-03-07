package com.itwill.sida.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.itwill.sida.dto.MoneyBook;

public interface MoneyBookService {
	MoneyBook findMoneyBookNo(int mb_no) throws Exception;
	List<MoneyBook> findMoneyBookAll() throws Exception;
	List<MoneyBook> findMoneyBookEmailResult(String mb_m_email) throws Exception;
	List<MoneyBook> findMoneyBookDate(String mb_m_email) throws Exception;
	List<MoneyBook> findMoneyBookDateExpense(String mb_date) throws Exception;
	List<MoneyBook> findMoneyBookOutTypeResult(String mb_date) throws Exception;
	//List<MoneyBook> findMinMaxSum(String search_value, String mb_m_email) throws Exception;
	List<MoneyBook> findMinMaxSum(HashMap<String, String> map) throws Exception;
	void insertMoneyBook(HashMap<String, String> mMap) throws Exception;
	List<MoneyBook> dateList(HashMap<String, String> mMap) throws Exception;
	List<MoneyBook> findMonthDate(HashMap<String, String> mMap) throws Exception;
	List<MoneyBook> resultMonthAll(HashMap<String, String> mMap) throws Exception;
	void deleteMoneyBook(int mb_no) throws Exception;
	void editMoneyBook(HashMap<String, String> mMap) throws Exception;
	List<MoneyBook> test(HashMap<String, String> mMap) throws Exception;
	List<MoneyBook> findMoneyBookEmailResult_10(String m_email);
	List<MoneyBook> findMoneyBookOutTypeEmail(HashMap<String, String> map) throws Exception;
	String selectUsedListByMonth(int thisYear, String format, String m_email);
	List<MoneyBook> percentChart(HashMap<String, String> mMap) throws Exception;
	String selectMoneyBook_UsedTotal(String m_email, int year, String formatMonth, String formatDay);
	String selectMoneyBook_UsedTotal(String m_email, int year, String formatMonth);
	String selectMoneyBook_UsedMax(String m_email);
	String selectMoneyBook_UsedMax(String m_email, int year, String formatMonth);
	ArrayList<HashMap<String, String>> selectMoneyBook_CardUsage(int thisYear, String formatMonth, String m_email);
}
