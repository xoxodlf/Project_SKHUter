<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 기타 */
	/* 페이지 제목 : 익명게시판 : 가운데 정렬 + 굵게 */
	h1.page-header {
		text-align: center;
		font-weight: bold;
	}
	
	/* 글쓰기+삭제 버튼 한 줄 차지 */
	div.board-btn {
		display: inline-block;
		width: 48%;
	}
	div.board-btns div:nth-child(1) {
		text-align: left;
	}
	div.board-btns div:nth-child(2) {
		text-align: right;
	}
	div.board-btn button {
		width: auto;
		height: auto;
		margin: 0;
	}
	
	/* 표 감싸는 부분을 줄이자 */
	div.panel-body {
		display: inline-block;
		width: 90%;
	}
	/* 가운데 정렬 */
	div.col-lg-12 {
		text-align: center;
	}

/* 표 */
	/* 링크 시 밑줄 제거 */
	a, a:hover, a:active, a:link {
		text-decoration: none;
	}
	/* 테이블 행, 열 가운데 정렬 */
	table.table-hover, thead tr th {
		text-align: center;
	}
	/* 내용부분 너비 지정 */
	table tbody tr td.table-content pre{
		padding: 50px 10px 50px 10px;
	}
	
	button#likeBtn {
		color: #67a6d3;
  		background-color: white;
   		border-color: #adadad;
	}
	
	button#hateBtn {
		color: #ff7058;
  		background-color: white;
   		border-color: #adadad;
	}
	button#likeBtn.active{
		color: white;
  		background-color: #67a6d3;
   		border-color: #adadad;
   		
	}
	button#hateBtn.active{
		color: white;
  		background-color: #ff7058;
   		border-color: #adadad;
   		
	}
	button#likeBtn:hover{
		color: #67a6d3;
  		background-color: rgba(92, 147, 187, 0.29);
   		border-color: #adadad;
	}
	button#hateBtn:hover{
		color: #ff7058;
  		background-color: rgba(255, 112, 88, 0.45);
   		border-color: #adadad;
	}
}
	
</style>
<div>
<div class="row">
	<div class="col-lg-12">
		<img src="/resources/images/title/board.png" class="page-header" style="width: 20%;">
	</div>
</div>
<div class="col-lg-12">
<div class="panel-body">
	<div class="board-btns">
	<div class="board-btn">
		 <form role="form" id="deleteform" method="post" action="/board/boardDetail/delete">
    			<input type='hidden' name='boardNo' id='bn' value ="${boardDTO.boardNo}">
    			<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
    	</form>   
		<button type="button" class="btn btn-danger removeBtn">삭제</button>
	</div>
	<div class="board-btn">
		<button type="button" class="btn btn-default listBtn">목록</button>
	</div>
	</div>
	<!-- div.board-btns -->
	<br/>
	<div class="table-responsive table-bordered">
		<table class="table">
			<colgroup>
				<col width="20%"/>
				<col width="15%"/>
				<col width="5%"/>
				<col width="10%"/>
				<col width="7%"/>
				<col width="15%"/>
				<col width="7%"/>
				<col width="21%"/>
			</colgroup>
			<thead>
				<tr>
				<th>제목</th>
				<td colspan="7"> ${boardDTO.title}</td>
				</tr>
				
				<tr>
				<th>조회</th>
				<td>${boardDTO.hitCount}</td>
				<th> </th>
				<td> </td>
				<th> </th>
				<th align="center" style="text-align: right;">작성일</th>
				<td colspan="2" align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.regdate}" /></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-content" colspan="8">
					<pre style="background-color: white;">${boardDTO.content}</pre>
					</td>
				</tr>
				<tr>
					<td colspan="8" style="text-align: center;" >
					 <form role="form" id="updatelikeform" method="post" action="/board/boardDetail/uplike">
					<input type='hidden' name='boardNo' id='bn' value ="${boardDTO.boardNo}">
					<input type="hidden" name='userNo' id="loguserno" value="${login.userNo}">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="hidden" name="searchType" value="${cri.searchType}">
					</form>
					<form role="form" id="updatehateform" method="post" action="/board/boardDetail/uphate">
					<input type='hidden' name='boardNo' id='bn' value ="${boardDTO.boardNo}">
					<input type="hidden" name='userNo' id="loguserno" value="${login.userNo}">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="hidden" name="searchType" value="${cri.searchType}">
					</form>
					<button type="button" id="likeBtn" class="btn btn-default likeBtn"><i class="fa fa-thumbs-o-up "></i> 좋아요 ${boardDTO.likeCount}</button>
					<button type="button" id="hateBtn" class="btn btn-default hateBtn"><i class="fa fa-thumbs-o-down"></i> 싫어요 ${boardDTO.hateCount}</button>
					
					 
					</td>
				</tr>
				<tr>
					<td align=center>댓글</td> 
					<td colspan="6">
					<input type="text" name="replytext" id="newReplyText" size="100"/></td>
					<td colspan="2" align=center>
						<button type="button" id="replyAddBtn" class="btn btn-default" size="30" >등록</button>
					</td>
				</tr>
			</tbody>
			<tfoot id='replies'>
			</tfoot>
		</table>
		<input type="hidden" id="pw" value="${boardDTO.password}">
		<input type="hidden" id="loguserno" value="${login.userNo}">
		<input type="hidden" id="writeruser" value="${replyDTO.userNo}">
		<input type="hidden" id="deletesuccess" value="${message}">
		<input type="hidden" id="successuplike" value="${message}">
		<input type="hidden" id="islike" value="${board.islike}">
		<input type="hidden" id="ishate" value="${board.ishate}">
		
		<!-- end of table -->
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->
</div>
<form role="form" id="listForm">
<input type="hidden" name="boardNo" value="${boardDTO.boardNo}">
<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="keyword" value="${cri.keyword}">
<input type="hidden" name="searchType" value="${cri.searchType}">
</form>  

