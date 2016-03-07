<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		/* $('.fileinput-preview fileinput-exists thumbnail children[0]').change(function(){
			alert($('.fileinput-preview fileinput-exists thumbnail').children[0]);
		}) */;

		$('#pwdForm').submit(function(e) {
			var asIsPwd = $('#asIsPwd').val();
			var toBePwd1 = $('#toBePwd1').val();
			var toBePwd2 = $('#toBePwd2').val();
			if (toBePwd1 != toBePwd2) {
				alert('새로운 비밀번호를 확인해주세요');
			} else {
				$.ajax({
					type : "POST",
					url : "pwdChange",
					dataType : 'JSON',
					async : true,
					data : {
						"asIsPwd" : asIsPwd,
						"toBePwd" : toBePwd1
					},
					success : function(data, status, jqXHR) {
						if (data.pwdEqul) {
							alert('비밀번호 변경이 완료되었습니다.');
							$('#pwdSpan').collapse('hide');
						} else {
							alert('현재 비밀번호가 틀립니다.');
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.status + ':' + textStatus);
					}
				});
			}
			e.preventDefault();
		});

		$('#phoneForm').submit(function(e) {
			var phone = $('#phone').val();
			if (phone == "") {
				alert("연락처 정보를 입력해주세요.");
			} else {
				$.ajax({
					type : "POST",
					url : "phoneRegistration",
					dataType : 'JSON',
					async : true,
					data : {
						"phone" : phone,
					},
					success : function(data, status, jqXHR) {
						if (data.phoneMsg) {
							alert('Phone Registration Success');
							$('#phoneSpan').collapse('hide');
							$('#phoneLocation').text(phone);
						} else {
							alert('Phone Registration Fail');
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.status + ':' + textStatus);
					}
				});
				e.preventDefault();
			}
		});
	});
</script>
<div class="body">
	<section class="content">
		<ol class="breadcrumb">
			<li class="active"><a href="index"><i class="fa fa-home fa-fw"></i> Home</li></a>
			<li class="active">Account Setting</li>
		</ol>
		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">My Account Setting</h3>
				<p class="header-info">Your Infomation registration</p>
			</div>
		</div>
		<!-- CONTENT -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-5" style="margin-left: 5%; margin-right: 5%">
					<!-- E-Mail group : start -->
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label><br />
						${sMember.m_email } <input type="hidden" id="exampleInputEmail1"
							name="email" />
					</div>
					<!-- E-Mail group : end -->

					<!-- Password group : start -->
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label>
						<!-- <button type="button" class="btn btn-success btn-xs" id="pwdChangeBtn" data-toggle="collapse">Change</button> -->
						<button class="btn btn-success btn-xs" type="button"
							data-toggle="collapse" data-parent="#accordion"
							data-target="#pwdSpan" id='pwdChangeBtn'>Change</button>

						<div class="panel-collapse collapse" id="pwdSpan">
							<div class="panel-body">
								<form role="form" id="pwdForm">
									<input type='password' class='btnGroup form-control'
										id='asIsPwd' placeholder='Current Password'
										style="margin-bottom: 6px;"> <input type='password'
										class='btnGroup form-control' id='toBePwd1'
										placeholder='Change password' style="margin-bottom: 6px;">

									<input type='password' class='btnGroup form-control'
										id='toBePwd2' placeholder='Confirm Change password'
										style="margin-bottom: 6px;">
									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
					<!-- Password group : end -->

					<!-- Phone group : start -->
					<div class="form-group">
						<label for="exampleInputPassword1">Phone : </label> <span id="phoneLocation">${sMember.m_phone }</span>
						<!-- <button type="button" class="btn btn-success btn-xs" id="pwdChangeBtn" data-toggle="collapse">Change</button> -->
						<button class="btn btn-success btn-xs" type="button"
							data-toggle="collapse" data-parent="#accordion"
							data-target="#phoneSpan" id='phoneChangeBtn'>Change</button>

						<div class="panel-collapse collapse" id="phoneSpan">
							<div class="panel-body">
								<form role="form" id="phoneForm">
									<input type="text" id="phone" class="btnGroup form-control"
										placeholder="Phone Number" data-mask="999-9999-9999"
										style="margin-bottom: 6px;">
									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
					<!-- Phone group : end -->

					<!-- Image group : start -->
					<div class="form-group">
						<form enctype="multipart/form-data" id="imgForm" method="post"
							action="imgRegist">
							<label>Image Upload Widget</label><br />
							<c:if test="${msg!=null }">
								<span style="color: red; font-size: 12px;">${msg }</span>
							</c:if>
							<c:choose>
							<c:when test="${sMember.m_image==null }">
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
										name="userImg" id="uploadFile">
									</span> <a href="#" class="btn btn-info fileinput-exists"
										data-dismiss="fileinput">Remove</a> <br /> <span
										style="color: red; font-size: 10px; font-weight: bold;">Type
										: Only jpg, png, bmp</span> <br /> <br />
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							</c:when>
							<c:otherwise>
								<div class="fileinput fileinput-new" data-provides="fileinput">
								<div class="fileinput-new thumbnail">
									<img src="${sMember.m_image }" style="max-height: 140px;">
								</div>
								<div class="fileinput-preview fileinput-exists thumbnail"
									style="max-width: 200px; max-height: 150px;"></div>
								<div>
									<span class="btn btn-info btn-file"> <span
										class="fileinput-new">Select image</span> <span
										class="fileinput-exists">Change</span> <input type="file"
										name="userImg" id="uploadFile">
									</span> <a href="#" class="btn btn-info fileinput-exists"
										data-dismiss="fileinput">Remove</a> <br /> <span
										style="color: red; font-size: 10px; font-weight: bold;">Type
										: Only jpg, png, bmp</span> <br /> <br />
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							</c:otherwise>
							</c:choose>
						</form>
					</div>
					<!-- Image group : end -->
				</div>
				
				<div class="col-md-5" style="margin-top: 5%;">
					<img class="img-rounded" alt="140x140"
						style="width: 200px; height: 200px; margin-left: 1%;"
						src="img/customImage/blank-profile.png">
				</div>
			</div>
		</div>
		<!-- END: CONTENT -->
	</section>
</div>