<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- card Infomation Page : jhy -->
<script type="text/javascript">
	function cardKeywordEditForm(t){
		window.open('editCardForm?c_no='+t,'','width=400,height=600');
	}
	function cardDelete(t){
		var f = confirm('Are you sure you want to delete the card?');
		if(f){
			location.href='deleteCard?c_no='+t;
		}
	}
	$(function(){
		$('button.xxx').mouseover(function(e){
			var c = this;
			var c_no = c.children[0].value;
			 $.ajax({
				type:"POST",
				url:"keywordLoader",
				dataType:"JSON",
				async:true,
				data:{"c_no":c_no},
				success:function(data,status,jqXHR){
					var keywordList=data.keyword.split("`");
					var length = data.keyword.replace(/`/g,", ").length;
					var text = data.keyword.replace(/`/g,", ").substring(0,length-2);
					$(c).popover({
			                content:text
						}
					);
				},
				error:function(jqXHR,textStatus,errorThrown){
					alert(jqXHR.status);
				}
			});
		});
	});
</script>
<div class="body">
	<section class="content">
		<ol class="breadcrumb">
			<li class="active"><a href="index"><i class="fa fa-home fa-fw"></i> Home</li></a>
			<li class="active">Card Infomation</li>
		</ol>
		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Card Information</h3>
				<p class="header-info">The card you registered list</p>
			</div>
		</div>
		<!-- CONTENT -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-12">
					<h3>My Card List</h3>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Company</th>
								<th>keyWord</th>
								<th width="40px;">MainCard</th>
								<th>SMS</th>
								<th style="width: 80px;"></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="arr" items="${cardList}">
							<tr>
								<td>${arr.c_name }</td>
								<td><a href="#">${arr.c_company }</a></td>
								<td class="yyy">
								<button type="button" class="xxx btn label label-success"  style="font-size: 10px; padding: 3px 16px;">Show
									<input type="hidden" value="${arr.c_no }" name="c_no" id="c_no"/>
									<!-- data-content="" -->
								</button>
								
								<!-- <span class="xxx label label-success" id="keyordView">keyword
								</span> --></td>
								<td style="padding-left: auto;">
									<c:choose>
										<c:when test="${arr.c_maincard==1 }">
											<i class="fa fa-check"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-times"></i>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
								<c:choose>
										<c:when test="${arr.c_sms_receive==1 }">
											<i class="fa fa-check"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-times"></i>
										</c:otherwise>
									</c:choose></td>
								<td><a href="#" onclick="javascript:cardKeywordEditForm(${arr.c_no})">Edit</a> 
								<a href="#" onclick="javascript:cardDelete(${arr.c_no})"">Delete</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<!-- <ul class="pagination pagination-sm">
						<li class="disabled"><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul> -->
				</div>
			</div>
		</div>
		<!-- END: CONTENT -->
	</section>
</div>
