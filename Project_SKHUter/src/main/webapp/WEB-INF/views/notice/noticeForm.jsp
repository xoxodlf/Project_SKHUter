<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- SummerNote -->
<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
/* SummerNote */
/* SummerNote내용 value값으로 전달 */
function contentsend(){
		var markupStr = $('.summernote').summernote('code');
		$('input#content').val(markupStr);
}

/* SummerNote 내용 받아오기 */
$(document).ready(function() {
    $('.summernote').summernote({
    	lang: 'ko-KR',
    	height: 300,
    	focus: false,
    	placeholder: '내용을 입력해주세요.'
    });
});

$('.listBtn').on('click',(function() {
	location.href = "/board/boardList";
}));
    
</script>
<style>
/* 기타 */
	/* 페이지 제목 : 공지사항 : 가운데 정렬 + 굵게 */
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
	/* 제목 입력창 늘이기 */
	input.title {
		width: 80%;
	}
	
</style>
<form role="form" id="form" action="noticeForm" method="POST">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항 글쓰기</h1>
	</div>
</div>
<div class="col-lg-12">
<div class="panel-body">
<input type="hidden" name="userNo" value="${login.userNo}">
	<div class="board-btns">
	<div class="board-btn">
		<button type="submit" onmouseover="contentsend()" class="btn btn-default">글등록</button>
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
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<thead>
				<tr>
				<th>제목</th>
				<td colspan="3">
				<input type="text" name="title" class="title" style="width:820;"/>
				</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-content" colspan="4">
					<!-- SummerNote Editer -->
					<textarea class="summernote" name="content"></textarea>
					<input type="hidden" name="content" id="content">
					</td>
				</tr>
			</tbody>
		</table>
		<!-- end of table -->
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->
</form>

