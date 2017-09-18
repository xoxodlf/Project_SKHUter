<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<button type="button" class="btn btn-danger">삭제</button>
	</div>
	<div class="board-btn">
		<button type="button" class="btn btn-default">목록</button>
	</div>
	</div>
	<!-- div.board-btns -->
	<br/>
	<div class="table-responsive table-bordered">
		<table class="table">
			<colgroup>
				<col width="10%"/>
				<col width="20%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="20%"/>
			</colgroup>
			<thead>
				<tr>
				<th>제목</th>
				<td colspan="7">제목입네다</td>
				</tr>
				<tr>
				<th>작성자</th>
				<td>익명123</td>
				<th>조회</th>
				<td>300</td>
				<th>추천</th>
				<td>123</td>
				<th>작성일</th>
				<td>2017-09-16</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-content" colspan="8">
					<pre>내용은 여기에</pre>
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