<script>
$('#likeBtn').on('click',(function() {
	var likeclass=document.getElementById('likeBtn').className;
	var hateclass=document.getElementById('hateBtn').className;
	
	if(likeclass=='btn btn-default active'){
		//좋아요 버튼이 이미 눌려있으면
		swal({
		    type: 'warning',
		    title: '이미 좋아한 게시물입니다.'
		  })
	}else{
		//아무 버튼도 눌려있지 않은 상태
		var formObj=$('#updatelikeform');
		formObj.attr("action", "/board/boardDetail/uplike");
		formObj.attr("method", "post");		
		formObj.submit();
	}
}));

//좋아요 등록에 성공한 경우
$(function() {
	var message = $('#successuplike').val();
	if (message == 'successuplike') {
		swal({
			type: 'success',
		    title: '좋아요를 누르셨습니당!'
		    })
	}
});

$('#hateBtn').on('click',(function() {
	var likeclass=document.getElementById('likeBtn').className;
	var hateclass=document.getElementById('hateBtn').className;
	
	if(hateclass=='btn btn-default active'){
		//싫어요 버튼이 이미 눌려있으면
		swal({
		    type: 'warning',
		    title: '이미 싫어한 게시물입니다.'
		  })
	}else{
		var formObj=$('#updatehateform');
		formObj.attr("action", "/board/boardDetail/uphate");
		formObj.attr("method", "post");		
		formObj.submit();
	}
}));

//싫어요 등록에 성공한 경우
$(function() {
	var message = $('#successuphate').val();
	if (message == 'successuphate') {
		swal({
			type: 'success',
		    title: '싫어요를 누르셨습니당!'
		    })
	}
});


/** 버튼의 색을 바꿔보자 
$('.paginate_button').on('click',(function() {
	formObj.attr("action", "/board/boardList");
	formObj.attr("method", "get");		
	formObj.submit();
}));
**/
var boardNo = $('#bn').val();
var formObj = $("form#listForm");

/** 게시판 리스트로 이동**/
$('.listBtn').on('click',(function() {
	console.log("user : " + $('input#loguserno').val());
	formObj.attr("action", "/board/boardList");
	formObj.attr("method", "get");
	formObj.submit();
}));

