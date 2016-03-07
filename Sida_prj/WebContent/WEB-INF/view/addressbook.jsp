<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
function addressEditForm(t){
	window.open('editAddressBookForm?ad_no='+t,'','width=400,height=600');
}
function addressdelete(t){
	var f = confirm('Do you want to remove this Address at the list?');
	if(f){
		location.href='deleteAddress?ad_no='+t;
	}
}
function addressAddForm(){
	window.open('addressBookAddForm','','width=400,height=600');
}
/* 
$(function(){
}); */

$(function(){
	 $('.aimage').hide();
	 $('.bimage').show();
	 $('.aimage').bind('load', function() {
	    	$(this).show();
	    	$(this).next().hide();
	});
});
		
		
	   



</script>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div class="body">
	<section class="content">
		<ol class="breadcrumb">
			<li class="active"><a href="index"><i class="fa fa-home fa-fw"></i> Home</li></a>
			<li class="active">Address Book</li>
		</ol>

		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Address Book</h3>
				<p class="header-info">Smartly address book management for your
					Life</p>
			</div>
		</div>
		<!-- CONTENT -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-5" style="margin-left: 5%; margin-right: 5%"></div>
				<div class="col-md-7">
					<form action="searchAddress" method="post" id="search_address_form"
						name="c">
						<div class="radiobox" id="radiobox">
							<label for="exampleInputEmail1" style="font-size: 18px">Search</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <label> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="1"
								checked="checked"> company
							</label>&nbsp;&nbsp;&nbsp; <label> <input type="radio"
								name="optionsRadios" id="optionsRadios2" value="2"> name
							</label>&nbsp;&nbsp;&nbsp; <label> <input type="radio"
								name="optionsRadios" id="optionsRadios3" value="3">
								number
							</label> <input type="text" class="form-control" name="s_text"
								placeholder="please type name or phone number for search"
								value="">
						</div>
						<button type="submit" id="submit-button">
							<span>Search</span>
						</button>
					</form>
					<h3>
						List of address
						<button class="btn btn-success btn-xs" type="button"
							style="font-size: 12px; left: 0px;"
							onclick="javascript:addressAddForm()">Add address</button>
					</h3>
					<table class="table table-striped table-hover">
						<tbody>
							<c:forEach var="arr" items="${addressBookList}" varStatus="status">
								<tr>
									<td width="150px" rowspan="6">
										
										<img class="aimage" src="getAddressBookImage/${arr.ad_no }" alt="" class="img-circle" style="width: 140px; height: 140px;"/>
										<img class="bimage" src="img/customImage/giphy.gif" alt="" class="img-circle" style="width: 140px; height: 140px;"/><br />
										<br />
										
									</td>
								</tr>
								<tr>
									<td style="text-align: left;" width="270dp">
										${arr.ad_name}</td>
									<td style="padding-right: 3%;" width="150px"><span>
											${arr.ad_company }</span></td>
								</tr>
								<tr>
									<td style="text-align: left;">Phone ${arr.ad_hnumber }</td>
								</tr>
								<tr>
									<td style="text-align: left;">Email ${arr.ad_email }</td>
								</tr>
								<tr>
									<td style="text-align: left;">Address ${arr.ad_address }</td>
								</tr>
								<tr>
									<td colspan="2">
										<button class="btn btn-success btn-xs" type="button"
											onclick="javascript:addressEditForm(${arr.ad_no})">Edit</button>

										<button class="btn btn-success btn-xs" type="button"
											onclick="javascript:addressdelete(${arr.ad_no})">Remove</button>
										<button class="detailBtn btn btn-success btn-xs" type="button"
											data-toggle="collapse" data-parent="#accordion"
											name="toggle-btn" data-target="#addrSpan${arr.ad_no }">Detail</button>
										
										<div class="panel-collapse collapse" id="addrSpan${arr.ad_no }">
											<div class="panel-body" align="left">
												<form role="form" id="addrForm">
													<div>Mobile ${arr.ad_mnumber }</div>
													<div>Extension Number ${arr.ad_cnumber }</div>
													<div>Memo ${arr.ad_memo }</div>
												</form>
											</div>
										</div>
									</td>
								</tr>
								<!-- <tr class="panel-collapse collapse" id="addrSpan">
									<td class="panel-body">
										<form role="form" id="addrForm">
											<div>주소, 메모</div>
										</form>
									</td>
								</tr> -->
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- END: CONTENT -->
	</section>
</div>