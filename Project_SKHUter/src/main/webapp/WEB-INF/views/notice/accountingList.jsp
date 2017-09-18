<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* 기타 */
	/* 페이지 제목 : 익명 게시판 : 가운데 정렬 + 굵게 */
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
	/* 체크박스 css 수정 */
	input[type="checkbox"] {
		position:relative;
		width: inherit;
	}
/* 검색 */
	div.search-box {
		display: block;
		width: 100%;
	}
	div.search-box input[type="search"] {
		display: inline-block;
		width: 20%;
	}
	
</style>
	<div class="row">
		<div class="col-lg-12">
			<img src="/resources/images/title/account.png" class="page-header" style="width: 20%;">
		</div>
	</div>
<div class="col-lg-12">
<div class="panel-body">
	<div class="board-btns">
	<div class="board-btn">
		<button type="button" class="btn btn-danger">삭제</button>
	</div>
	<div class="board-btn">
		<button type="button" data-toggle="modal" data-target="#accountingModal" class="btn btn-default">등록</button>
	</div>
	</div>
	<!-- div.board-btns -->
	<br/>
	<div class="table-responsive">
		<table class="table table-hover">
			<colgroup>
				<col width="7%"/>
				<col width="7%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="7%"/>
			</colgroup>
			<thead>
				<tr>
				<th>전체<br/><input type="checkbox" /></th>
				<th>No</th>
				<th>거래 내역</th>
				<th>지출</th>
				<th>수입</th>
				<th>잔액</th>
				<th>작성일</th>
				<th>영수증</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" /></td>
					<td>4</td>
					<td><a href="#">10만원을 어따 썼더라</a></td>
					<td>100000</td>
					<td></td>
					<td>50000</td>
					<td>2017-09-16</td>
					<td><a href="#">영수증</a></td>
				</tr>
				<tr>
					<td><input type="checkbox" /></td>
					<td>3</td>
					<td><a href="#">야호 10만원 주웠다!!</a></td>
					<td></td>
					<td>100000</td>
					<td>150000</td>
					<td>2017-09-16</td>
					<td><a href="#">영수증</a></td>
				</tr>
				<tr>
					<td><input type="checkbox" /></td>
					<td>2</td>
					<td><a href="#">아니 뭔 술을 20만원어치를 먹음?</a></td>
					<td>200000</td>
					<td></td>
					<td>50000</td>
					<td>2017-09-16</td>
					<td><a href="#">영수증</a></td>
				</tr>
				<tr>
					<td><input type="checkbox" /></td>
					<td>1</td>
					<td><a href="#">10만원어치 술마셨는데 5만원 주움 ㅋ</a></td>
					<td>100000</td>
					<td>50000</td>
					<td>250000</td>
					<td>2017-09-16</td>
					<td><a href="#">영수증</a></td>
				</tr>
			</tbody>
		</table>
		<!-- end of table -->
		
		<!-- 검색창 -->
		<div class="search-box">
			<input type="search" class="form-control input-sm">
			<button class="btn btn-default">검색</button>
		</div>
		<!-- div.search-box -->
		
		<!-- 페이징 버튼들 -->
		<div class="paging-box">
			<ul class="pagination">
				<li class="paginate_button previous disabled">
					<a href="#">이전</a>
				</li>
				<li class="paginate_button active">
					<a href="#">1</a>
				</li>
				<li class="paginate_button next">
					<a href="#">다음</a>
				</li>
			</ul>
		</div>
		<!-- div.paging-box -->
	
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->

<jsp:include page="include/accountingModal.jsp" />
