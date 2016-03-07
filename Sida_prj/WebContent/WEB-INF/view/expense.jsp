<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link class="include" rel="stylesheet" type="text/css"
	href="plugins/css/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="plugins/js/jquery.jqplot.min.js"></script>
<script src="plugins/js/jqplot.dateAxisRenderer.js"></script>
<script src="plugins/js/jqplot.pieRenderer.js"></script>
<script src="plugins/js/jqplot.categoryAxisRenderer.min.js"></script>
<script src="plugins/js/jqplot.barRenderer.min.js"></script>
<script src="plugins/js/jqplot.highlighter.min.js"></script>

<script>
	var StringBuffer = function() {
		this.buffer = new Array();
	};
	StringBuffer.prototype.insert = function(idx, strValue) {
		this.buffer.splice(idx, 0, strValue);
	}
	StringBuffer.prototype.append = function(str) {
		this.buffer[this.buffer.length] = str;
	};
	StringBuffer.prototype.toString = function() {
		return this.buffer.join("");
	};
</script>
<script>
	Number.prototype.formatMoney = function(c, d, t) {
		var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "."
				: d, t = t == undefined ? "," : t, s = n < 0 ? "-" : "", i = parseInt(n = Math
				.abs(+n || 0).toFixed(c))
				+ "", j = (j = i.length) > 3 ? j % 3 : 0;
		return s + (j ? i.substr(0, j) + t : "")
				+ i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t)
				+ (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
	};

	function moneyBookDelete(no) {
		var f = confirm('Are you sure you want to delete the moneyBook?');

		if (no) {
			location.href = 'deleteMoneyBook?mb_no=' + no;
		}
	}

	function moneyBookEdit(no) {
		window.open("editMoneyBook?mb_no=" + no, "_blank",
				"top=30, left=400, width=400, height=600");
	}

	$(function() {
		$(document)
				.on(
						'click',
						'#search',
						function(e) {

							var tempDate = document
									.getElementById("result_date");
							var mb_date = tempDate.options[tempDate.selectedIndex].text;
							var mb_m_email = $('#mb_m_email').val();
							var temp = '';
							var collT = '';
							$
									.ajax({
										type : "POST",
										url : "searchDate",
										dataType : "JSON",
										async : true,
										data : {
											"mb_date" : mb_date,
											"mb_m_email" : mb_m_email
										},
										success : function(jsonObject, status,
												jqXHR) {
											for (var i = 0; i < 1; i++) {
												var htmlData = "";
												htmlData += "<button type=\"button\" class=\"btn btn-default\">";
												htmlData += "<i class=\"fa fa-fw fa-calendar\"></i>"
														+ jsonObject[i].mb_date
														+ " ~ "
														+ jsonObject[i].mb_memo;
												htmlData += "</button>";
												htmlData += "<button type=\"button\" class=\"btn btn-default\">";
												htmlData += "<i class=\"fa fa-fw fa-krw\"></i>";
												htmlData += jsonObject[i].mb_outgo
														.formatMoney(0, '.',
																',');
												htmlData += "</button>";

												temp += htmlData;
											}

											$("#dateResult").html(temp);
											for (var i = 1; i < jsonObject.length - 1; i++) {
												//alert("jsonObject["+i+"]"+jsonObject[i].mb_date+"/"+jsonObject[i].mb_outgo);
												var htmlData = "";
												//alert("jsonObject[i].mb_no:"+jsonObject[i].mb_no);
												htmlData += "<tr data-toggle=\"collapse\" data-target=\"#demo"+i+"\" class=\"accordion-toggle\" id=\"test\">";
												htmlData += "<td>"
														+ i
														+ "<input type=\"hidden\" value=\""+i+" \" name=\"count\" /></td>";
												htmlData += "<td>" + mb_m_email
														+ "</td>";
												htmlData += "<td>"
														+ jsonObject[i].mb_date
														+ "<input type=\"hidden\" value=\""+jsonObject[i].mb_date+"\" name=\"mb_date\" /></td>";
												htmlData += "<td id=\"outType\">";
												htmlData +="<button type=\"button\" class=\"xxx btn label label-success\"  style=\"font-size: 10px; padding: 3px 16px;\">Show</button>";
												
												//htmlData+=jsonObject[i].mb_outType;

												if (jsonObject[i].mb_outType == 'CARD/CASH') {
													htmlData += "<span class=\"label label-success\">"
															+ jsonObject[i].mb_outType
															+ "</span>";
												} else if (jsonObject[i].mb_outType == 'CARD') {
													htmlData += "<span class=\"label label-info\">"
															+ jsonObject[i].mb_outType
															+ "</span>";
												} else if (jsonObject[i].mb_outType == 'CASH') {
													htmlData += "<span class=\"label label-warning\">"
															+ jsonObject[i].mb_outType
															+ "</span>";
												}

												htmlData += "</td>";
												htmlData += "<input type=\"hidden\" value=\""+jsonObject[i].mb_outType+"\" name=\"mb_outType\" />"
												htmlData += "<td><i class=\"fa fa-fw fa-krw\"></i>"
														+ jsonObject[i].mb_outgo
																.formatMoney(0,
																		'.',
																		',')
														+ "</td>";
												htmlData += jsonObject[i].mb_outgo;
												//htmlData+="<td><div><a href=\"#\" onclick=\"javascript:moneyBookEdit("+jsonObject[i].mb_no+");\">Edit</a>  <a href=\"#\" onclick=\"javascript:moneyBookDelete("+jsonObject[i].mb_no+");\">Delete</a></div></td>";
												htmlData += "</tr>"
												htmlData += "<tr><td colspan=\"6\" class=\"hiddenRow\"><div class=\"accordion-body collapse\" id=\"demo"
														+ i
														+ "\" align=\"center\" style='padding-left:5%;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td></tr>";
												collT += htmlData;
											}

											$("#collapseTable").html(collT);
											//chart
											$('#graphDiv').empty();
											$('#graphMonth').empty();

											//chart graph
											var arrayLength = jsonObject.length - 1;
											var bar = new Array(arrayLength);

											for (var i = 0; i < bar.length - 1; i++) {
												bar[i] = new Array(2);
											}

											for (var i = 0; i < bar.length - 1; i++) {
												var htmlData = "";
												htmlData += jsonObject[i + 1].mb_date
														.substring(0, 4);
												htmlData += "/";
												htmlData += jsonObject[i + 1].mb_date
														.substring(4, 6);
												htmlData += "/";
												htmlData += jsonObject[i + 1].mb_date
														.substring(6, 8);

												bar[i][0] = htmlData;
												bar[i][1] = jsonObject[i + 1].mb_outgo;

											}
											//alert('bar '+bar);

											var plot = $
													.jqplot(
															'graphMonth',
															[ bar ],
															{
																grid : {
																	borderColor : 'white',
																	shadow : false,
																	drawBorder : false,
																	shadowColor : 'transparent'
																},
																seriesDefaults : {

																	rendererOptions : {
																		smooth : true
																	}
																},
																axes : {
																	xaxis : {
																		// 날짜 형태로 입력을 하기위해서는 Date형식의 Renderer을 사용합니다.
																		renderer : $.jqplot.DateAxisRenderer,
																		tickOptions : { // 축에관한 옵션                    
																			// 입력된 값이 날짜형태로 인식되기 위해서 format 형식을 정해주고 입력값도
																			// yyyy/mm/dd 형식으로 입력해야만 정상적으로 나타납니다.
																			formatString : '%y/%m/%d'
																		}
																	},
																	yaxis : {
																		tickOptions : {
																			formatString : '%d'
																		}
																	}
																},
																highlighter : {
																	show : true,
																	sizeAdjust : 7.5
																},
																cursor : {
																	show : false
																}
															});
											var cateE = Number(jsonObject[bar.length].mb_m_email);
											var cateD = Number(jsonObject[bar.length].mb_date);
											var cateC = Number(jsonObject[bar.length].mb_category);
											var cateO = Number(jsonObject[bar.length].mb_outType);
											var cateM = Number(jsonObject[bar.length].mb_memo);

											//chart pie
											$
													.jqplot(
															'graphDiv',
															[ [
																	[ '식비',
																			cateE ],
																	[ '문화생활비',
																			cateD ],
																	[ '건강관리비',
																			cateC ],
																	[
																			'의류미용비',
																			jsonObject[bar.length].mb_income ],
																	[
																			'교통비',
																			jsonObject[bar.length].mb_outgo ],
																	[ '주거생활비',
																			cateO ],
																	[ '기타',
																			cateM ] ] ],
															{
																grid : {
																	borderColor : 'white',
																	shadow : false,
																	drawBorder : false,
																	shadowColor : 'transparent'
																},
																seriesDefaults : {
																	//원형으로 렌더링
																	renderer : $.jqplot.PieRenderer,
																	//원형상단에 값보여주기(알아서 %형으로 변환)
																	rendererOptions : {
																		showDataLabels : true,
																		highlightMouseOver : true,
																		shadowAlpha : 0.28,
																		shadowDepth : 5,
																		dataLabelPositionFactor : 0.6,
																		startAngle : 50

																	}
																},
																//우측 색상별 타이틀 출력
																legend : {
																	show : true,
																	location : 'e'
																}, highlighter: {
																      show: true,
																      useAxesFormatters: false,
																      tooltipFormatString: '%s'
																    }
															});

										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert("error:" + jqXHR.status);
										}
									});
						});
		$(document)
				.on(
						'click',
						'.accordion-toggle',
						function(e) {

							var mb_dateObject = this.children;
							var mb_date = mb_dateObject[2].children[0].value;
							var mb_statusCount = mb_dateObject[0].children[0].value;
							var mb_m_email = $('#mb_m_email').val();

							var temp = '';

							$
									.ajax({
										type : "POST",
										url : "expenseDateList",
										dataType : "JSON",
										async : true,
										data : {
											"mb_date" : mb_date, "mb_m_email" : mb_m_email
										},
										success : function(jsonObject, status,
												jqXHR) {
											for (var i = 0; i < jsonObject.length; i++) {
												//alert("test:"+jsonObject[i].mb_outType+","+jsonObject[i].mb_memo+","+jsonObject[i].mb_outgo);
												var htmlData = "<div style='float:left;width:10%;'>";
												if (jsonObject[i].mb_outType == '현금') {
													/* htmlData+="<span class=\"label label-info\">"+jsonObject[i].mb_outType+"</span></td><td>"; */
													htmlData += "<span class=\"label label-info\">CASH</span></div>";
												} else {
													htmlData += "<span class=\"label label-warning\">CARD</span></div>";
												}
												if(jsonObject[i].mb_category == null){
													htmlData += "<div style='float:left;;width:20%;'>"
														+ "미등록"
														+ "</div>";
												}else{
													htmlData += "<div style='float:left;;width:20%;'>"
															+ jsonObject[i].mb_category
															+ "</div>";
													
												}
												if(jsonObject[i].mb_memo==null){
													htmlData += "<div style='float:left;;width:30%;'>"
														+ "미등록"
														+ "</div>";
												}else{
													
													htmlData += "<div style='float:left;;width:30%;'>"
															+ jsonObject[i].mb_memo
															+ "</div>";
												}
												htmlData += "<div style='float:left;'><div class=\"fa fa-fw fa-krw\"></div>";
												htmlData += jsonObject[i].mb_outgo
														.formatMoney(0, '.',
																',')
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>";
												htmlData += "<div><a href=\"#\" onclick=\"javascript:moneyBookEdit("
														+ jsonObject[i].mb_no
														+ ");\">Edit</a> <a href=\"#\" onclick=\"javascript:moneyBookDelete("
														+ jsonObject[i].mb_no
														+ ");\">Delete</a></div>";
												htmlData += "</div>";
												temp += htmlData;
											}
											$("#demo" + mb_statusCount).html(
													temp);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert("error:" + jqXHR.status);
										}
									});
						});
	});
