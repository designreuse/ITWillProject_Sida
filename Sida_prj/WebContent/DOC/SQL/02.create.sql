-- CREATE TABLE --

/* 회원 */
CREATE TABLE MEMBER (
	m_email VARCHAR2(60) NOT NULL PRIMARY KEY, /* 회원아이디 */
	m_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	m_name VARCHAR2(50) NOT NULL, /* 이름 */
	m_image VARCHAR2(2000) /* 사진 */
);



/* 스케쥴러 */
CREATE TABLE SCHEDULER (
	s_no NUMBER NOT NULL PRIMARY KEY, /* 스케쥴러번호 */
	s_m_email VARCHAR2(60) NOT NULL REFERENCES MEMBER(m_email), /* 회원아이디 */
	s_type VARCHAR2(10), /* 타입 */
	s_status VARCHAR2(10), /* 완료상태 */
	s_looptype VARCHAR2(10), /* 반복설정 */
	s_allday VARCHAR2(10), /* allDay 여부 */
	s_start VARCHAR2(30), /* 시작일 */
	s_end VARCHAR2(30), /* 종료일 */
	s_title VARCHAR2(60), /* 타이틀 */
	s_memo VARCHAR2(4000) /* 메모 */
);

/* 주소록 */
CREATE TABLE ADDRESSBOOK (
	ad_no NUMBER NOT NULL PRIMARY KEY, /* 주소록번호 */
	ad_m_email VARCHAR2(60) NOT NULL REFERENCES MEMBER(m_email), /* 회원아이디 */
	ad_name VARCHAR2(80), /* 이름 */
	ad_company VARCHAR2(60), /* 회사 */
	ad_mnumber VARCHAR2(15), /* 휴대폰번호 */
	ad_hnumber VARCHAR2(15), /* 집전화번호 */
	ad_cnumber VARCHAR2(15), /* 회사전화번호 */
	ad_email VARCHAR2(60), /* 이메일주소 */
	ad_address VARCHAR2(4000), /* 주소 */
	ad_image VARCHAR2(2000), /* 사진 */
	ad_bcard VARCHAR2(2000), /* 명함사진 */
	ad_memo VARCHAR2(4000) /* 메모 */
);



/* 카드 */
CREATE TABLE CARD (
	c_no NUMBER NOT NULL PRIMARY KEY, /* 카드번호 */
	c_m_email VARCHAR2(60) NOT NULL REFERENCES MEMBER(m_email), /* 회원아이디 */
	c_name VARCHAR2(60) NOT NULL, /* 카드이름 */
	c_company VARCHAR2(60) NOT NULL, /* 카드회사 */
	c_keyword VARCHAR2(2000) NOT NULL /* 키워드 */
	c_mainCard char(1),				  /* 주 사용카드 여부 */
	c_sms_receive char(1)			  /* 해당 카드의 sms 등록 여부 */
);



/* 가계부 */
CREATE TABLE MONEYBOOK (
	mb_no NUMBER NOT NULL PRIMARY KEY, /* 가계부번호 */
	mb_m_email VARCHAR2(60) NOT NULL REFERENCES MEMBER(m_email), /* 회원아이디 */
	mb_date VARCHAR2(10) NOT NULL, /* 날짜 */
	mb_category VARCHAR2(30), /* 분류 */
	mb_income NUMBER, /* 수입 */
	mb_outgo NUMBER, /* 지출 */
	mb_outtype VARCHAR2(30), /* 지출형태 */
	mb_memo VARCHAR2(4000) /* 메모 */
);




-- CREATE SEQUENCE --
CREATE SEQUENCE S_NO_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE AD_NO_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE C_NO_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE MB_NO_SEQ INCREMENT BY 1 START WITH 1;

COMMIT;