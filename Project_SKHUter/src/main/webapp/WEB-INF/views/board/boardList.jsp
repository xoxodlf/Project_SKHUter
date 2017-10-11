<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	position: relative;
	width: inherit;
}
/* 테이블 게시물리스트부분 글자크기 및 정렬*/
.table>thead>tr>th, .table>tbody>tr>th, .table>tbody>tr>td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: middle;
	font-size: medium;
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



<input type="hidden" id="deletesuccess" value="${message}">
<input type="hidden" id="createsuccess" value="${message}">

<div class="row">
	<div class="col-lg-12">
		<img src="/resources/images/title/board.png" class="page-header" style="width: 20%;">
	</div>
</div>

<div class="col-lg-12">
	<div class="panel-body">

		<!-- 테이블 상단 버튼들 -->
		<c:if test="${login.status>=3}">
		<div class="board-btns">
			<div class="board-btn">
				<button type="button" id="deletebutton"
					class="btn btn-danger removeBtn deleteBtn">삭제</button>
			</div>
			<div class="board-btn" onclick="goboardForm();">
				<button type="button" class="btn btn-default">글쓰기</button>
			</div>
		</div></c:if>
		<!-- div.board-btns -->

		<br />
		<div class="table-responsive">
		<form role="form" id="deleteForm" action="/board/boardList/deleteList" method="post">
			<!-- 게시판 테이블 구성 -->
			<table class="table table-hover">
				<colgroup>
					<c:if test="${login.status>=3}">
					<col width="6%" />
					</c:if>
					<col width="9%" />
					<col width="15%" />
					<col width="*" />
					<col width="14%" />
					<col width="6%" />
					<col width="5%" />
					<col width="5%" />
				</colgroup>
				<thead>
					<tr>
						<c:if test="${login.status>=3}"><th>전체<br />
						<input type="checkbox"  id="checkall"/></th></c:if>
						<th>No</th>
						<th></th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th><i class="fa fa-thumbs-up"></i></th>
						<th><i class="fa fa-thumbs-down"></i></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardList }">
						<td colspan="7" style="background-color: white; text-align: center; font-size: 20px;">
						게시물이 존재하지 않습니당
						</td>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardList}" var="boardDTO" varStatus="status">
								<tr>
									<c:if test="${login.status>=3}"><td><input class="checklist" type="checkbox"  name="check"  value="${boardDTO.boardNo}" /></td></c:if>
									<td>${boardDTO.boardNo}</td>
									<td></td>
									 <td><a
										href="/board/boardDetail${pageMaker.makeSearch(pageMaker.cri.page)}&boardNo=${boardDTO.boardNo}&userNo=${login.userNo}">${boardDTO.title}
										<span style="display:inline;">　[${boardDTO.replyCount}]</span> </a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${boardDTO.regdate}" /></td>
									<td>${boardDTO.hitCount}</td>
									<td>${boardDTO.likeCount}</td>
									<td>${boardDTO.hateCount}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- end of table -->
			</form>
			<!-- 검색창 -->
			<div class="search-box">
				<select name="searchType" id="searchType" class="form-control input-sm" style="display:inline; width: 9%">
					<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
					<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
					<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목 OR 내용</option>
				</select>
				<input type="search" class="form-control input-sm" name='keyword' 
				id="keywordInput" value='${cri.keyword}' style="display:inline;">
				<button class="btn btn-default" id="searchBtn">검색</button>
			</div>
			<!-- div.search-box -->
			

			<!-- 페이징 버튼들 -->
			<div class="paging-box">
				<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="/board/boardList${pageMaker.makeSearch(pageMaker.startPage - 1) }">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li  class="paginate_button <c:out value="${pageMaker.cri.page == idx? 'active' :''}"/>">
									<a href="/board/boardList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li  class="paginate_button next"><a
									href="/board/boardList${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></li>
							</c:if>
					
				</ul>
			</div>
			<!-- div.paging-box -->

		</div>
		<!-- div.table-responsive -->

	</div>
	<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->
<!-- 체크박스 하나라도 해제시 전체 체크부분 해제 -->
<script type="text/javascript">
	function allCheckFunc(obj) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked"));
	}
	/* 글쓰기 페이지로 이동 */
	function goboardForm() {
		location.href = "/board/boardForm";
	}

	$(document).ready(function(){
		    //최상단 체크박스 클릭
		    $("#checkall").click(function(){
		        //클릭되었으면
		        if($("#checkall").prop("checked")){
		            //input태그의 class이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		            $("input[name=check]").prop("checked",true);
		            //클릭이 안되있으면
		        }else{
		            //input태그의 class이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		            $("input[name=check]").prop("checked",false);
		        }
		    })
		})
		
	/* 삭제여부 alert 대체 모달 */
	$("#deletebutton").on('click', (function() {
		var link = $("form#deleteForm");
		var length = $(".checklist:checked").length;
		if(length<=0){
			swal({
				title : '선택한 체크박스가 없습니다.',
				text : "",
				type : 'warning',
				confirmButtonColor : '#3085d6',
				confirmButtonText : 'YES'
			})
		}else{
			swal({
				title : '삭제 하시겠습니까?',
				text : "",
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : 'YES',
				cancelButtonText : 'NO'
			}).then(function() {
				var form = link;
				var arr = [];
				form.attr("action", "/board/boardList/deleteList");
				form.submit();
				link = '';
			})
		}
		
	}));
	
	/*등록 삭제 처리 완료시 뜨는 창*/
	$(function() {
		var message = $('#createsuccess').val();
		if (message == 'createsuccess') {
			swal({
				type: 'success',
			    title: '등록이 완료되었습니다.'
			    })
		}
	});
	$(function() {
		var message = $('#deletesuccess').val();
		if (message == 'deletesuccess') {
			swal({
				type: 'success',
			    title: '삭제가 완료되었습니다.'
			    })
		}
	});
	
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location.href = "boardList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("#searchType option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});

</script>