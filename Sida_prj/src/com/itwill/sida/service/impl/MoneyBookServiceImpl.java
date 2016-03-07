package com.itwill.sida.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.MoneyBookDao;
import com.itwill.sida.dto.MoneyBook;
import com.itwill.sida.service.MoneyBookService;

@Component
public class MoneyBookServiceImpl implements MoneyBookService {
	@Autowired
	public MoneyBookDao moneyBookDao;
	
	
	/*public MoneyBookDao getMoneyBookDao() {
		return moneyBookDao;
	}*/
	public void setMoneyBookDao(MoneyBookDao moneyBookDao) {
		this.moneyBookDao = moneyBookDao;
	}
/*
	private MoneyBookServiceImpl(){
		moneyBookDao = new MoneyBookDaoImpl();
	}
	
	private MoneyBookDao getMoneyBooksDao(){
		return MoneyBookDaoImpl.getInstance();
	}*/
	
	@Override
	public MoneyBook findMoneyBookNo(int mb_no) throws Exception {
		//return getMoneyBooksDao().findMoneyBookNo(mb_no);
		return moneyBookDao.findMoneyBookNo(mb_no);
	}
	@Override
	public List<MoneyBook> findMoneyBookAll() throws Exception {
		return moneyBookDao.findMoneyBookAll();
	}
	
	/*@Override
	public List<Map<String, String>> findMoneyBookOutTypeResult(String mb_m_email, String mb_outType) throws Exception {
		return getMoneyBooksDao().findMoneyBookOutTypeResult(mb_m_email, mb_outType);
	}*/
	@Override
	public List<MoneyBook> findMoneyBookEmailResult(String mb_m_email) throws Exception {
		return moneyBookDao.findMoneyBookEmailResult(mb_m_email);
	}
	@Override
	public List<MoneyBook> findMoneyBookDate(String mb_m_email) throws Exception {
		return moneyBookDao.findMoneyBookDate(mb_m_email);
	}
	@Override
	public List<MoneyBook> findMoneyBookDateExpense(String mb_date) throws Exception {
		return moneyBookDao.findMoneyBookDateExpense(mb_date);
	}
	/*@Override
	public List<Map<String, String>> findMoneyBookDateExpense(String mb_date, String mb_m_email) throws Exception {
		return getMoneyBooksDao().findMoneyBookDateExpense(mb_date, mb_m_email);
	}*/
	@Override
	public List<MoneyBook> findMoneyBookOutTypeResult(String mb_date) throws Exception {
		return moneyBookDao.findMoneyBookOutTypeResult(mb_date);
	}
/*	@Override
	public List<MoneyBook> findMinMaxSum(String search_value, String mb_m_email) throws Exception {
		return getMoneyBooksDao().findMinMaxSum(search_value, mb_m_email);
	}*/
	@Override
	public List<MoneyBook> findMinMaxSum(HashMap<String, String> map) throws Exception {
		return moneyBookDao.findMinMaxSum(map);
	}
	@Override
	public void insertMoneyBook(HashMap<String, String> mMap) throws Exception {
		moneyBookDao.insertMoneyBook(mMap);
	}

	@Override
	public List<MoneyBook> dateList(HashMap<String, String> mMap) throws Exception {
		return moneyBookDao.dateList(mMap);
	}

	@Override
	public List<MoneyBook> findMonthDate(HashMap<String, String> mMap) throws Exception {
		return moneyBookDao.findMonthDate(mMap);
	}

	@Override
	public List<MoneyBook> resultMonthAll(HashMap<String, String> mMap) throws Exception {
		return moneyBookDao.resultMonthAll(mMap);
	}

	@Override
	public void deleteMoneyBook(int mb_no) throws Exception {
		moneyBookDao.deleteMoneyBook(mb_no);
	}

	@Override
	public void editMoneyBook(HashMap<String, String> mMap) throws Exception {
		moneyBookDao.editMoneyBook(mMap);
	}

	@Override
	public List<MoneyBook> test(HashMap<String, String> mMap) throws Exception {
		return moneyBookDao.test(mMap);
	}

	@Override
	public List<MoneyBook> findMoneyBookEmailResult_10(String m_email) {
		return moneyBookDao.findMoneyBookEmailResult_10(m_email);
	}

	@Override
	public List<MoneyBook> findMoneyBookOutTypeEmail(HashMap<String, String> map) throws Exception {
		return moneyBookDao.findMoneyBookOutTypeEmail(map);
	}

	@Override
	public String selectUsedListByMonth(int year, String month, String m_email) {
		return moneyBookDao.selectUsedListByMonth(year, month, m_email);
	}
	@Override
	public List<MoneyBook> percentChart(HashMap<String, String> mMap) throws Exception {
		return moneyBookDao.percentChart(mMap);
	}

	@Override
	public String selectMoneyBook_UsedTotal(String m_email, int year, String month, String day) {
		return moneyBookDao.selectMoneyBook_UsedTotal(m_email, year, month, day);
	}

	@Override
	public String selectMoneyBook_UsedTotal(String m_email, int year, String month) {
		return moneyBookDao.selectMoneyBook_UsedTotal(m_email, year, month);
	}

	@Override
	public String selectMoneyBook_UsedMax(String m_email) {
		return moneyBookDao.selectMoneyBook_UsedMax(m_email);
	}

	@Override
	public String selectMoneyBook_UsedMax(String m_email, int year, String formatMonth) {
		return moneyBookDao.selectMoneyBook_UsedMax(m_email, year, formatMonth);
	}

	@Override
	public ArrayList<HashMap<String, String>> selectMoneyBook_CardUsage(int thisYear, String formatMonth, String m_email) {
		return moneyBookDao.selectMoneyBook_CardUsage(thisYear, formatMonth, m_email);
	}
}
