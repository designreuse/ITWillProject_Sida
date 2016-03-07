<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function insertMoneyBook(){
	if(f.mb_date.value==""){
		alert("날짜를 입력해주세요");
		f.mb_date.focus();
		return false;
	}
	if(f.mb_outgo.value==""){
		alert("지출금액을 입력해주세요");
		f.mb_outgo.focus();
		return false;
	}
	
	if(!(mb_outgoCheck())){
		return false;
	}
	if(f.mb_memo.value==""){
		alert("메모를 입력해주세요");
		f.mb_memo.focus();
		return false;
	}
	if(f.mb_category.value=="0"){
		alert("카테고리를 선택해주세요");
		f.mb_category.focus();
		return false;
	}
	if(f.mb_outType.value=="0"){
		alert("지출형태를 선택해주세요");
		f.mb_outType.focus();
		return false;
	}

	return true;
}
</script>
<script>
function mb_outgoCheck(){ 
	var outgo = f.mb_outgo.value;
	var number = /[^0-9]/;
	//var spanOutgo = document.getElementById('spanOutgo');

	if (outgo.search(number)!=-1){
		alert("지출금액은 숫자만 입력하실 수 있습니다");
		f.mb_outgo.focus();
	    return false;
	}else{
		return true;
	}
	   
}
</script>
<!-- BODY -->
<div class="body">
	<section class="content">

		<ol class="breadcrumb">
			<li><a href="index"><i class="fa fa-home fa-fw"></i>
					Home</a></li>
			<li class="active">Add</li>
		</ol>

		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Money Book</h3>
				<p class="header-info">지출내역을 입력 할 수 있습니다</p>
			</div>
		</div>

		<!-- CONTENT -->
		<div class="main-content">
			<div style="margin-left: 5%; margin-right: 5%"></div>
			<form role="form" id="f" onsubmit="return insertMoneyBook();" action="moneyBookInsertAction" method="post">
				<div class="form-group has-warning">
				<label class="control-label" for="inputWarning">Date</label>
				<div class="col-xs-1 input-group">
					<input class="has-warning form-control datepicker" id="ark-ex-datepicker" name="mb_date"
						type="text" data-date-format="yyyy/mm/dd" style="width: 134px;"/> <span
						class="input-group-addon"> <i class="fa fa-calendar"></i>
					</span>
				</div>
				</div>
				
				<!-- <div class="col-xs-2 input-group">
					<input type="text" class="form-control" id="mb_outgo"
							placeholder="지출금액을 입력하세요" name="mb_outgo" style="width: 174px;">
							<span id="spanOutgo"></span>
				</div> -->
				<div class="form-group has-success">
				<label class="control-label" for="inputWarning">Outgo</label>
                    <div class="input-group">
                        <span class="input-group-addon">₩</span>
                        <input type="text" class="form-control" style="width: 134px;" id="mb_outgo" name="mb_outgo">
                    </div>
                </div>
				
				<!-- <div class="form-group">
					<label for="exampleInputEmail1">Memo</label>
					<div class="col-xs-2 input-group">
						<textarea class="form-control" rows="4" name="mb_memo"></textarea>
					</div>
				</div> -->
				<div class="form-group has-info">
                    <label class="control-label" for="inputWarning">Input with info</label>
                    <textarea class="form-control" rows="4" name="mb_memo" style="width: 174px;"></textarea>
                </div>
				
				<div class="form-group has-error">
					<label for="exampleInputEmail1">Category</label>
					<div class="col-xs-2 input-group">
					<span class="dropdown"> <select class="form-control select2"
						name="mb_category">
							<option value="0">(Select Category)</option>
							<!-- <option value="식비">식비</option>
							<option value="문화생활비">문화생활비</option>
							<option value="건강관리비">건강관리비</option>
							<option value="의류미용비">의류미용비</option>
							<option value="교통비">교통비</option>
							<option value="차량유지비">차량유지비</option>
							<option value="주거생활비">주거생활비</option>
							<option value="학비">학비</option>
							<option value="사회생활비">사회생활비</option>
							<option value="유흥비">유흥비</option>
							<option value="금융보험비">금융보험비</option>
							<option value="저축">저축</option>
							<option value="기타">기타</option> -->
							<option value="식비">식비</option>
							<option value="문화생활비">문화생활비</option>
							<option value="건강관리비">건강관리비</option>
							<option value="의류미용비">의류미용비</option>
							<option value="교통비">교통비</option>
							<option value="주거생활비">주거생활비</option>
							<option value="기타">기타</option>
					</select>
					</span>
					</div>
				</div>

				<div class="form-group has-error">
					<label for="exampleInputEmail1">OutType</label>
					<div class="col-xs-2 input-group">
					<span class="dropdown"> 
						<select class="form-control select2" name="mb_outType">
							<option value="0">(Select OutType)</option>
							<option value="현금">현금</option>
							<c:forEach var="cardList" items="${cardList}">
								<%-- <option value="${cardList.c_name}">${cardList.c_name}</option> --%>
								<option value="${cardList.c_no}">${cardList.c_name}</option>
							</c:forEach>	
						</select>
					</span>
					
					
					
					</div>
					
					<input id="mb_m_email" name="mb_m_email" value="${mb_m_email}" type="hidden"/>
					<input id="mb_income" name="mb_income" value="0" type="hidden"/>
				</div>
				<div class="col-md-7 form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>

			</form>
			<!-- form end -->

		</div>

		<!-- END: CONTENT -->
	</section>
</div>
<!-- END: BODY -->
