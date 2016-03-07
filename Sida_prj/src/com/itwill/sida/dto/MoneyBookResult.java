package com.itwill.sida.dto;

import java.util.List;

public class MoneyBookResult {
	List<MoneyBook> totList;
	List<MoneyBook> test;
	public List<MoneyBook> getTotList() {
		return totList;
	}
	public void setTotList(List<MoneyBook> totList) {
		this.totList = totList;
	}
	public List<MoneyBook> getTest() {
		return test;
	}
	public void setTest(List<MoneyBook> test) {
		this.test = test;
	}
}
