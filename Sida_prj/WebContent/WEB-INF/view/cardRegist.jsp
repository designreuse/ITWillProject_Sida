<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- card Registration Page : jhy -->
 <script type="text/javascript">
 $(function() {
	 var idx = 1;
	$("#addBtn").click(function(){
		$('.listTemp').append("<div class='input-group'>"+
				 "<span class='input-group-addon' id='basic-addon1'>"+(++idx)+"</span>"+
				 "<input type='text' class='form-control' name='keyword' placeholder='Keyword' style='float:right;'>"+
			 "</div>");
	});
 });
 function valCheck(){
	 if(frm.name.value==''){
		 alert("카드명을 입력해주세요.");
			frm.name.focus();
			return false; 
	 }
	 if(frm.company.value==0){
		 alert("카드사를 선택해주세요.");
		frm.company.focus();
		return false; 
	 }
	 return true; 
 }
</script>
<div class="body">
<section class="content">
	<ol class="breadcrumb">
	    <li class="active"><a href="index"><i class="fa fa-home fa-fw"></i> Home</li></a>
		<li class="active">Card Registration</li>
	</ol>
	<div class="header">
	    <div class="col-md-12">
	        <h3 class="header-title">Card Registration</h3>
	        <p class="header-info">Your new card registration</p>
	    </div>
	</div>
<!-- CONTENT -->
	<div class="main-content">
		<div class="row">
			<div class="col-md-5" style="margin-left: 5%; margin-right: 5%">
	            <form role="form" id="f" action="registration" method="post" onsubmit="return valCheck();" name="frm">
	                <div class="form-group">
	                    <label for="exampleInputEmail1">Name</label>
	                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Card Name" name="name">
	                </div>
<!-- 	                <div class="form-group">
	                    <label for="exampleInputPassword1">Company</label>
	                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Card Company">
	                </div> -->
	                <span><label for="exampleInputEmail1">Company</label></span><br>
	                <span class="dropdown">
                    <select class="form-control select2" name="company">
                        <option value="0">(Select Card Company)</option>
                        <option value="국민카드">국민카드</option>
						<option value="BC카드">BC카드</option>
						<option value="삼성카드">삼성카드</option>
						<option value="신한카드">신한카드</option>
						<option value="현대카드">현대카드</option>
						<option value="하나카드">하나카드</option>
						<option value="롯데/아멕스카드">롯데/아멕스카드</option>
						<option value="씨티카드">씨티카드</option>
						<option value="신세계카드">신세계카드</option>
						<option value="NH">NH카드</option>
						<option value="우리(평화)카드">우리(평화)카드</option>
						<option value="VISA">광주VISA카드</option>
						<option value="산은캐피탈">산은캐피탈</option>
						<option value="산업은행카드">KDB산업은행카드</option>
						<option value="전북은행카드">전북은행카드</option>
						<option value="제주은행카드">제주은행카드</option>
						<option value="우체국카드">우체국카드</option>
						<option value="스탠다드차타드카드">스탠다드차타드카드</option>
						<option value="현대증권카드">현대증권카드</option>
						<option value="기업은행카드">기업은행카드</option>
                    </select>
					</span>
					<br>
	                <br>
	                
	                <label for="exampleInputPassword1">Filter Keyword</label>
		            <!-- Filter Keyword List : Start -->
		            <div class="listTemp">
			             <div class="input-group">
							 <span class="input-group-addon" id="basic-addon1">1</span>
							 <input type="text" class="form-control" placeholder="Keyword" name="keyword" style="float:right;">
						 </div>
					</div>
					 <!-- Filter Keyword List : End -->
					
				    <button type="button" class="btn btn-primary" id="addBtn" style="margin-top: 3%;"><i class="fa fa-plus"></i> Add</button>
				      
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" name="mainCard"> Use this card to the main card
	                    </label>
	                </div>
	                 <div class="checkbox">
	                    <label>
	                        <input type="checkbox" name="sms"> This card to register for SMS
	                    </label>
	                </div>
	                <button type="submit" class="btn btn-primary">Submit</button>
	            	<input type="hidden" value="${sMember.m_email }" name="m_email">
	            </form>
	        </div>
	        <div class="col-md-5" style="margin-top: 5%;">
	           <img class="img-rounded" alt="140x140" style="width: 300px; height: 200px; margin-left: 1%;" src="img/customImage/cards.jpg">
	        </div>
        </div>
	</div>
<!-- END: CONTENT -->
</section>
</div>