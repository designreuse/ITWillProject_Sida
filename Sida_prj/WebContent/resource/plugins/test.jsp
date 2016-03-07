<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<!-- JQ-PLOT의 CSS를 설정 -->
<link class="include" rel="stylesheet" type="text/css"  href="jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- JQ-PLOT의 기본 설정 -->
<script type="text/javascript" src="jquery.jqplot.js"></script>

<!-- Highlighter(마우스 접근시 데이터정보 표시) 설정 -->
<script type="text/javascript" src="jqplot.highlighter.js"></script>

<!-- 좌표에 관한 정보나 Zoom 기능 사용시 설정 -->
<script type="text/javascript" src="jqplot.cursor.js"></script>

<!-- 축의 데이터를 날짜형태로 입력하기 위해서 설정 -->
<script type="text/javascript" src="jqplot.dateAxisRenderer.js"></script>

<!-- 축의 데이터의 Label Option을 설정 -->
<script type="text/javascript" src="jqplot.canvasAxisLabelRenderer.js"></script>

<!-- Legend(Line에대한 간단한 범례)의 Option을 설정 -->
<script type="text/javascript" src="jqplot.enhanceLegendRenderer.js"></script>

<!-- 축의 데이터를 순서에 상관없이 자동정렬을 설정 -->
<script type="text/javascript" src="jqplot.categoryAxisRenderer.js"></script>

<!-- 축의 데이터 표현설정과 그래프위의 점의 Option을 설정 -->
<script type="text/javascript" src="jqplot.canvasAxisTickRenderer.js"></script>


<script type="text/javascript">
$(function() {
	 var line =[['2013/12/25',15],['2013/12/26',22],['2013/12/27',11],['2013/12/28',32],
	           ['2013/12/29',41],['2013/12/30',23],['2014/01/01',100],['2014/01/02',28],['2014/01/03',40]];
	 var test='zz';
	 alert(test);
	  alert(line);
	 var plot = $.jqplot('graphDiv', [line],{
	           axes:{
	             xaxis:{
	                  // 날짜 형태로 입력을 하기위해서는 Date형식의 Renderer을 사용합니다.
	                  renderer:$.jqplot.DateAxisRenderer,
	                  tickOptions:{ // 축에관한 옵션                    
	                      // 입력된 값이 날짜형태로 인식되기 위해서 format 형식을 정해주고 입력값도
	                      // yyyy/mm/dd 형식으로 입력해야만 정상적으로 나타납니다.
	                        formatString:'%y/%m/%d'
	                  } 
	              }
	           }
	     }); 
	     
});
</script>

<script type="text/javascript">
$(function() {
	
});
</script>

</head>
<body>
 <div id="graphDiv" style="width:1000px; height:300px;"></div>
<div id="graph" style="width:300px; height:300px;"></div>
<div id="graph2" style="width:300px; height:300px;"></div>
</body>
</html>