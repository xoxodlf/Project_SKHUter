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
    			<input type='hidden' name='boardNo' value ="${boardDTO.boardNo}"> 
    	</form>   
		<button class="btn btn-default removeBtn" type="button">삭제</button>
	</div>
	<div class="board-btn">
		<button type="button" class="btn btn-default btn-primary">목록</button>
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
				<td colspan="7"> ${boardDTO.title} [13]</td>
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
					<pre>${boardDTO.content}</pre>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8" style="text-align: center;" >
					<button type="button" class="btn btn-default"><i class="fa fa-thumbs-o-up "></i> 23</button>
					<button type="button" class="btn btn-default"><i class="fa fa-thumbs-o-down"></i> ${boardDTO.hateCount}</button>
					</td>
				</tr>
				<tr>
					<td align=center>댓글</td> 
					<td colspan="6">
					<input type="text" name="comment" class="comment" size="100"/></td>
					<td align=center>
						<button type="button" class="btn btn-default" size="30" style="margin-left:5;">등록</button>
					</td>
				</tr>
			
				<tr> 
					<td align=center> <img src="/resources/images/anonymouscomment.png" style="width: 30%;"></td>
				   	<td colspan="5" style=" vertical-align: middle;"><b>이렇게 하면 정말 좋겠다! 공감공감~ 추천꾸욱~!!! </b></td>
				   	<td colspan="2" style="font-size:15px; vertical-align: middle; text-align:right;"> 2017-09-16 18:06 </td>
				</tr>
			</tfoot>
		</table>
		<!-- end of table -->
		
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->
<script>
$('.removeBtn').on('click',(function() {
	var link = $(this).prev();
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
			form.attr("action", "/board/boardDetail/delete");
			form.submit();
			link = '';
        })
}));

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
$(".btn-primary").on("click", function(){
	self.location = "/board/boardList";
});
});

$(function(){
	var msg = $('#SUCCESS').val();
	if (msg == 'SUCCESS') {
		swal(     
	     		 '',
	     	     '삭제가 완료되었습니다.',
	     	     'SUCCESS'
	     		)
	}
	});

</script>
