<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
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
				
				$('.label-primary').html(responsedata);
				if (responsedata == 0)
					$('.label-primary').html('0');
			}
		});
	});
</script>
<div class="navbar navbar-default navbar-static-top navbar-main" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="index"><i class="fa fa-html5"></i> Sida</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
        <li class="visible-xs">
            <a href="#" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </a>
        </li>
        <li class="dropdown notification">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="label label-danger arrowed arrow-left-in pull-right">${head_nav_moneyList_size }</span>
                <i class="fa fa-bell"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li>
                	<c:forEach var="arr" items="${head_nav_moneyList}">
		                    <a href="#">
		                        <i class="fa fa-bell pull-left"></i>
		                        <span class="time">${arr.mb_date_result}</span>
		                        <p><span style="display:inline-block; width:75px;"><i class="fa fa-fw fa-krw" style="color: gray; font-size: 10px;"></i><fmt:formatNumber value="${arr.mb_outgo }" type="number" /> </span> <span><span style="margin-left: 5%;">${arr.c_name }</span></span> </p>
		                    </a>
                    </c:forEach>
                    <!--  <a href="#">
	                        <i class="fa fa-bell pull-left"></i>
	                        <span class="time">13 min. ago</span>
	                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy et dolore.</p>
	                 </a> -->
                </li>
                <li class="open-section">
                    <a href="#">View All Notifications</a>
                </li>
            </ul>
        </li>
        <li class="dropdown notification">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="label label-primary arrowed arrow-left-in pull-right"></span>
                <i class="fa fa-inbox"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li>
           		<c:forEach var="arr" items="${scList}">
                    <a href="calendar">
                        <!-- <img src="img/users/alex.jpg" alt="alex" class="img-avatar pull-left" /> -->
                        <span class="time">${arr.s_end}</span>
                        <p>${arr.s_title}</p>
                        <!-- <p>Stet clita kasd gubergren, no sea takimata Lorem ipsum dolor sit amet.</p> -->
                    </a>
                </c:forEach>
                </li>
              <!--   <li>
                    <a href="#">
                        <img src="img/users/fabbian.jpg" alt="fabbian" class="img-avatar pull-left" />
                        <span class="time">13 min. ago</span>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy et dolore.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="img/users/lex.jpg" alt="lex" class="img-avatar pull-left" />
                        <span class="time">17 min. ago</span>
                        <p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="img/users/lex.jpg" alt="lex" class="img-avatar pull-left" />
                        <span class="time">23 min. ago</span>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco ut aliquid ex ea commodi consequat.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="img/users/molly.jpg" alt="molly" class="img-avatar pull-left" />
                        <span class="time">26 min. ago</span>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor et dolore magna aliqua.</p>
                    </a>
                </li>
                <li class="open-section">
                    <a href="#">View All Messages</a>
                </li> -->
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle avatar pull-right" data-toggle="dropdown">
                <img src="${sessionScope.sMember.m_image }" class="img-avatar" />
                <span class="hidden-small">${sessionScope.sMember.m_name }<b class="caret"></b></span>
            </a>
            <ul class="dropdown-menu pull-right">
                <li><a href="accountSetting"><i class="fa fa-gear"></i>Account Settings</a></li>
                <li><a href="profile"><i class="fa fa-user"></i>My Profile</a></li>
                <li class="divider"></li>
                <li><a href="logout"><i class="fa fa-sign-out"></i>Logout</a></li>
            </ul>
        </li>
    </ul>

</div>
