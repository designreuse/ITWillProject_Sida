<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	.form-inline .form-group input {
		width:180px;
	}
	.form-inline .form-group .control-label1 {
		width:40px;
	}
	.form-inline .form-group .control-label {
		width:80px;
	}
	.fc-header  {
		text-align: center;
	}
	.fc-header .fc-header-left {
    	float: left;
	}
	
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#calendar").fullCalendar({
		header : {
			left : "prevYear, today, nextYear", // 전년, 오늘, 내년
			center : "prev, title, next", // 전월, 타이틀, 다음월
			right : "month, agendaWeek, agendaDay" // 월간, 주간, 일간
		},
		slotMinutes: 15,	// agenda view 시간 간격
		selectable : true, // 선택가능여부
		//selectHelper : true, 
		lazyFetching : false,
		timeFormat: {
	          agenda: 'H:mm{ - H:mm}',
	          '' 	: 'H:mm{ - H:mm}'
	    },  
		
		select : function(start, end, allDay) {
			var title = prompt("Event Title:");
			var eventData;
			if (title) {
				eventData = {
					title : title,
					start : start,
					end : end,
					allDay : allDay
				};
				$('#modalTitle').val(eventData.title);
				$('#start').val($.fullCalendar.formatDate(eventData.start, "yyyy-MM-dd"));
				$('#end').val($.fullCalendar.formatDate(eventData.end, "yyyy-MM-dd"));
				$('#startTime').val(null);
				$('#endTime').val(null);
				$('#memo-txt').val('');
				if(eventData.allDay == false){
					$('#startTime').val($.fullCalendar.formatDate(eventData.start, "HH:mm"));
					$('#endTime').val($.fullCalendar.formatDate(eventData.end, "HH:mm"));
					$('#eventAllDay').val(eventData.allDay);
				}
				$('input:radio[value=99]').parent().addClass('checked');	// 반복 타입 체크 (<span>태그에 "checked" class 추가)
				$('.removeBtn').attr('disabled', true);	// 달력에서 날짜 선택 시 삭제버튼은 비활성 ( 신규 이벤트 입력 시 )
				$('#fullCalModal').modal('show');
			}
			$('#calendar').fullCalendar('unselect');
		},
		
		eventClick : function(event, jsEvent, view) {
			$('.removeBtn').attr('disabled', false);	
			$('#modalTitle').val(event.title);
			$('#start').val($.fullCalendar.formatDate(event.start, "yyyy-MM-dd"));	// fullcalendar 시간 format 설정
			$('#end').val($.fullCalendar.formatDate(event.end, "yyyy-MM-dd"));
			$('#startTime').val(null);	// 기본으로 시간 값은 null (allDay)
			$('#endTime').val(null);
			$('#memo-txt').val(event.memo);
			$('#eventId').val(event.id);	// 이벤트 저장 시 필요한 primary 값 히든으로 저장(s_no)
			$('#eventAllDay').val(event.allDay);	// allday checkbox 설정 시 필요한 allday 값 히든으로 저장
			
			if(event.allDay == false){	// allday 이벤트가 아닌 경우 시간 값 표시
				$('#startTime').val($.fullCalendar.formatDate(event.start, "HH:mm"));
				$('#endTime').val($.fullCalendar.formatDate(event.end, "HH:mm"));
			} 
			
			if(event.loopType != 99 && event.color == '#FF9933'){	// 반복 일정의 경우 전체 시작, 종료일이 나오게 설정
				$('#start').val(event.f_start.split(' ')[0]);
				$('#startTime').val(event.f_start.split(' ')[1]);
				$('#end').val(event.f_end.split(' ')[0]);
				$('#endTime').val(event.f_end.split(' ')[1]);
			}
			$('input:radio[value="'+ event.loopType +'"]').parent().addClass('checked');	// 반복 타입 체크 (<span>태그에 "checked" class 추가)
				
			$('#fullCalModal').modal('show');
		},
		
		 /* 
		editable : true, // 이벤트 수정가능여부
		
		eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
			var start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd HH:mm");
			var end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd HH:mm");
			if(event.allDay == false){
				event.allDay = 'f';
			} else {
				event.allDay = 't';
				start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd");
				end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd");
			}
			console.log(end);
	        if (!confirm("is this okay?")) {
	            revertFunc();
	        } else {
	        	$.ajax({
		        	url : 'save',
		        	type : 'POST',
		        	data : {'s_no' : event.id ,
		        			's_start' : start,
		        			's_end' : end,
		        			's_title' : event.title,
		        			's_memo' : event.memo,
		        			's_allday' : event.allDay,
		        			's_looptype' : event.loopType}
		        });	 
	        	setTimeout(function(){
	        		
	            	$('#calendar').fullCalendar('refetchEvents');	// 달력 다시 그리기 (refresh) 
	            }, 2000);
	        } 
		},  */
	
		eventRender: function(event, element) { 
			if (event.allDay === 'false') {	// allday 값 재설정
				event.allDay = false;
			} 
		},
		
		eventDataTransform : function(event){
			if (event.allDay === 'false') {	// allday 값 재설정
				event.allDay = false;
			} 
			if(event.loopType != 99 && event.color != '#FF9933' ){	// 반복일정의 경우, 투명하게 변경 
				//event.color = '#FFFFFF';
				event.color = 'rgba(63, 191, 191, 0)';
				//$('#calendar').fullCalendar('removeEvents', id);	// 지우는건 전체 다 지워져서 안됌
			}
			return event;
		},
		
		events : {			//이벤트 소스
			url : 'selectById',
			success : function(data){	// 반복 일정 그리기 (달이 넘어가는 경우 문제 생김)
				for(i = 0 ; i < data.length ; i++ ){
					if(data[i].loopType != 99) {
						var startArr = data[i].start.split('-');	//날짜, 시간 분리
						var year = startArr[0];	// 년
		                var month = startArr[1];	// 월
	            		var day = startArr[2].split(' ');	// 일
	            		
	            		var endArr = data[i].end.split(' ');	// 종료일 (시간 제외)
	            		
	            		var j = parseInt(data[i].loopType); 
	            		var loop1 = data[i].start.split(' ')[0]; // 시작일 2016-02-01
	            		
	            		while(loop1 <= endArr[0]){	// 반복일이 종료일 전 까지
	            			var startloop = loop1
	            			var endloop = loop1
	            			if(data[i].allDay == 'false'){
		            			startloop = loop1 + ' ' + day[1];	// 날짜 + 시간
			                    endloop = loop1 + ' ' + endArr[1];	// 날짜 + 시간
	            				
	            			}
	            			console.log(data[i].title +':::' + startloop);
			                $('#calendar').fullCalendar("renderEvent", {id	  : data[i].id,
			                											title : data[i].title, 
			                											start : startloop, 
			                											end   : endloop,
			                											f_start : data[i].start,// 전체 일정 시작일
			                											f_end : data[i].end,	// 전체 일정 종료일
			                											allDay: data[i].allDay,
			                											loopType: data[i].loopType,
			                											memo  : data[i].memo,
			                											color : '#FF9933'});
		                    if(data[i].loopType == 30) {	// 매월 반복일 경우 월 + 1
		                    	month = month * 1 + 1;
	            				if(month < 10) {
	            					month = '0' + month *1;
	            				}
	            				if(month > 12){
	            					year = year*1 + 1;
	            					month = '01';
	            				}
	            				loop1 = year + '-' +  month + '-' + day[0] ;
	            				
		                    } else {	// 나머지 반복
		            			var loopDay = (loop1.split('-')[2] *1 + j);
		            			
		            			if(loopDay > 30){
		            				var t = Math.floor(loopDay / 30);
		            				if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
			            				loopDay = loopDay*1 - 31;	// 다음 달 넘어가는 일 계산
			            			}
		            				if(month == 4 || month == 6 || month == 9 || month == 11  ){
			            				loopDay = loopDay*1 - 30;	// 다음 달 넘어가는 일 계산
			            			}
		            				if(month == 2){
		            					if((year % 4) == 0) loopDay = loopDay*1 - 29;
		            					else loopDay = loopDay*1 - 28;
		            				}
		            				month = month*1 + t;	// month +
		            			}
		                   
		            			if(loopDay < 10){
		            				loopDay = '0'+loopDay;
		            			}
		            			if(month < 10){
		            				month = '0' + month *1;
		            			}
		            			loop1 = year + '-' +  month + '-' + loopDay ;
		                    } //else if
	            		}//while
					}//if
				}//for
			}//function
		}
 	});
 	
 	$('#fullCalModal').on('show.bs.modal', function (event) {	// modal('show') 할 때 checkbox 체크용 
  		var modal = $(this)
  		modal.find('#alldaychk').prop('checked',true);
  		modal.find('#alldaychk').parent().addClass('checked');	// jquery Uniform 플러그인 때문에 (checkbox를 자동으로 <span>으로 감싼다 : <span>태그에 "checked" class 추가) 
  		if($('#eventAllDay').val() == 'false' ){ // allday가 아닌 경우
			modal.find('#alldaychk').prop('checked',false);
	  		modal.find('#alldaychk').parent().removeClass('checked');	// class 제거
		}
	});
 	
 	$('#fullCalModal').on('hide.bs.modal', function (event) {	// modal(hide) 할 때 radio 버튼 초기화
 		var modal = $(this)
 		modal.find('input:radio').parent().removeClass('checked');	// class 제거
 	});
	
	$("#alldaychk").change(function(){	// allday checkbox 누르면 시간 입력 값 제거
		if($("#alldaychk").is(":checked")){
			$('#startTime').val(null);
			$('#endTime').val(null);
			$('#startTime').attr('disabled', true);
			$('#endTime').attr('disabled', true);
		} else {
			$('#startTime').attr('disabled', false);
			$('#endTime').attr('disabled', false);
		}
	}); 
 	
 	$('.removeBtn').click(function (event) {	// 이벤트 삭제 버튼
 		var result = confirm("Are you sure for removing this event?")
 		if(result){
	        var id = $('#eventId').val();
	        $.ajax({
	        	url : 'delete',
	        	type : 'POST',
	        	data : {'s_no':id}
	        });
	        //$('#calendar').fullCalendar('removeEvents', id);
	        $('#fullCalModal').modal('hide');
	        //location.reload();
	        $('#calendar').fullCalendar('refetchEvents');
 		}
    });

    $('.saveBtn').click(function (event) {	// 이벤트 저장 버튼
        var id = $('#eventId').val();
        var title = $('#modalTitle').val();
        var start = $('#start').val() + ' ' + $('#startTime').val(); // 2016-01-10 15:00
        var end = $('#end').val() + ' ' + $('#endTime').val();
        var memo = $('#memo-txt').val();
        var looptype = $('input[type="radio"]:checked').val();
        var allday = 'f';
        if(looptype == null){
        	looptype = 99;
        }
       
	   	if ($('#alldaychk').is(':checked')){ // allday 이벤트인 경우 설정 
	   		allday = 't';
	   		start = $('#start').val();
	   		end = $('#end').val();
        }
        $.ajax({
        	url : 'save',
        	type : 'POST',
        	data : {'s_no' : id ,
        			's_start' : start,
        			's_end' : end,
        			's_title' : title,
        			's_memo' : memo,
        			's_allday' : allday,
        			's_looptype' : looptype}
        });
        $('#fullCalModal').modal('hide');
        //location.reload();
       	setTimeout(function(){
        	$('#calendar').fullCalendar('refetchEvents');	// 달력 다시 그리기 (refresh) 
        }, 20);
    });
});
</script>

