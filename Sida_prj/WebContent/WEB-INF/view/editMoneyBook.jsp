<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Welcome to Sida</title>
<link rel="shortcut icon" href="img/ico/favicon.png" />

<!-- CSS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" type="text/css" />
<link href="scripts/vendor/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="scripts/vendor/bootstrap-jasny/dist/extend/css/jasny-bootstrap.min.css"
	rel="stylesheet" />
<!--<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />-->
<link href="scripts/vendor/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />
<link
	href="scripts/vendor/bootstrap-daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<link href="scripts/vendor/bootstrap-datepicker/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<link href="scripts/vendor/select2/select2.css" rel="stylesheet"
	type="text/css" />
<link href="scripts/vendor/select2/select2-bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="scripts/vendor/jquery.uniform/themes/default/css/uniform.default.min.css"
	rel="stylesheet" type="text/css" />
<link href="scripts/css/prettify.css" rel="stylesheet" type="text/css" />
<link href="scripts/vendor/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<link href="scripts/vendor/fullcalendar/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<link href="scripts/css/ark.css" rel="stylesheet" type="text/css" />

<!-- Remove this line on production-->
<link href="scripts/css/examples.css" rel="stylesheet" type="text/css" />

<!-- JS -->
<script src="scripts/vendor/jquery/dist/jquery.min.js"></script>
<script src="scripts/vendor/jquery-ui/js/jquery-ui.min.js"></script>
<script src="scripts/vendor/jquery.uniform/jquery.uniform.min.js"></script>
<script src="scripts/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="scripts/vendor/bootstrap-jasny/dist/extend/js/jasny-bootstrap.min.js"></script>
<script src="scripts/vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="scripts/vendor/moment/min/moment.min.js"></script>
<!-- <script src="scripts/vendor/fullcalendar/lib/moment.min.js"></script> -->
<script
	src="scripts/vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
<script
	src="scripts/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="scripts/vendor/dropzone/downloads/dropzone.min.js"></script>
<script
	src="scripts/vendor/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.pie.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.stack.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.resize.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.time.js"></script>
<script src="scripts/vendor/jquery-flot/jquery.flot.navigate.js"></script>
<script src="scripts/vendor/select2/select2.min.js"></script>
<script src="scripts/vendor/fullcalendar/fullcalendar.js"></script>
<script src="scripts/vendor/nestable/jquery.nestable.js"></script>
<script src="scripts/vendor/ckeditor/ckeditor.js"></script>
<script
	src="https://google-code-prettify.googlecode.com/svn/loader/prettify.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/js/jquery.dataTables.min.js"></script>
<script src="scripts/js/ark.min.js"></script>

<script>
function editMoneyBook(){
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
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-972204-19', 'around25.com');
	ga('send', 'pageview');
</script>
<script>
	var flag = ${close};
	if(flag){
		window.opener.location.reload();
		window.close();
	}
</script>
</head>

<body style="margin-left: 5%; margin-right: 5%;">
	<h3>Edit MoneyBook</h3>
	<div class="col-md-4" style="margin-left: 5%; margin-right: 5%"></div>
		<form role="form" id="f" onsubmit="return editMoneyBook();" action="editMoneyBookAction" method="post">
		<div class="form-group has-warning">
				<label class="control-label" for="inputWarning">Date</label>
				<div class="col-xs-1 input-group">
					<input class="has-warning form-control datepicker" id="ark-ex-datepicker" name="mb_date"
						type="text" data-date-format="yyyy/mm/dd" style="width: 134px;" value="${editMoneyBook.mb_date}"/> <span
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
                        <input type="text" class="form-control" style="width: 134px;" id="mb_outgo" name="mb_outgo" value="${editMoneyBook.mb_outgo }">
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
                    <textarea class="form-control" rows="4" name="mb_memo" style="width: 174px;">${editMoneyBook.mb_memo}</textarea>
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
					<input id="mb_no" name="mb_no" value="${mb_no}" type="hidden"/>
					<input id="mb_m_email" name="mb_m_email" value="${mb_m_email}" type="hidden"/>
					<input id="mb_income" name="mb_income" value="0" type="hidden"/>
				</div>
				<div class="col-md-7 form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>

</body>
</html>