/** 게시물 삭제 기능 구현 **/
$('.removeBtn').on('click',(function() {
	 var password= $('input#pw').val();
	 var link = $(this).prev();
		var form = link;
		var arr = [];
		form.attr("action", "/board/boardDetail/delete");
	 console.log("password : " + password);
	swal({
		  title: '정말 삭제 하시겠습니까? ',
		  text: "글 작성 시 입력한 비밀번호를 입력해주세요.",
		  input: 'password',
		  inputPlaceholder: 'Enter your password.',
		  showCancelButton: true,
		  inputValidator: function (value) {
		    return new Promise(function (resolve, reject) {
		      if (value) {
		    	if(value==password) resolve()
		        else reject("비밀번호가 틀렸습니다. 정확하게 입력해주세요.")
		      } else {
		        reject("값을 입력해주세요.")
		      }
		    })
		  }
		}).then(function (answer) {
			form.submit();
			link = '';
		})
}));

/** 해당 게시물 댓글 목록 불러오기, 좋아요비활성화 버튼 활성화 관리 **/
$(document).ready(function(data){
	$.getJSON("/replies/all/" + boardNo, function(data){
		if($('#islike').val()>0){
			document.getElementById('likeBtn').className='btn btn-default active';
			document.getElementById('hateBtn').disabled = true;
		}
		if($('#ishate').val()>0){
			document.getElementById('hateBtn').className='btn btn-default active';
			document.getElementById('likeBtn').disabled = true;
		}
		var str = "";
		var frontstr= "";
		var countreply= 0;
		$(data).each(function() {
			str += "<tr><td data-replyNo='"+this.replyNo+"'align=center style='vertical-align: middle;'>" 
				+ "<img src='/resources/images/anonymouscomment.png' style='width: 30px;'>　　:</td>"
				+ "<td colspan='6' style=' vertical-align: middle; width: 10px; font-size: small;'>"
				+ this.content
				+ "</td>"
				+ "<td colspan='1' style='font-size: small; vertical-align: middle; text-align:center;'>"
				+ this.regdate
				+ "</td>";
			countreply += 1;
		});
		frontstr="<tr align=center style='vertical-align: middle;'><td colspan='8'> ※ " + countreply + "개의 댓글이 있습니다. 댓글은 삭제가 불가능하니 신중히 생각하고 적도록 합시다!</td></tr>";
		$("#replies").html(frontstr+str);

	});
});

/** 댓글 등록시 목록 업데이트하기 **/
function getAllList() {
	$.getJSON("/replies/all/" + boardNo, function(data){
		console.log(data.length);
		var str = "";
		var frontstr= "";
		var countreply= 0;
		$(data).each(function() {
			str += "<tr><td data-replyNo='"+this.replyNo+"'align=center style='vertical-align: middle;'>" 
				+ "<img src='/resources/images/anonymouscomment.png' style='width: 30px;'>　　:</td>"
				+ "<td colspan='6' style=' vertical-align: middle; width: 10px;font-size: small;'>"
				+ this.content
				+ "</td>"
				+ "<td colspan='1' style='font-size: small; vertical-align: middle; text-align:center;'>"
				+ this.regdate
				+ "</td>";
			countreply += 1;
		})
		frontstr="<tr align=center style='vertical-align: middle;'><td colspan='8'> ※ " + countreply + "개의 댓글이 있습니다. 댓글은 삭제가 불가능하니 신중히 생각하고 적도록 합시다!</td></tr>";
		$("#replies").html(frontstr+str);
	})
};

/** 댓글 등록하기 **/
$("#replyAddBtn").on("click", function() {
	var userNo = $("#loguserno").val();
	var content = $("#newReplyText").val();
	$.ajax({
		type : 'post',
		url : '/replies',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			boardNo : boardNo,
			userNo : userNo,
			content : content
		}),
		success : function(result) {
			if (result == 'SUCCESS') {
				swal({
				    type: 'success',
				    title: '등록이 완료되었습니다.'
				  }).then(function () {
					  getAllList();
					  newReplyText.value="";
					  
				  })
			}
		}
	})
});

</script>

