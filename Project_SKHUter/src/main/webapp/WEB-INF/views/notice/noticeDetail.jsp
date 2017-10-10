<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항</h1>
	</div>
</div>
<div class="col-lg-12">
<div class="panel-body">
	<div class="board-btns">
	<div class="board-btn">
	<form role="form" id="deleteform" method="post" action="/board/boardDetail/delete">
    			<input type='hidden' name='noticeNo' id='nn' value ="${noticeDTO.noticeNo}">
    			<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
    	</form>
		<c:if test="${login.status>=3}">
		<button id="rmbtn" type="button" class="btn btn-danger">삭제</button>
		</c:if>
	</div>
	<div class="board-btn">
		<button id="libtn" type="button" class="btn btn-default">목록</button>
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
				<td colspan="7"> ${noticeDTO.title}</td>
				</tr>
				<tr>
				<th>조회</th>
				<td>${noticeDTO.hitCount}</td>
				<th> </th>
				<td> </td>
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeDTO.regdate}" /></td>
				<th> </th>
				<td> </td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-content" colspan="8">
					<pre style="background-color: white;">${noticeDTO.content}</pre>
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
<form role="form" id="listForm">
<input type="hidden" name="noticeNo" value="${noticeDTO.noticeNo}">
<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="keyword" value="${cri.keyword}">
<input type="hidden" name="searchType" value="${cri.searchType}">
</form>  
<script>
$('#rmbtn').on('click',(function() {
	 var link = $('form#deleteform');
		var form = link;
		var arr = [];
		form.attr("action", "/notice/noticeDetail/delete");
	
	swal({
		  title: '정말 삭제 하시겠습니까? ',
		  text: "",
		  showCancelButton: true,
		}).then(function (answer) {
			form.submit();
			link = '';
		})
}));
var noticeNo = $('#nn').val();
var formObj = $("form#listForm");
$('#libtn').on('click',(function() {
	formObj.attr("action", "/notice/noticeList");
	formObj.attr("method", "get");		
	formObj.submit();
}));
</script>
