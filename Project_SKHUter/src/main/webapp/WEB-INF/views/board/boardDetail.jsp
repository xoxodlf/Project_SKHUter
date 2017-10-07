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
	
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">익명 게시판</h1>
	</div>
</div>
<div class="col-lg-12">
<div class="panel-body">
	<div class="board-btns">
	<div class="board-btn">
		 <form role="form" id="deleteform" method="post" action="/board/boardDetail/delete">
    			<input type='hidden' name='boardNo' id='bn' value ="${boardDTO.boardNo}">
    	</form>   
		<button type="button" class="btn btn-default removeBtn">삭제</button>
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
				<col width="15%"/>
				<col width="15%"/>
				<col width="5%"/>
				<col width="10%"/>
				<col width="5%"/>
				<col width="10%"/>
				<col width="5%"/>
				<col width="20%"/>
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
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.regdate}" /></td>
				<th> </th>
				<td> </td>
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
					 
					<button type="button" class="btn btn-default"><i class="fa fa-thumbs-o-up "></i> ${boardDTO.likeCount}</button>
					<button type="button" class="btn btn-default"><i class="fa fa-thumbs-o-down"></i> ${boardDTO.hateCount}</button>
					</td>
				</tr>
				<tr>
					<td align=center>댓글</td> 
					<td colspan="6">
					<input type="text" name="replytext" id="newReplyText" size="115"/></td>
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
		<!-- end of table -->
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->
  
  
  
 <script type="text/javascript" src="jquery.likebtn.js"></script>
<script>

var boardNo = $('#bn').val();
console.log("boardNo : "+boardNo);

/** 게시판 리스트로 이동**/
$('.listBtn').on('click',(function() {
	location.href = "/board/boardList.lay";
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
		  input: 'text',
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
			swal({
			    type: 'success',
			    title: '삭제가 완료되었습니다.'
			  }).then(function (answer) {
			form.submit();
			link = '';
			  })
		  
		})
}));

/** 해당 게시물 댓글 목록 불러오기 **/
$(document).ready(function(data){
	$.getJSON("/replies/all/" + boardNo, function(data){
		console.log(data.length);
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
$(document).ready(function($) {
	console.log(jQuery.fn.likebtn);
	$(".like-button").likebtn();
$("#like-button-x").likebtn({
		identifier: "my_button",
    theme: "github"
});
$("#like-button-y").likebtn({
    theme: "disk"
});
});
</script>

