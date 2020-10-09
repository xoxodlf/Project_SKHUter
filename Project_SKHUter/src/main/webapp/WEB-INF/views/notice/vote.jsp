<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
    width:55em;
}
.panel-primary > .panel-heading {
    color: #fff;
    background-color: #40596b;
    border-color: #40596b;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
.with-nav-tabs.panel-primary .nav-tabs > li > a,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
    color: #fff;
}
.with-nav-tabs.panel-primary .nav-tabs > .open > a,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
	color: #fff;
	background-color: #2A0066;
	border-color: #2A0066;
}
.with-nav-tabs.panel-primary .nav-tabs > li.active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
	color: #428bca;
	background-color: #fff;
	border-color: #428bca;
	border-bottom-color: transparent;
}
.panel-body{
	height:25em;
}
div.board-btn button {
		width: auto;
		height: auto;
		margin: 0;
	}
	div.board-btn {
		display: inline-block;
		width: 48%;
	}
	div.board-btns div:nth-child(1) {
		text-align: right;
	}
	div.board-btns div:nth-child(2) {
		text-align: left;
	} 
	
	/* 가운데 정렬 */
	div.col-lg-12 {
		text-align: center;
	}
</style>
  
</head>
<body>
<input type="hidden" id="deletesuccess" value="${message}">
<input type="hidden" id="createsuccess" value="${message}">

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<img src="/resources/images/title/vote.png" class="page-header" style="width: 18%;">
		</div>
	</div>
     <div class="col-md-6" style="width:57.25em; margin-left:14.6%;">
            <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                        <ul class="nav nav-tabs" style="background-color:#40596b">
                            <li class="active"><a style="width:27em; font-weight:bold; text-align:center;" href="#tab1primary" data-toggle="tab">진행중인 투표</a></li>
                            <li><a style="font-weight:bold; width:27em;text-align:center;" href="#tab2primary" data-toggle="tab">종료된 투표</a></li>
                       </ul>
                </div>
                <div class="panel-body" style="height:auto;">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary">
                        <c:choose>
            			<c:when test="${empty doingVoteList }">
               			<div style="margin-top: 10%">
                 				 <p style="background-color:white; text-align: center; font-size: 20px;margin-bottom:130px;"> <mark style="background-color:white; ">투표내역이 존재하지 않습니당</mark></p>
               			</div>
               			
            			</c:when>
          				<c:otherwise>
                        <c:forEach items="${doingVoteList}" var="vote">
                        <form role="form" id="deleteform" method="post" action="/notice/vote/delete">
    							<input type='hidden' name='voteNo' value ="${vote.voteNo}"> 
    					</form>  
                        	<div class="alert alert-warning ">
      
                        	<c:if test="${vote.isVote==0}">
                           		<a href="javascript:showModal('${vote.title}','${vote.item1}','${vote.item2}','${vote.item3}','${vote.item4}','${vote.item5}','${vote.item6}','${vote.voteNo}','${vote.content}','${vote.item1Count}','${vote.item2Count}','${vote.item3Count}','${vote.item4Count}','${vote.item5Count}','${vote.item6Count}','${vote.startDate}');">${vote.title}</a>
                        	</c:if>
                        	<c:if test="${vote.isVote>0}">
                           		<a href="javascript:didVote();">${vote.title}</a>
                        	</c:if>	
                        		<div style="float: right;display:inline-block;">
                        		<c:if test="${login.status==3}">
                        		<button id="deleteBtn" class="btn btn-default btn-sm removeBtn" type="button">
                        		<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        		</button>
                        		</c:if>
                        		</div>
                        		
                        	</div>
                        	
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                        
                        </div> 
                        <div class="tab-pane fade" id="tab2primary">
                        <c:choose>
            			<c:when test="${empty doneVoteList}">
            			<div style="margin-top: 10%">
                 				 <p style="background-color:white; text-align: center; font-size: 20px;margin-bottom:130px;"> <mark style="background-color:white; ">투표내역이 존재하지 않습니당</mark></p>
               			</div>
            			</c:when>
          				<c:otherwise>
          				<c:forEach items="${doneVoteList}" var="vote">
          				<form role="form" id="deleteform" method="post" action="/notice/vote/delete">
    							<input type='hidden' name='voteNo' value ="${vote.voteNo}"> 
    					</form>
            			<div class="alert alert-warning ">
                           		<a href="javascript:showDoneModal('${vote.title}','${vote.item1}','${vote.item2}','${vote.item3}','${vote.item4}','${vote.item5}','${vote.item6}','${vote.voteNo}','${vote.content}','${vote.item1Count}','${vote.item2Count}','${vote.item3Count}','${vote.item4Count}','${vote.item5Count}','${vote.item6Count}');">${vote.title}</a>
                        		<div style="float: right;display:inline-block;">
                        		<c:if test="${login.status==3}">
                        		<button id="deleteBtn" class="btn btn-default btn-sm removeBtn" type="button">
                        		<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        		</button>
                        		</c:if>
                        		</div>
                        		
                        	</div>
                        	</c:forEach>
                        </c:otherwise>
                        </c:choose>
