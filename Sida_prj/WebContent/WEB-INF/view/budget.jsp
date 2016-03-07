<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="body">
	<section class="content">
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-home fa-fw"></i> Home</li>
		</ol>

		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Money Book</h3>
				<p class="header-info">Easily organize your expense</p>
			</div>
		</div>
		<!-- CONTENT -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-5" style="margin-left: 5%; margin-right: 5%"></div>
				<div class="col-md-7">
					<h3>Budget</h3>
					
				
				</div>
			</div>
		</div>
		<!-- END: CONTENT -->
	</section>
</div>


<!-- 
@RequestMapping(value="/searchDate", produces="application/json")
	   public @ResponseBody List<MoneyBook> searchDate(@RequestParam("mb_date") String mb_date, @RequestParam("mb_m_email") String mb_m_email, Model model, HttpSession session) throws Exception{
	      List<MoneyBook> minMaxSumResult = null; // findMinMaxSum 결과값
	      List<MoneyBook> monthDate = null; // findMinMaxSum 결과값
	      List<MoneyBook> moneyBookOutType = null; // 지출형태 결과값
	      List<MoneyBook> moneyList = null; //outType 결과값
	      List<MoneyBook> resultAll = null; //전체 출력
	      List<MoneyBook> totList = new ArrayList<MoneyBook>();
	      List<String> list = new ArrayList<String>();
	      List<Integer> listNo = new ArrayList<Integer>();
	      String tempListNo="";
	      
	      List<Map<String, String>> search_list = new ArrayList<Map<String, String>>(); // findMinMaxSum
	      HashMap<String, String> map = new HashMap<String, String>();
	      int mb_no=0;
	      
	      map.put("mb_date", mb_date);
	      map.put("mb_m_email", mb_m_email);
	      search_list.add(map);
	      
	      minMaxSumResult = moneyBookService.dateList(map);
	      for(MoneyBook arr : minMaxSumResult){
	         totList.add(arr);
	      }
	      monthDate =moneyBookService.findMonthDate(map);
	      System.err.println("monthDate:"+monthDate);
	      
	      *//**************************//*
	      for (int i = 0; i < monthDate.size(); i++) {

	         mb_date = monthDate.get(i).getMb_date();
	         String temp = "";
	         String tempList = "";
	         

	         moneyBookOutType = moneyBookService.findMoneyBookOutTypeResult(mb_date);
	         for(MoneyBook arr : moneyBookOutType){
	            totList.add(arr);
	         }
	         System.err.println("&&moneyBookOutType:" + moneyBookOutType);
	         
	         for (int j = 0; j < moneyBookOutType.size(); j++) {
	            temp += moneyBookOutType.get(j).getMb_outType();
	         }
	         
	         System.err.println("test@@@@@@@@@@@@@@@:"+temp);
	         
	         if (temp.matches(".*[0-9]+현금*")) {
	            System.err.println("1");
	            tempList = "CARD/CASH";
	         } else if (temp.matches(".*현금.*[0-9]")) {
	            System.err.println("2");
	            tempList = "CARD/CASH";
	         } else if (temp.matches(".*[0-9]+현금.*")) {
	            System.err.println("3");
	            tempList = "CARD/CASH";
	         } else if (temp.matches("^\\d+\\n")) {
	            System.err.println("4");
	            tempList = "CARD";
	         } else if (temp.matches(".*현금*.")) {
	            System.err.println("5");
	            tempList = "CASH";
	         }
	         
	         // 카드만 있으면 카드 출력
	         // 카드+현금 둘다있으면 카드/현금 출력
	         // 현금만 썼으면 현금출력
	         if (temp.matches(".*카드현금*")) {
	            // System.err.println("1");
	            tempList = "CARD/CASH";
	         } else if (temp.matches(".*현금.*카드")) {
	            // System.err.println("2");
	            tempList = "CARD/CASH";
	         } else if (temp.matches(".*카드현금.*")) {
	            // System.err.println("3");
	            tempList = "CARD/CASH";
	         } else if (temp.matches(".*카드*.")) {
	            // System.err.println("4");
	            tempList = "CARD";
	         } else if (temp.matches(".*현금*.")) {
	            // System.err.println("5");
	            tempList = "CASH";
	         }
	         list.add(tempList);
	         monthDate.get(i).setMb_outType(tempList);
	         
	         resultAll = moneyBookService.resultMonthAll(map);
	         for(int j=0; j<resultAll.size();j++){
	            mb_no=resultAll.get(i).getMb_no();
	            listNo.add(mb_no);
	         }
	         monthDate.get(i).setMb_no(mb_no);
	         
	      }
	      for(MoneyBook arr : monthDate){
	         totList.add(arr);
	      }
	   *//************************************//*
	      for (int i = 0; i < list.size(); i++) {
	         System.err.println("list[" + i + "]:" + list.get(i));
	      }
	      
	      System.err.println("totList:"+totList);
	      return totList;
	   }


 -->