<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script type="text/javascript">
	$(function() {		// 일정알람 넣는 부분 (현재 일 보다 이후 일정 카운트)
		var date = new Date, 
		d = date.getDate(), 
		m = date.getMonth() + 1, //0~11
		y = date.getFullYear();
		var today = null
			
		if (m < 10) {
			m = '0' + m;
		} 
		if (d < 10) {
			d = '0' + d;
		}
		today = y + '-' + m + '-' + d;
		
		$.ajax({
			url : 'count',
			type : 'POST',
			data : {
				's_end' : today
			},
			success : function(responsedata, status, jqXHR) {
				
				$('.badge-danger').html(responsedata);
				if (responsedata == 0)
					$('.badge-danger').html('');
			}
		});
	});
</script> -->
<aside class="sidebar">
    <ul class="nav nav-stacked">
    <li class="active" ><a href="index"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a></li>
    
	<li  ><a href="calendar"><i class="fa fa-calendar fa-fw"></i>Calendar <!-- <span class="badge badge-danger"></span> --></a></li>
    
    <!-- Card start: jhy -->
     <li class="menu ">
            <a href="#" class="menu-toggle"><i class="glyphicon glyphicon-credit-card"></i>Card<i class="caret"></i></a>
            <ul class="submenu">
                <li  ><a href="cardInfomation"><i class="fa fa-credit-card"></i><span>Card Infomation</span></a></li>
                <li  ><a href="registrationForm"><i class="glyphicon glyphicon-floppy-saved"></i><span>Registration</span></a></li>
            </ul>
     </li>
   <!-- Card end : jhy -->
   
    <!-- Money Book start: jsh -->
    <li class="menu ">
            <a href="#" class="menu-toggle"><i class="glyphicon glyphicon-book"></i>Money Book<i class="caret"></i></a>
            <ul class="submenu">
                <li  ><a href="moneyBookInsert"><i class="glyphicon glyphicon-plus-sign"></i><span>Add</span></a></li>
                <li  ><a href="expense"><i class="glyphicon glyphicon-usd"></i><span>Expense</span></a></li>
               <!--  <li  ><a href="budget"><i class=""></i><span>budget</span></a></li>
                <li  ><a href="dataStatistic"><i class=""></i><span>Data statistic</span></a></li>-->
                <!-- <li  ><a href="dataChart"><i class=""></i><span>테스트</span></a></li> -->
                
            </ul>
     </li>
    <!-- Money Book end:jhy  -->
    <!-- Address Book code start:jhy -->
     <li >
            <a href="addressbook" class="menu-toggle"><i class="fa fa-phone"></i>Address Book</a>
            <!-- <ul class="submenu">
                <li  ><a href="addressbook"><i class="fa fa-list-ul fa-fw"></i><span>AddressBook</span></a></li>
            </ul> -->
     </li>
    <!-- Address Book end:jhy  -->
    
    <!-- Account Setting star:jhy  -->
    <li class="menu ">
           <a href="#" class="menu-toggle"><i class=" glyphicon glyphicon-user"></i>My Account<i class="caret"></i></a>
            <ul class="submenu">
                <li  ><a href="accountSetting"><i class="fa fa-user fa-fw"></i><span>Account Setting</span></a></li>
                <li  ><a href="profile"><i class="fa fa-pencil"></i><span> My Profile</span></a></li>
                <li  ><a href="logout"><i class="fa fa-sign-in fa-fw"></i><span>Logout</span></a></li>
            </ul>
     </li>
    <!--Account Setting end:jhy  -->
    
       <!--  <li class="menu ">
            <a href="#" class="menu-toggle"><i class="fa fa-sort-alpha-asc fa-fw"></i>Look &amp; Feel<i class="caret"></i></a>
            <ul class="submenu">
                <li  ><a href="typography"><i class="fa fa-sort-alpha-asc fa-fw"></i><span>Typography</span></a></li>
                <li  ><a href="grid.html"><i class="fa fa-th-large fa-fw"></i><span>Grid</span></a></li>
                <li  ><a href="topnav.html"><i class="fa fa-dashboard fa-fw"></i>Top Navigation</a></li>
                <li  ><a href="search_results.html"><i class="fa fa-search fa-fw"></i><span>Search Results</span></a></li>
            </ul>
        </li> -->
       <!--  <li class="menu " >
            <a href="#" class="menu-toggle"><i class="fa fa-cogs fa-fw"></i>UI Elements<i class="caret"></i></a>
            <ul class="submenu">
                <li  ><a href="ui_components.html"><i class="fa fa-wrench fa-fw"></i><span>Components</span></a></li>
                <li  ><a href="ui_buttons.html"><i class="fa fa-hand-o-up fa-fw"></i><span>Buttons &amp; Labels</span></a></li>
                <li  ><a href="ui_nested_lists.html"><i class="fa fa-list-ul fa-fw"></i><span>Nested Lists</span></a></li>
                <li  ><a href="ui_images.html"><i class="fa fa-picture-o fa-fw"></i><span>Images &amp; Icons</span></a></li>
                <li  ><a href="wysiwyg_editor.html"><i class="fa fa-edit fa-fw"></i>Wysiwyg Editor</a></li>
                <li  ><a href="google_maps.html"><i class="fa fa-map-marker fa-fw"></i>Google Maps</a></li>
            </ul>
        </li> -->
        <!-- <li class="menu ">
            <a href="#" class="menu-toggle"><i class="fa fa-table fa-fw"></i><span>Tables <i class="caret"></i></span></a>
            <ul class="submenu">
                <li  ><a href="tables.html"><i class="fa fa-table fa-fw"></i>Default Tables</a></li>
                <li  ><a href="datatables.html"><i class="fa fa-table fa-fw"></i>Data Tables</a></li>
            </ul>
        </li> -->
       <!--  <li  ><a href="forms.html"><i class="fa fa-credit-card fa-fw"></i>Forms</a></li>
        
        <li  ><a href="charts.html"><i class="fa fa-bar-chart-o fa-fw"></i>Charts</a></li>
        <li  ><a href="gallery.html"><i class="fa fa-picture-o fa-fw"></i>Gallery</a></li>
        <li class="menu ">
            <a href="#" class="menu-toggle"><i class="fa fa-bell fa-fw"></i><span>Error Pages <i class="caret"></i></span></a>
            <ul class="submenu">
                <li  ><a href="error_404.html"><i class="fa fa-laptop fa-fw"></i><span>Error 404</span></a></li>
                <li  ><a href="error_500.html"><i class="fa fa-laptop fa-fw"></i><span>Error 500</span></a></li>
            </ul>
        </li>
        
        <li class="menu ">
            <a href="#" class="menu-toggle"><i class="fa fa-sitemap fa-fw"></i><span>Other <i class="caret"></i></span></a>
            <ul class="submenu">
                <li  ><a href="profile.html"><i class="fa fa-user fa-fw"></i><span>User Profile</span></a></li>
                <li  ><a href="logout"><i class="fa fa-sign-in fa-fw"></i><span>Logout</span></a></li>
                <li  ><a href="register.html"><i class="fa fa-check-square-o fa-fw"></i><span>Register</span></a></li>
            </ul>
        </li>-->
    </ul>
</aside>