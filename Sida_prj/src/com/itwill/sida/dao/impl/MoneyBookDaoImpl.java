package com.itwill.sida.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.MoneyBookDao;
import com.itwill.sida.dto.MoneyBook;

import mybatis.mapper.MoneyBookMapper;

@Component
public class MoneyBookDaoImpl implements MoneyBookDao {
	@Autowired
	MoneyBookMapper moneyBookMapper;
	//SqlSession sqlSession;

	@Override
	public MoneyBook findMoneyBookNo(int mb_no) {
		MoneyBook findMoneyBook = null;
		findMoneyBook = moneyBookMapper.findMoneyBookNo(mb_no);
		return findMoneyBook;
	}

	@Override
	public List<MoneyBook> findMoneyBookAll() {
		List<MoneyBook> moneyBookList = null;
		moneyBookList = moneyBookMapper.findMoneyBookAll();
		return moneyBookList;
	}

	@Override
	public List<MoneyBook> findMoneyBookEmailResult(String mb_m_email) {
		List<MoneyBook> moneyBookList = null;
		moneyBookList = moneyBookMapper.findMoneyBookEmailResult(mb_m_email);
		return moneyBookList;
	}

	@Override
	public List<MoneyBook> findMoneyBookDate(String mb_m_email) {
		List<MoneyBook> moneyBook = null;
		moneyBook = moneyBookMapper.findMoneyBookDate(mb_m_email);
		return moneyBook;
	}

	@Override
	public List<MoneyBook> findMoneyBookDateExpense(String mb_date) {
		List<MoneyBook> moneyBook = null;
		moneyBook = moneyBookMapper.findMoneyBookDateExpense(mb_date);
		return moneyBook;
	}

	@Override
	public List<MoneyBook> findMoneyBookOutTypeResult(String mb_date) {
		List<MoneyBook> moneyBook = null;
		moneyBook = moneyBookMapper.findMoneyBookOutTypeResult(mb_date);

		return moneyBook;
	}

	@Override
	public List<MoneyBook> findMinMaxSum(HashMap<String, String> map) {
		List<MoneyBook> findMoneyBook = null;
		findMoneyBook = moneyBookMapper.findMinMaxSum(map);
		return findMoneyBook;
	}

	@Override
	public void insertMoneyBook(HashMap<String, String> mMap) {
		System.err.println("Insert Check" + mMap);
		moneyBookMapper.insertMoneyBook(mMap);
	}

	@Override
	public List<MoneyBook> dateList(HashMap<String, String> mMap) {
		return moneyBookMapper.dateList(mMap);
	}

	@Override
	public List<MoneyBook> findMonthDate(HashMap<String, String> mMap) {
		return moneyBookMapper.findMonthDate(mMap);
	}

	@Override
	public List<MoneyBook> resultMonthAll(HashMap<String, String> mMap) {
		return moneyBookMapper.resultMonthAll(mMap);
	}

	@Override
	public void deleteMoneyBook(int mb_no) {
		moneyBookMapper.deleteMoneyBook(mb_no);
	}

	@Override
	public void editMoneyBook(HashMap<String, String> mMap) {
		moneyBookMapper.editMoneyBook(mMap);
	}

	@Override
	public List<MoneyBook> test(HashMap<String, String> mMap) {
		return moneyBookMapper.test(mMap);
	}

	@Override
	public List<MoneyBook> findMoneyBookEmailResult_10(String m_email) {
		List<MoneyBook> moneyBookList = null;
		moneyBookList = moneyBookMapper.findMoneyBookEmailResult_10(m_email);
		return moneyBookList;
	}

	@Override
	public List<MoneyBook> findMoneyBookOutTypeEmail(HashMap<String, String> map) {
		return moneyBookMapper.findMoneyBookOutTypeEmail(map);
	}

	@Override
	public String selectUsedListByMonth(int year, String month, String m_email) {
		HashMap<String, String> tMap = new HashMap<String, String>();
		tMap.put("year", year+"");
		tMap.put("month", month);
		tMap.put("m_email", m_email);
		return moneyBookMapper.selectUsedListByMonth(tMap);
	}

	@Override
	public List<MoneyBook> percentChart(HashMap<String, String> mMap) {
		return moneyBookMapper.percentChart(mMap);
	}

	@Override
	public String selectMoneyBook_UsedTotal(String m_email, int year, String month, String day) {
		HashMap<String, String> dMap = new HashMap<String, String>();
		dMap.put("m_email", m_email);
		dMap.put("year", year+"");
		dMap.put("month", month);
		dMap.put("day", day);
		System.err.println("###"+dMap);
		return moneyBookMapper.selectMoneyBook_UsedTotal(dMap);
	}

	@Override
	public String selectMoneyBook_UsedTotal(String m_email, int year, String month) {
		HashMap<String, String> dMap = new HashMap<String, String>();
		dMap.put("m_email", m_email);
		dMap.put("year", year+"");
		dMap.put("month", month);
		return moneyBookMapper.selectMoneyBook_UsedTotal_Month(dMap);
	}

	@Override
	public String selectMoneyBook_UsedMax(String m_email) {
		return moneyBookMapper.selectMoneyBook_UsedMax(m_email);
	}

	@Override
	public String selectMoneyBook_UsedMax(String m_email, int year, String formatMonth) {
		HashMap<String, String> dMap = new HashMap<String, String>();
		dMap.put("m_email", m_email);
		dMap.put("year", year+"");
		dMap.put("month", formatMonth);
		return moneyBookMapper.selectMoneyBook_UsedMax_Month(dMap);
	}

	@Override
	public ArrayList<HashMap<String, String>> selectMoneyBook_CardUsage(int thisYear, String formatMonth, String m_email) {
		HashMap<String, String> dMap = new HashMap<String, String>();
		dMap.put("m_email", m_email);
		dMap.put("year", thisYear+"");
		dMap.put("month", formatMonth);
		return moneyBookMapper.selectMoneyBook_CardUsage(dMap);
	}
}
