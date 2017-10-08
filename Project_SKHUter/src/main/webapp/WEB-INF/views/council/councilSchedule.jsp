<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 가운데 정렬 */
div.col-lg-12 {
	text-align: center;
}
</style>

<body>
<input type="hidden" id="deletesuccess" value="${message}">
<input type="hidden" id="createsuccess" value="${message}">
	<div class="row">
		<div class="col-lg-12">
			<img src="/resources/images/title/council_schedule.png" class="page-header" style="width: 20%;">
		</div>
	</div>
	<div class="col-lg-12">
	<div style="margin-bottom: 10px;">
	<div style="width:45%; text-align:left; display:inline-block;">
	</div>
	<div style="width:45%; text-align: right; display:inline-block;">
	<c:if test="${login.status>=2}">
		<a href="javascript:showModal();">일정등록</a>
	</c:if>
	</div>
	</div>
		<div id="wrapper">
			<div id="page-wrapper">
				<div class="row">
					<div id="top" class="panel panel-default">
						<div class="panel-body">
						<form id="changeDay" action="/council/councilSchedule/changeDate" method="post">
							<div class="row">
								<div style="text-align: center;">
									<button type="button" class="btn btn-default btn-circle" id="yearPrev">＜</button>
									<span style="font-size:15px"><label>${currentY }</label><label style="display:inline-block">년</label></span>
									<input type="hidden" id="changeYear" name="changeYear">
									<button type="button" class="btn btn-default btn-circle" id="yearNext">＞</button>
								</div>
							</div>
							<div class="row">
								<div style="text-align: center;">
									<button type="button" class="btn btn-default btn-circle" id="monthPrev">＜</button>
									<span class="huge"> <label>${currentM }</label><label style="display:inline-block">월</label></span>
									<input type="hidden" id="changeMonth" name="changeMonth">
									<button type="button" class="btn btn-default btn-circle" id="monthNext">＞</button>
								</div>
							</div>
						</form>
							<!-- 타임라인 리스트 조회 시작 -->
							<ul class="timeline">
								<c:forEach items="${scheduleList}" var="schedule">
<%-- 								<input type="hidden" id="endDate" value="<fmt: formatDate pattern="yyyy" value="${scheduleList.endDate }"/>"/> --%>
								<form role="form" id="deleteform" method="post" action="/councilSchedule/deleteSchedule">
    								<input type='hidden' name='councilScheduleNo' value ="${schedule.councilScheduleNo}">
    							</form>
    							${schedule.endDate >= thisMonth && schedule.endDate < nextMonth}
    							${schedule.endDate }
    							${thisMonth }
    							${nextMonth }
    							${schedule.endDate >= thisMonth}
    							${schedule.endDate < nextMonth}
    							<c:if test="${schedule.endDate >= thisMonth && schedule.endDate < nextMonth}">
								<c:choose>
								<c:when test="${schedule.endDate <= currentDate }">
								<!-- 오른쪽에 게시글 넣기 -->
								<li>
									<div class="timeline-badge">
										<!-- 타임라인 중앙에 날짜 표시 -->
										<i class="fa fa-check"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<p>
												<small class="text-muted"><i class="fa fa-clock-o"></i>
													${schedule.startDate}~${schedule.endDate}</small>
													<c:if test="${login.status>=2}">
                        								<button id="deleteBtn" class="btn btn-default btn-sm scremoveBtn" type="button">
                        									<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        								</button>
                        							</c:if>
											</p>
										</div>
										<div class="timeline-body">
											<p>${schedule.content}</p>
										</div>
									</div>
								</li>
								</c:when>
								<c:otherwise>
								<li class="timeline-inverted">
									<div class="timeline-badge">
										<!-- 타임라인 중앙에 날짜 표시 -->
										<i class="fa fa-check"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<p>
												<small class="text-muted"><i class="fa fa-clock-o"></i>
													${schedule.startDate}~${schedule.endDate}</small>
													<c:if test="${login.status>=2}">
                        								<button id="deleteBtn" class="btn btn-default btn-sm scremoveBtn" type="button">
                        									<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        								</button>
                        							</c:if>
											</p>
										</div>
										<div class="timeline-body">
											<p>${schedule.content}</p>
										</div>
									</div>
								</li>
								</c:otherwise>
								</c:choose>
								</c:if>
								</c:forEach>
							</ul>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/stuScheduleModal.jsp" />
<script>
var now = new Date();
var nowChange;
var year = ${currentY};
var mon = ${currentM};
var endDate;
var nowDate;

function showModal() {
	$('div#stuScheduleModal').modal();
	
}

