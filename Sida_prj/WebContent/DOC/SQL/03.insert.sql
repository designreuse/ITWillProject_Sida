-- INSERT --

/* MEMBER */
INSERT INTO MEMBER(m_email, m_pwd, m_name, m_image)
			VALUES('itwill@itwill.com', '1234' , '아이티' , '/resource/img/user/itwill.jpg' );
INSERT INTO MEMBER(m_email, m_pwd, m_name, m_image)
			VALUES('test@itwill.com', '1234' , '테스트' , '/resource/img/user/test.jpg' );
INSERT INTO MEMBER(m_email, m_pwd, m_name, m_image)
			VALUES('qwer@itwill.com', '1234' , '스프링' , '/resource/img/user/qwer.jpg' );
			
/* SCHEDULER */		
INSERT INTO SCHEDULER(s_no, s_m_email, s_type, s_status, s_looptype, s_allday, s_start, s_end, s_title, s_memo)		
			VALUES(S_NO_SEQ.nextval, 'itwill@itwill.com', '할일', '예정', '없음', '1',  '2016-01-01', '', '친구만남', '메모1');
INSERT INTO SCHEDULER(s_no, s_m_email, s_type, s_status, s_looptype, s_allday, s_start, s_end, s_title, s_memo)		
			VALUES(S_NO_SEQ.nextval, 'itwill@itwill.com', '할일', '예정', '없음', '2',  '2016-01-10 15:00', '2016-01-10 17:15', '회의', '메모2');
INSERT INTO SCHEDULER(s_no, s_m_email, s_type, s_status, s_looptype, s_allday, s_start, s_end, s_title, s_memo)		
			VALUES(S_NO_SEQ.nextval, 'itwill@itwill.com', '할일', '예정', '없음', '2',  '2016-01-13 15:00', '2016-01-14 15:00', '생일', '메모3');
			
/* ADDRESSBOOK */
INSERT INTO ADDRESSBOOK(ad_no, ad_m_email, ad_name, ad_company, ad_mnumber, ad_hnumber, ad_cnumber, ad_email, ad_address, ad_image, ad_bcard, ad_memo)
			VALUES(AD_NO_SEQ.nextval, 'itwill@itwill.com', '송영준', '아이티윌', '010-1234-7899', '02-111-1234', '123@123.com' , '02-222-2345', '서울 강남구', '', '', '메모메모메모모');
INSERT INTO ADDRESSBOOK(ad_no, ad_m_email, ad_name, ad_company, ad_mnumber, ad_hnumber, ad_cnumber, ad_email, ad_address, ad_image, ad_bcard, ad_memo)
			VALUES(AD_NO_SEQ.nextval, 'itwill@itwill.com', '최자바', 'JSP', '010-9999-7899', '', '02-777-7777', 'qqq@qwe.com', '서울 동대문구', '', '', '메모메모메모모');
			
/* CARD */
INSERT INTO CARD(c_no, c_m_email, c_name, c_company, c_keyword)
			VALUES(C_NO_SEQ.nextval, 'itwill@itwill.com', 'BC카드', 'BC', 'BC');
INSERT INTO CARD(c_no, c_m_email, c_name, c_company, c_keyword)
			VALUES(C_NO_SEQ.nextval, 'itwill@itwill.com', '삼성카드', '삼성', '삼성');
			
/* MONEYBOOK */
INSERT INTO MONEYBOOK(mb_no, mb_m_email, mb_date, mb_category, mb_income, mb_outgo, mb_outtype, mb_memo)
			VALUES(MB_NO_SEQ.nextval, 'itwill@itwill.com', '20160105', '식비', 0, 25000, '카드', '저녁거리');
INSERT INTO MONEYBOOK(mb_no, mb_m_email, mb_date, mb_category, mb_income, mb_outgo, mb_outtype, mb_memo)
			VALUES(MB_NO_SEQ.nextval, 'itwill@itwill.com', '20160105', '미용', 0, 125000, '카드', '염색,파마');