<!--                         <div class="alert alert-warning "> -->
<!--                            		<a data-toggle="modal" data-target="#doneVoteModal" class="alert-link"> 과연 꼴뚜기보다 오징어가 맛있을까요???</a> -->
<!--                         	</div> -->
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="board-btns">
        	<c:if test="${login.status>=2}">
				<div class="board-btn" style="width:100%; text-align: center;">
					<button type="button"  onclick="goVoteForm();" class="btn btn-default">투표등록</button>
				</div>
			</c:if>
	    </div>
</div>
        
    <!-- Modal -->
	<jsp:include page="include/doVoteModal.jsp" />
	<jsp:include page="include/doneVoteModal.jsp" />
	<script type="text/javascript">
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
		
		function didVote(){
			 swal({
	               title: '이미 참여한 투표입니다.',
	               text: "",
	               type: 'warning',
	               confirmButtonColor: '#3085d6',
	               confirmButtonText: '확인',
	              
	            });
		}
	
		function showModal(title,item1,item2,item3,item4,item5,item6,voteNo,content,item1Count,item2Count,item3Count,item4Count,item5Count,item6Count,startDate) {
			var now = new Date();
	        console.log('now');
	        var year= now.getFullYear();
	        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	        var hours = now.getHours()>9 ?''+now.getHours():'0'+now.getHours();
	        var min = now.getMinutes();
	        var current_date = year + '-' + mon + '-' + day+' '+hours+':'+min;
			if(startDate>current_date){
				swal({
		               title: '투표가 아직 시작하지 않았습니다.',
		               text: "",
		               type: 'warning',
		               confirmButtonColor: '#3085d6',
		               confirmButtonText: '확인',
		              
		            });
			}else{
			$('div#doVoteModal').modal();
			$('label#title').text(title);
			$('label#item1').text(item1);
			$('label#item2').text(item2);
			$('label#item3').text(item3);
			$('label#item4').text(item4);
			$('label#item5').text(item5);
			$('label#item6').text(item6);
			$('input#item1').val(item1);
			$('input#item2').val(item2);
			if(item3==''){
				$('li#itembox3').css("display","none");
			}else{
				$('li#itembox3').css("display","");
			}
			$('input#item3').val(item3);
			if(item4==''){
				$('li#itembox4').css("display","none");
			}else{
				$('li#itembox4').css("display","");
			}
			$('input#item4').val(item4);
			if(item5==''){
				$('li#itembox5').css("display","none");
			}else{
				$('li#itembox5').css("display","");
			}
			$('input#item5').val(item5);
			if(item6==''){
				$('li#itembox6').css("display","none");
			}else{
				$('li#itembox6').css("display","");
			}
			$('input#item6').val(item6);
			$('input#voteNo').val(voteNo);
			$('label#content').text(content);
			$('input#item1Count').val(item1Count);
			$('input#item2Count').val(item2Count);
			$('input#item3Count').val(item3Count);
			$('input#item4Count').val(item4Count);
			$('input#item5Count').val(item5Count);
			$('input#item6Count').val(item6Count);
			}
		}
		
		
		function showDoneModal(title,item1,item2,item3,item4,item5,item6,voteNo,content,item1Count,item2Count,item3Count,item4Count,item5Count,item6Count) {
			$('div#doneVoteModal').modal();
			$('label#title').text(title);
			$('label#item1').text(item1);
			$('label#item2').text(item2);
			$('label#item3').text(item3);
			$('label#item4').text(item4);
			$('label#item5').text(item5);
			$('label#item6').text(item6);
			$('input#item1').val(item1);
			$('input#item2').val(item2);
			if(item3==''){
				$('div#itembox3').css("display","none");
			}else{
				$('div#itembox3').css("display","");
			}
			$('input#item3').val(item3);
			if(item4==''){
				$('div#itembox4').css("display","none");
			}else{
				$('div#itembox4').css("display","");
			}
			$('input#item4').val(item4);
			if(item5==''){
				$('div#itembox5').css("display","none");
			}else{
				$('div#itembox5').css("display","");
			}
			$('input#item5').val(item5);
			if(item6==''){
				$('div#itembox6').css("display","none");
			}else{
				$('div#itembox6').css("display","");
			}
			$('input#item6').val(item6);
			$('input#voteNo').val(voteNo);
			$('label#content').text(content);
			$('input#item1Count').val(item1Count);
			$('input#item2Count').val(item2Count);
			$('input#item3Count').val(item3Count);
			$('input#item4Count').val(item4Count);
			$('input#item5Count').val(item5Count);
			$('input#item6Count').val(item6Count);
			$('label#item1view').text(item1Count);
			$('label#item2view').text(item2Count);
			$('label#item3view').text(item3Count);
			$('label#item4view').text(item4Count);
			$('label#item5view').text(item5Count);
			$('label#item6view').text(item6Count);
			var total = Number(item1Count)+Number(item2Count)+Number(item3Count)+Number(item4Count)+Number(item5Count)+Number(item6Count);
			console.log(total);
			var item1bar =Number($('input#item1Count').val())/total*100+'%';
			var item2bar =Number($('input#item2Count').val())/total*100+'%';
			var item3bar =Number($('input#item3Count').val())/total*100+'%';
			var item4bar =Number($('input#item4Count').val())/total*100+'%';
			var item5bar =Number($('input#item5Count').val())/total*100+'%';
			var item6bar =Number($('input#item6Count').val())/total*100+'%';
			$('div#item1bar').width(item1bar);
			$('div#item2bar').width(item2bar);
			$('div#item3bar').width(item3bar);
			$('div#item4bar').width(item4bar);
			$('div#item5bar').width(item5bar);
			$('div#item6bar').width(item6bar);
			
		}
		

		function goVoteForm() {
			location.href = "/notice/voteForm";
		}
		
		$('.registerBtn').on('click',(function() {
			var item1 = document.getElementById('item1');
			var item2 = document.getElementById('item2');
			var item3 = document.getElementById('item3');
			var item4 = document.getElementById('item4');
			var item5 = document.getElementById('item5');
			var item6 = document.getElementById('item6');
			 if($(item1).is(":checked")==true){
				 $('input#item1Count').val( Number($('input#item1Count').val())+1);
			 }
			 if($(item2).is(":checked")==true){
				 $('input#item2Count').val( Number($('input#item2Count').val())+1);
			 }
			 if($(item3).is(":checked")==true){
				 $('input#item3Count').val( Number($('input#item3Count').val())+1);
			 }
			 if($(item4).is(":checked")==true){
				 $('input#item4Count').val( Number($('input#item4Count').val())+1);
			 }
			 if($(item5).is(":checked")==true){
				 $('input#item5Count').val( Number($('input#item5Count').val())+1);
			 }
			 if($(item6).is(":checked")==true){
				 $('input#item6Count').val( Number($('input#item6Count').val())+1);
			 }
					
	            	var form = $(this).parent().parent().parent().parent().parent().parent().parent().prev();
	            	var arr = [];
	            	console.log(form);
	            	form.attr("action", "/notice/voteList/upVote");
	    			form.submit();
	    			link = '';
	        
		}));
		
		
		
		$('.removeBtn').on('click',(function() {
			var link = $(this).parent().parent().prev();
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
	    			form.attr("action", "/notice/vote/delete");
	    			form.submit();
	    			link = '';
	            })
		}));
		
		
		
	</script>
</body>


