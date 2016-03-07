<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
        <title>Welcome to Sida</title>
        <link rel="shortcut icon" href="img/ico/favicon.png" />
        
        <!-- CSS -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="scripts/vendor/bootstrap-jasny/dist/extend/css/jasny-bootstrap.min.css" rel="stylesheet" />
        <!--<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />-->
        <link href="scripts/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"  />
        <link href="scripts/vendor/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/select2/select2.css" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/select2/select2-bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/jquery.uniform/themes/default/css/uniform.default.min.css" rel="stylesheet" type="text/css" />
        <link href="scripts/css/prettify.css" rel="stylesheet" type="text/css" />
        <link href="scripts/vendor/fullcalendar/fullcalendar.css" rel="stylesheet" />
        <link href="scripts/vendor/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="scripts/css/ark.css" rel="stylesheet" type="text/css" />

        <!-- Remove this line on production-->
        <link href="scripts/css/examples.css" rel="stylesheet" type="text/css" />

		 <!-- JS -->
        <script src="scripts/vendor/jquery/dist/jquery.min.js"></script>
        <script src="scripts/vendor/jquery-ui/js/jquery-ui.min.js"></script>
        <script src="scripts/vendor/jquery.uniform/jquery.uniform.min.js"></script>
        <script src="scripts/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="scripts/vendor/bootstrap-jasny/dist/extend/js/jasny-bootstrap.min.js"></script>
        <script src="scripts/vendor/jquery-autosize/jquery.autosize.min.js"></script>
       	<script src="scripts/vendor/moment/min/moment.min.js"></script>
        <!-- <script src="scripts/vendor/fullcalendar/lib/moment.min.js"></script> -->
        <script src="scripts/vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="scripts/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="scripts/vendor/dropzone/downloads/dropzone.min.js"></script>
        <script src="scripts/vendor/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
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
        <script src="https://google-code-prettify.googlecode.com/svn/loader/prettify.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/js/jquery.dataTables.min.js"></script>
        <script src="scripts/js/ark.min.js"></script>
        <script src="plugins/js/jqplot.highlighter.min.js"></script>
       
        
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

           	ga('create', 'UA-972204-19', 'around25.com');
            ga('send', 'pageview');
        </script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    
    <body class="cover">
        <div class="wrapper">
            <!-- Demo Bar -->
        	<jsp:include page="demo_bar.jsp"/>
            <!-- END: Demo Bar -->

			<!-- HEAD NAV -->
			<jsp:include page="head_nav.jsp"/>
			<!-- END: HEAD NAV -->

            <!-- SIDEBAR -->
            <jsp:include page="side_bar.jsp"/>
            <!-- END: SIDEBAR -->
            
            <!-- BODY -->
            <jsp:include page="${path }" />
            <!-- END: BODY -->
        </div>
    </body>
</html>