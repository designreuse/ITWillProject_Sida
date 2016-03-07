package com.itwill.sida.dto;

import java.util.Comparator;

public class MoneyBook{

	private int mb_no;
	private String mb_m_email;
	private String mb_date;
	private String mb_category;
	private int mb_income;
	private int mb_outgo;
	private String mb_outType;
	private String mb_memo;
	
	Comparator<MoneyBook> sort = new Comparator<MoneyBook>() {
		@Override
		public int compare(MoneyBook o1, MoneyBook o2) {
			// TODO Auto-generated method stub
			return o1.getMb_date().compareTo(o2.getMb_date());
		}
	};
		  
	@Override
	public int hashCode() {
	 
	        return mb_date.hashCode();
	}
	 
	@Override
	public boolean equals(Object obj) {
	 
	        if(!(obj instanceof MoneyBook)) {
	               return false;
	        }
	        MoneyBook s = (MoneyBook)obj;
	        return mb_date.equals(s.mb_date);
	}
	
	public MoneyBook() {}

	public MoneyBook(int mb_no, String mb_m_email, String mb_date, String mb_category, int mb_income, int mb_outgo,
			String mb_outType, String mb_memo) {
		super();
		this.mb_no = mb_no;
		this.mb_m_email = mb_m_email;
		this.mb_date = mb_date;
		this.mb_category = mb_category;
		this.mb_income = mb_income;
		this.mb_outgo = mb_outgo;
		this.mb_outType = mb_outType;
		this.mb_memo = mb_memo;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getMb_m_email() {
		return mb_m_email;
	}

	public void setMb_m_email(String mb_m_email) {
		this.mb_m_email = mb_m_email;
	}

	public String getMb_date() {
		return mb_date;
	}

	public void setMb_date(String mb_date) {
		this.mb_date = mb_date;
	}

	public String getMb_category() {
		return mb_category;
	}

	public void setMb_category(String mb_category) {
		this.mb_category = mb_category;
	}

	public int getMb_income() {
		return mb_income;
	}

	public void setMb_income(int mb_income) {
		this.mb_income = mb_income;
	}

	public int getMb_outgo() {
		return mb_outgo;
	}

	public void setMb_outgo(int mb_outgo) {
		this.mb_outgo = mb_outgo;
	}

	public String getMb_outType() {
		return mb_outType;
	}

	public void setMb_outType(String mb_outType) {
		this.mb_outType = mb_outType;
	}

	public String getMb_memo() {
		return mb_memo;
	}

	public void setMb_memo(String mb_memo) {
		this.mb_memo = mb_memo;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		/*return "MoneyBook [mb_no=" + mb_no + ", mb_m_email=" + mb_m_email + ", mb_date=" + mb_date + ", mb_category=" + mb_category 
				+ ", mb_income=" + mb_income + ", mb_outgo=" + mb_outgo + ", mb_outType=" + mb_outType + ", mb_memo=" + mb_memo + "]";*/
		return "["+mb_no+","+mb_m_email+","+mb_date+","+mb_category+","+mb_income+","+mb_outgo+","+mb_outType+","+mb_memo+"]";
	}


}
