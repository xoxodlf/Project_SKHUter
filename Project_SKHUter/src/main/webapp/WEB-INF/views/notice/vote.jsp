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
                           		<a href="javascript:showModal('${vote.title}','${vote.item1}','${vote.item2}','${vote.item3}','${vote.item4}','${vote.item5}','${vote.item6}','${vote.voteNo}','${vote.content}');">${vote.title}</a>
                        		<div style="float: right;display:inline-block;">
                        		<button id="deleteBtn" class="btn btn-default btn-sm removeBtn" type="button">
                        		<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        		</button>
                        		
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
                           		<a href="javascript:showModal('${vote.title}','${vote.item1}','${vote.item2}','${vote.item3}','${vote.item4}','${vote.item5}','${vote.item6}','${vote.voteNo}','${vote.content}');">${vote.title}</a>
                        		<div style="float: right;display:inline-block;">
                        		<button id="deleteBtn" class="btn btn-default btn-sm removeBtn" type="button">
                        		<p class="glyphicon glyphicon-trash" aria-hidden="true"></p>
                        		</button>
                        		
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
			<div class="board-btn" onclick="goVoteForm();">
				<button type="button" class="btn btn-default">투표등록</button>
			</div>
		<div class="board-btn">
				<button type="button" class="btn btn-default">투표삭제</button>
		</div>
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
		
	
		function showModal(title,item1,item2,item3,item4,item5,item6,voteNo,content) {
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
		}
		

		function goVoteForm() {
			location.href = "/notice/voteForm";
		}
		
		
		
		
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


