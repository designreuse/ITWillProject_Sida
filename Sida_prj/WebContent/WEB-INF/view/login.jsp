<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Login Page : jhy -->
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
        <link href="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="scripts/css/ark.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        
         <!-- JS -->
        <script src="scripts/vendor/jquery/dist/jquery.min.js"></script>
        <script src="scripts/vendor/jquery-ui/js/jquery-ui.min.js"></script>
        <script src="scripts/vendor/jquery.uniform/jquery.uniform.min.js"></script>
        <script src="scripts/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="scripts/vendor/bootstrap-jasny/dist/extend/js/jasny-bootstrap.min.js"></script>
        <script src="scripts/vendor/jquery-autosize/jquery.autosize.min.js"></script>
        <script src="scripts/vendor/moment/min/moment.min.js"></script>
        <script src="scripts/vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="scripts/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="scripts/vendor/dropzone/downloads/dropzone.min.js"></script>
        <script src="scripts/vendor/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
        <script src="scripts/vendor/jquery-flot/jquery.flot.js"></script>
        <script src="scripts/vendor/jquery-flot/jquery.flot.pie.js"></script>
        <script src="scripts/vendor/jquery-flot/jquery.flot.stack.js"></script>
        <script src="scripts/vendor/jquery-flot/jquery.flot.resize.js"></script>
        <script src="scripts/vendor/select2/select2.min.js"></script>
        <!-- <script src="scripts/vendor/fullcalendar/lib/moment.min.js"></script> -->
        <script src="scripts/vendor/fullcalendar/fullcalendar.min.js"></script>
        <script src="https://google-code-prettify.googlecode.com/svn/loader/prettify.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.0/js/jquery.dataTables.min.js"></script>

        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            /* ga('create', 'UA-972204-19', 'around25.com');
            ga('send', 'pageview'); */
        </script>
        <script type="text/javascript">
        	$(function(){
        		$("#exampleInputEmail1").focus();
        		$('#frm').submit(function(e){
					var $email=$('#exampleInputEmail1').val();
					var $pwd=$('#exampleInputPassword1').val();
					$.ajax({
						type:"POST",
						url:"loginCheck",
						dataType:"JSON",
						async:true,
						data:{"email":$email,"pwd":$pwd},
						success:function(data,status,jqXHR){
							if(!data.stat){
								if(data.data=="Check Email"){
									$('#exampleInputEmail1').focus();
									$('#email').html("<input type='email' class='form-control' id='exampleInputEmail1' placeholder='Enter Email'" +
											" title='"+data.data+"' data-placement='right' value='"+$email+"'>");
									$("#exampleInputEmail1").tooltip('show');
								} else {
									$('#exampleInputPassword1').focus();
									$('#pwd').html("<input type='password' class='form-control' id='exampleInputPassword1' placeholder='Password'" +
											" title='"+data.data+"' data-placement='right'>");
									$("#exampleInputPassword1").tooltip('show');
								}
							}else {
								location.href='index';
							}
						},
						error:function(jqXHR,textStatus,errorThrown){
							alert(jqXHR.status);
						}
					});
					e.preventDefault();
            	});
        	});
        </script>
    </head>
    <body class="cover">
<div class="login-wrap">
    <span class="brand">
        <i class="fa fa-html5"></i> Sida
    </span>
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">Sign In</h3>
        </div>
        <div class="panel-body">
            <span id="msg" style="color: red;"></span>
            <form id="frm">
                <div class="form-group" id="email">
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Email" >
                </div>
                <div class="form-group" id="pwd">
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Remember me for 2 weeks
                    </label>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
                <br/>
                <br/>

                <a href="forgot">Forgot password?</a><br/>
                Don't have an account yet? <a href="register">Sign Up!</a>
            </form>
        </div>
    </div>
</div>
    </body>
</html>