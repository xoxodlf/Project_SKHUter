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
                        <c:forEach items="${voteList}" var="vote">
                        	<div class="alert alert-warning ">
                           		<a href="javascript:showModal('${vote.title}','${vote.item1}','${vote.item2}','${vote.item3}','${vote.item4}','${vote.item5}','${vote.item6}','${vote.voteNo}','${vote.content}');">${vote.title}</a>
                        	</div>
                        </c:forEach>
                        <div class="alert alert-warning ">
                           		<a data-toggle="modal" data-target="#doneVoteModal" class="alert-link"> 과연 꼴뚜기보다 오징어가 맛있을까요???</a>
                        	</div>
                        </div> 
                        <div class="tab-pane fade" id="tab2primary">Primary 2</div>
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
		var result = '${msg}';
		if(result =='SECCESS'){
			alert("처리완료데스")
		}
		function goVoteForm() {
			location.href = "/notice/voteForm";
		}
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
			$('input#item3').val(item3);
			$('input#item4').val(item4);
			$('input#item5').val(item5);
			$('input#item6').val(item6);
			$('input#voteNo').val(voteNo);
			$('label#content').text(content);
			
			
		}
		
		$(function() {
			$("#registerBtn").click(function() {
				var selectItem=$(":input:radio[name=selectItem]:checked").val();
				var userNo=$(":input:hidden[name=userNo]").val();
				alert(selectItem);
				alert(userNo);
			});
		});
	</script>
</body>