</script>
<div class="body">
	<section class="content">
		<ol class="breadcrumb">
			<li><a href="index"><i class="fa fa-home fa-fw"></i>Home</a></li>
			<li class="active">Expense</li>
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

				<div class="col-md-6">
					<label for="exampleInputEmail1">Search Date</label>
					<div class="col-xs-2 input-group">
						<div class="dropdown" style="width: 134px;">
							<select id="result_date" name="mb_date"
								class="form-control select2">
								<option value="0">(Select Date)</option>
								<c:forEach var="uniqueItems" items="${uniqueItems}"
									varStatus="status">
									<option value="${uniqueItems}">${uniqueItems}</option>
								</c:forEach>
							</select> <input type="hidden" value="${uniqueItems}" id="mb_date" /> <input
								type="hidden" value="${mb_m_email}" id="mb_m_email" />

						</div>

						<span class="input-group-addon" id="search"><i
							class="fa fa-fw fa-search"></i></span>
					</div>
					<br />
					<div id="dateResult" align="justify"></div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>User</th>
								<th>Date</th>
								<th>Detail Info</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody id="collapseTable">
							<input type="hidden" value="${mb_m_email}" name="mb_m_email"
								id="mb_m_email" />
						</tbody>
					</table>


			<div class="col-md-15">
					<!-- <div id="graphMonth" style="width: 350px; height: 300px;"
						class="jqplot-pie-series jqplot-data-label"
						style="position:absolute;"></div> -->
					<div id="graphMonth"
						class="jqplot-pie-series jqplot-data-label"
						></div>
					</div>
				</div>


				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>
				<div class="col-md-6"></div>

				<!-- <div id="graphDiv" style="width:50%;height:50%;"></div> -->
				<div class="col-md-5">
					<div class="panel ">

							
							 
						<div id="graphDiv" class="jqplot-pie-series jqplot-data-label" style="position:absolute;">
						
						
						</div>
					</div>
					<div class="col-md-6"></div>


				</div>
			</div>
			<!-- END: CONTENT -->
	</section>
</div>
