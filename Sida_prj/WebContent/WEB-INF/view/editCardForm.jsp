<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script>
	var flag = ${closeFlag};
	if(flag){
		window.opener.location.reload();
		window.close();
	}
</script>
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
<script src="scripts/vendor/fullcalendar/lib/moment.min.js"></script>
<script src="scripts/vendor/fullcalendar/fullcalendar.min.js"></script>
<script src="scripts/vendor/nestable/jquery.nestable.js"></script>
<script src="scripts/vendor/ckeditor/ckeditor.js"></script>
<script
	src="https://google-code-prettify.googlecode.com/svn/loader/prettify.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/js/jquery.dataTables.min.js"></script>
<script src="scripts/js/ark.min.js"></script>
<!-- 달력 js 따로 만듬 by SYJ-->
<script src="scripts/js/custom_cal.js"></script>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
<style type="text/css">
body {
	background-size: cover;
	background-attachment: fixed;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.ipt').prop({
			disabled : true
		});
		var idx = 1;
		$("#addBtn")
				.click(
						function() {
							$('.listTemp')
									.append(
											"<div class='input-group'>"
													+ "<span class='input-group-addon' id='basic-addon1'>"
													+ (idx++)
													+ "</span>"
													+ "<input type='text' class='form-control' name='addedKeywordList' placeholder='Keyword' style='float:right;'>"
													+ "</div>");
						});
		$('.row-span').dblclick(function() {
			var $text = this;
			var inputObj = $text.children[0].children[0];
			$(inputObj).prop('disabled', function(i, val) {
				return !val;
			});
		});
		$('.form-horizontal').submit(function(){
			$('.ipt').prop({
				disabled : false
			});
		});
	});
</script>
</head>
<body style="margin-left: 5%; margin-right: 5%;">
	<h3>Keyword Setting</h3>
	<form class="form-horizontal" role="form" action="editCardInfo" method="post">
	<input type="hidden" value="${card.c_no}" name="c_no"/>
	<div class="main-content">
		<div class="row">
			<div class="col-md-6">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Keyword</label>
						<c:forEach var="arr" items="${keywordList }">
							<div class="row-span">
								<div class="col-sm-10" style="margin-bottom: 8px;">
									<input type="text" class="ipt form-control"
										placeholder="Keyword" value="${arr }" name="keywordList">
								</div>
								<!--   <i class="fa fa-repeat"></i> -->
							</div>
						</c:forEach>
					</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<div class="listTemp"></div>
					<button type="button" class="btn btn-primary" id="addBtn"
						style="margin-top: 3%;" name="addedKeywordList">
						<i class="fa fa-plus"></i> Add
					</button>
					<div class="checkbox">
						<label>
						<c:choose>
							<c:when test="${card.c_maincard==1}">
								 <input type="checkbox" name="mainCard" checked="checked">
							</c:when>
							<c:when test="${card.c_maincard==null||card.c_maincard==0}">
								 <input type="checkbox" name="mainCard">
							</c:when>
						</c:choose>
							Use this card to the main card
						</label>
					</div>
					<div class="checkbox">
						<label> 
							<c:choose>
								<c:when test="${card.c_sms_receive==1 }">
									<input type="checkbox" name="sms" checked="checked"> 
								</c:when>
								<c:when test="${card.c_sms_receive==null||card.c_sms_receive==0 }">
									<input type="checkbox" name="sms"> 
								</c:when>
							</c:choose>
						This card to register for SMS
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>