<!-- BODY -->
<div class="body">
	<section class="content">

		<ol class="breadcrumb">
			<li><a href="index"><i class="fa fa-home fa-fw"></i>Home</a></li>
			<li class="active">Calendar</li>
		</ol>

		<div class="header">
			<div class="col-md-12">
				<h3 class="header-title">Calendar</h3>
				<p class="header-info">Easily organize your schedule</p>
			</div>
		</div>
		
		<!-- CONTENT -->
		<div class="main-content">
		
			<div class="row">
				<div class="col-md-12">
					<div id="calendar"></div>
				</div>
				
				<!-- primary modal  -->
				<div id="fullCalModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
						
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span> 
								</button>
								<!-- <h4 id="modalTitle" class="modal-title"></h4> -->
								<input type="text" class="modal-title" id="modalTitle" >
							</div>
							
							<div id="modalBody" class="modal-body">
								<form class="form-inline" >
									<div class="form-group">
										<label for="start" class="control-label1">Start : </label>
										<input type="date" class="form-control" id="start"></span>
									</div>
									<div class="form-group" >
										<label for="startTime" class="control-label">Start Time:</label>
										<input type=time class="form-control" id="startTime">
									</div>
								</form>
								<form class="form-inline" >
									<div class="form-group">
										<label for="end" class="control-label1">End   : </label>
										<input type="date" class="form-control" id="end">
									</div>
									<div class="form-group">
										<label for="endTime" class="control-label">End Time:</label>
										<input type="time" class="form-control" id="endTime">
									</div>
								</form>
								<br>
								<form class="form-inline" width= "auto">
									All Day : 
									<label>
										<input type="checkbox" id="alldaychk" >
									</label>
								</form>
									<div class="radiobox">
				                        Repeat :  
				                        <label>
											<input type="radio" name="optionsRadios" id="opt99" value="99">None &nbsp;
				                        </label>
				                        <label>
				                            <input type="radio" name="optionsRadios" id="opt1" value="1">Day &nbsp;
				                        </label>
				                        <label>
				                            <input type="radio" name="optionsRadios" id="opt7" value="7">Week &nbsp;
				                        </label>
				                        <label>
				                            <input type="radio" name="optionsRadios" id="opt14" value="14">Two week &nbsp;
				                        </label>
				                        <label>
				                            <input type="radio" name="optionsRadios" id="opt30" value="30">Month 
				                        </label>
				                	</div>
									<br>
								<form class="form-group" >
									<label for="memo-txt" class="control-label">Memo</label>
									<textarea class="form-control" id="memo-txt"></textarea>
								</form>
							</div>
							
							<div class="modal-footer">
								<input type="hidden" id="eventId"/>
								<input type="hidden" id="eventAllDay"/>
								<button type="button" class="btn btn-primary saveBtn" >Save</button>
								<button type="button" class="btn btn-primary removeBtn">Remove Event</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end modal  -->
				
			</div>
		</div>
		<!-- END: CONTENT -->
	</section>
</div>
<!-- END: BODY -->
