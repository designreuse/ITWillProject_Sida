<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script>
	//ctrl+shift+f 로 정렬시 라인정렬로 closeFlag 에러납니다.
	var flag = ${closeFlag};
	if (flag) {
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

</head>
<body style="margin-left: 5%; margin-right: 5%;">
	<h3>Regist</h3>
	<form class="form-horizontal" role="form" action="addAddressBook"
		method="post" enctype="multipart/form-data">
		<input type="hidden" value="" name="ad_no" />
		<div class="main-content">
			<div class="row">
			
				<label for="inputEmail3" class="col-sm-2 control-label">Card</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-new thumbnail"
										style="width: 140px; height: 140px;">
										<img alt=""
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAEYCAYAAACHjumMAAAN9klEQVR4Xu3c96vkdBcH4Ky9Y8GG5Ud7wQJ2/dftKOraEBso9oZrxa4rJy8ZsvG2z6vHjXeegMjeOXtm8uTkQ+ab3D1y7Nix44ONAAECDQJHBEyDqpYECIwCAsYgECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAsYMECDQJiBg2mg1JkBAwJgBAgTaBARMG63GBAgIGDNAgECbgIBpo9WYAAEBYwYIEGgTEDBttBoTICBgzAABAm0CAqaNVmMCBASMGSBAoE1AwLTRakyAgIAxAwQItAkImDZajQkQEDBmgACBNgEB00arMQECAmZlM/DVV18Nn3766XDKKacMZ5999nDttdce6BN+/PHHw2+//bapvfTSS8e/v9y+/fbbsf8PP/wwvnT66acPVVv/HTly5EDvlRQdtv1J9l3tMAiYlU3B0aNHh2PHjo2f6rTTThseeeSRfU/8jz76aHj99ddP2JMbb7xxuOqqqzY/O378+PDiiy9uei93+9RTTx3uu+++4ayzzvpHRQ7b/vyjOFvQTMCs6CB/+OGHwxtvvLH5RGecccbw0EMP7RkwddXy+OOPD3/88ccJe3LzzTcPV1555eZn1bf677Ud5P0SrsO2P8m+q/2fgIA5iZNQofDmm28Ov/zyy/DNN9+M/59vBznhX3311eGzzz77y17MA+bnn38ennzyyaGuYqatvj6deeaZw9dff73nlU/Cc9j2J9l3tTsLCJiTOBm//vrrePUxP/GTgKlweP7558f1mr2uYJZfoS688MLh7rvvHt/qvffeG95+++3N21500UXDHXfcMQbPtCZTvc8///yhAm/aam1l2qbXq36N+3PXXXedxKO83W8tYE7i8f87AVOh9PTTTw8//vjjuAfnnHPOZuG2/jy/gnnhhReGeSDcfvvt46JubcuvWBUS999//9h7Hny1NvPAAw+MofPJJ58Mr7322l+ufC677LL/O2A696fWsWo9y/bvCwiYf9/8hHf87rvvxquPOnErcF566aXNib3XV6QPPvhg/HpVW9XddNNN49+dtnnAPPPMM8P3338/vlTvU0ExX8xdvl4BU1cwyxC5/vrrh6uvvnp49NFHh99//33zXvMrorXuz0531E7yod+KtxcwKzrMy6uJ3QKmguiJJ57YfC2qK5Kqfe655w4UMA8++OC4/jJtuwXQ8sqn7jTVVUpdwUxbBdbDDz883u5ebmvbnxUd6q35KAJmRYf6oCfkyy+/PHzxxRfjJ6+1kXvuuWe8/Vy3hJdXMNWzwmi64ph/1dktYO69997h3HPPHReda3F4ub4zJ1verZq/trb9WdGh3pqPImBWdKgPckLWWkpdWUxfdypczjvvvF0DZnm1s1/AVN9bbrlluOKKK8b32OkZm4ns4osvHu68885dBde4Pys63FvxUQTMig7zfidkLYTWFUXddq6tHqSrB+pqmwdP/fnWW28dLr/88vHqo+7sTE/5HmQNZrlGM39YbuKqr0v1jM5ei6dr3Z8VHfJD/1EEzIoO8X4n5PJqpMKirkgqeOq1+cJr3bqu12t95q233jphkbcWceeLnvstAi9vZRdZ3bWqPntta92fFR3yQ/9RBMyKDvF+J+RuT+3utQu1RvLuu+9ubmFX6MwXeZe3h6fb1FMA1dXSU089teM6zHXXXbfn70qtcX9WdLi34qMImBUd5v1OyFp0rQXb3R7M22lX6ivUl19+OXz++eebl+drLMunfOurTz03UldAtdWdqXrKeKdtp69b87o17s+KDvdWfBQBs6LDvN8JOa21LO/q1Ilez6288847m72p9ZlaqK27THWH6ZVXXtm8VreU6xcb69Z2/XwePnUb+rbbbhtr58/a7MZUC8y10LzTb2KvbX9WdKi35qMImBUd6oOckLt93OnXBqbXp0Xe+nMF0mOPPXbCGk39vEJheTVUvyZwySWXjE8IL5/mveaaa8bX5g/0VZ/dviqtaX9WdJi36qMImBUd7r9zQu72HMy0e3vdbp5qptvOFTrPPvvsZmF4CqPpkfv5ovD0Wl0R1cJv8hVpL/p/cn9WdIi37qMImBUd8uVDcXXC1ol7kH8IanlCzq9gpl18//33x19s3GkNp343qb4a1Xstb3nX37/hhhvGXxOorf7RqlqbmfepfxqiFpSXATN/yO9k7c+KDvHWfRQBs2WHvL4u1aLtTz/9NAZE/crABRdcsOOj/v8FmsO2P/8F8+QzCphESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRgICJuBQTIJAICJhESy0BApGAgIm4FBMgkAgImERLLQECkYCAibgUEyCQCAiYREstAQKRwJ/yWw549DbzngAAAABJRU5ErkJggg==" />
									</div>
									<div class="fileinput-preview fileinput-exists thumbnail"
										style="max-width: 200px; max-height: 150px;"></div>

									<div>
										<span class="btn btn-info btn-file"> <span
											class="fileinput-new">Select image</span> <span
											class="fileinput-exists">Change</span> <input type="file"
											name="cardImg" id="uploadFile">
										</span> <a href="#" class="btn btn-info fileinput-exists"
											data-dismiss="fileinput">Remove</a> <br /> <span
											style="color: red; font-size: 10px; font-weight: bold;">Type
											: Only jpg, png, bmp</span> <br /> <br />
									</div>
								</div>
							</div>
						</div>
				
			
			
				<div class="col-md-6">
					<div class="form-group">

						





						<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Name" value="" name="name">
							</div>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Company</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="company" value="" name="company">
							</div>
						</div>



						<label for="inputEmail3" class="col-sm-2 control-label">Mobile</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Mobile" value="" name="mobile">
							</div>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Home
							Phones</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Home Phones" value=""
									name="home_phones">
							</div>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Extension
							Number </label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Extension Number(회사번호)" value=""
									name="extension_number">
							</div>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Address</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Address" value="" name="address">
							</div>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Email" value="" name="email">
							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">Memo</label>
						<div class="row-span">
							<div class="col-sm-10" style="margin-bottom: 8px;">
								<input type="text" placeholder="Memo" value="" name="memo">
							</div>
						</div>



					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>