function throwDate(){
       var x = document.getElementById('sinputdate');	//시작날짜
       var y = document.getElementById('einputdate');   //마감날짜
       var start =x.value.replace(/T/g, ' ');
       var end =y.value.replace(/T/g, ' ');
	   $('input#startDate').val(start);
	   $('input#endDate').val(end);
	   console.log(start);
	   console.log(end);
	   
}

//리스트 달력 연도,월 바꾸기
$(document).ready(function() {
	
    console.log(year);
    console.log(mon);
    
    nowChange = year+"-"+mon;
    
    $('label#getYear').text(year);
    $("label#getMonth").text(mon);
    $('#councilNowDate').val(nowChange);
    
    console.log("changeYear:"+$("#changeYear").val());
    console.log("changeMonth:"+$("#changeMonth").val());
    
    $('#yearPrev').on('click',function(){ //이전 연도 계산 버튼
    	var form= $("form#changeDay");
    
    	year -= 1;
    	
    	$("input#changeYear").val(year);
        
        console.log("changeYear:"+$("#changeYear").val());
        console.log("changeMonth:"+$("#changeMonth").val());
        
        form.attr("action", "/council//councilSchedule/changeDate");
        form.submit();
    });
    
    $('#yearNext').on('click',function(){ //다음 연도 계산 버튼
    	var form= $("form#changeDay");
    
    	year += 1;
    	
    	$("input#changeYear").val(year);
        
        console.log("changeYear:"+$("#changeYear").val());
        console.log("changeMonth:"+$("#changeMonth").val());
        
        form.attr("action", "/council//councilSchedule/changeDate");
        form.submit();
    });
    
    $('#monthPrev').on('click',function(){ //이전 달 계산 버튼
    	var form= $("form#changeDay");
    
    	mon -= 1;
    	if(mon == 0){
    		mon = 12;
    		year -= 1;
    		
    		$("input#changeYear").val(year);
    	    $("input#changeMonth").val(mon);
    	    
    	    console.log("changeYear:"+$("#changeYear").val());
    	    console.log("changeMonth:"+$("#changeMonth").val());
    	    
    	    form.attr("action", "/council//councilSchedule/changeDate");
    	    form.submit();
    	}
    	else{
    		$("input#changeYear").val(year);
    	    $("input#changeMonth").val(mon);
    	    
    	    console.log("changeYear:"+$("#changeYear").val());
    	    console.log("changeMonth:"+$("#changeMonth").val());
    	    
    	    form.attr("action", "/council//councilSchedule/changeDate");
    	    form.submit();
    	}
    });
    
    $('#monthNext').on('click',function(){ //다음 달 계산 버튼
    	var form= $("form#changeDay");
    
    	mon += 1;
    	if(mon > 12){
    		mon = 1;
    		year += 1;
    		
    		$("input#changeYear").val(year);
    	    $("input#changeMonth").val(mon);
    	    
    	    console.log("changeYear:"+$("#changeYear").val());
    	    console.log("changeMonth:"+$("#changeMonth").val());
    	    
    	    form.attr("action", "/council//councilSchedule/changeDate");
    	    form.submit();
    	}
    	else{
    		$("input#changeYear").val(year);
    	    $("input#changeMonth").val(mon);
    	    
    	    console.log("changeYear:"+$("#changeYear").val());
    	    console.log("changeMonth:"+$("#changeMonth").val());
    	    
    	    form.attr("action", "/council//councilSchedule/changeDate");
    	    form.submit();
    	}
    });
});

$('.scremoveBtn').on('click',(function() {
	var link = $("form#deleteform");
	console.log('link');
	 swal({
           title: '삭제 하시겠습니까?',
           text: "",
           type: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: 'YES',
           cancelButtonText: 'NO'
        }).then(function (){
        	var form = link;
			var arr = [];
			form.attr("action", "/council/councilSchedule/deleteSchedule");
			form.submit();
			link = '';
        })
}));

$('#registerBtn').on('click',(function() {	
        	var form = $("form#scheduleForm");
        	var arr = [];
        	console.log(form);
        	form.attr("action", "/council/councilSchedule/registSchedule");
			form.submit();
			link = '';
    
}));

$(function(){
	var message = $('#createsuccess').val();
	if (message == 'createsuccess') {
		swal(     
	     		 '',
	     	     '등록이 완료되었습니다.',
	     	     'success'
	     		)
	}
	});
$(function(){
	var message = $('#deletesuccess').val();
	if (message == 'deletesuccess') {
		swal(     
	     		 '',
	     	     '삭제가 완료되었습니다.',
	     	     'success'
	     		)
	}
	});
</script>

</body>

