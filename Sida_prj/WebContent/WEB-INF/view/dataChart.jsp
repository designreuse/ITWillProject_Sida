<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link class="include" rel="stylesheet" type="text/css"
	href="plugins/css/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="plugins/js/jquery.jqplot.min.js"></script>
<script src="plugins/js/jqplot.dateAxisRenderer.js"></script>
<script src="plugins/js/jqplot.pieRenderer.js"></script>
<script src="plugins/js/jqplot.highlighter.min.js"></script>

<script>
$(document).ready(function(){
  var line1=[['23-May-08', 578.55], ['20-Jun-08', 566.5], ['25-Jul-08', 480.88], ['22-Aug-08', 509.84],
      ['26-Sep-08', 454.13], ['24-Oct-08', 379.75], ['21-Nov-08', 303], ['26-Dec-08', 308.56],
      ['23-Jan-09', 299.14], ['20-Feb-09', 346.51], ['20-Mar-09', 325.99], ['24-Apr-09', 386.15]];
  var plot1 = $.jqplot('graphDiv', [line1], {
      title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>
<!-- BODY -->
<div class="body">
	<section class="content">

		<ol class="breadcrumb">
			<li><a href="index.html"><i class="fa fa-home fa-fw"></i>
					Home</a></li>
			<li class="active">Forms</li>
		</ol>

		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Money Book Data Chart</h3>
				<p class="header-info">data chart</p>
			</div>
		</div>

		<!-- CONTENT -->
		<div class="main-content">

			<div style="margin-left: 5%; margin-right: 5%"></div>
			<div id="graphDiv" style="width: 1000px; height: 300px;">
			
			
			</div>
		</div>

		<!-- END: CONTENT -->
	</section>
</div>
<!-- END: BODY -->
