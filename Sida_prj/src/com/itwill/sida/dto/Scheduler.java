package com.itwill.sida.dto;

public class Scheduler {
	
	/*S_NO
	S_M_EMAIL
	
	S_LOOPTYPE
	S_ALLDAY
	S_START
	S_END
	S_TITLE
	S_MEMO*/
	
	private int s_no;
	private String s_m_email;
	
	private String s_looptype;
	private String s_allday;
	private String s_start;
	private String s_end;
	private String s_title;
	private String s_memo;
	
	public Scheduler() {}
	
	public Scheduler(int s_no, String s_m_email, String s_looptype, String s_allday,
			String s_start, String s_end, String s_title, String s_memo) {
		super();
		this.s_no = s_no;
		this.s_m_email = s_m_email;
		
		this.s_looptype = s_looptype;
		this.s_allday = s_allday;
		this.s_start = s_start;
		this.s_end = s_end;
		this.s_title = s_title;
		this.s_memo = s_memo;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_m_email() {
		return s_m_email;
	}

	public void setS_m_email(String s_m_email) {
		this.s_m_email = s_m_email;
	}

	public String getS_looptype() {
		return s_looptype;
	}

	public void setS_looptype(String s_looptype) {
		this.s_looptype = s_looptype;
	}

	public String getS_allday() {
		return s_allday;
	}

	public void setS_allday(String s_allday) {
		this.s_allday = s_allday;
	}

	public String getS_start() {
		return s_start;
	}

	public void setS_start(String s_start) {
		this.s_start = s_start;
	}

	public String getS_end() {
		return s_end;
	}

	public void setS_end(String s_end) {
		this.s_end = s_end;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_memo() {
		return s_memo;
	}

	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Scheduler [s_no=" + s_no + ", s_m_email=" + s_m_email + ", s_loopType=" + s_looptype
				+ ", s_allday=" + s_allday + ", s_startDate=" + s_start + ", s_endDate=" + s_end + ", s_title=" + s_title + ", s_memo=" + s_memo + "]";
	}

}
