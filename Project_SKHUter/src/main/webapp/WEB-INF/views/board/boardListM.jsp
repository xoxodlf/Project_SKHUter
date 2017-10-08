<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 파비콘 설정 -->
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/skhuter.ico" />
	
	
	<!-- CSS -->
	
	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link href="/resources/css/bootstrap.vertical-tabs.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
	
    <!-- SweetAlert CSS -->
    <link href="/resources/css/sweetalert2.min.css" rel="stylesheet">
    
    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">
    
    <link href="/resources/css/metisMenu.css" rel="stylesheet">
    
    
	<!-- JavaScript -->
    
	<!-- jQuery JavaScript -->
	<script src="/resources/js/jquery.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
	
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

    <!-- SweetAlert JavaScript -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    <script src="/resources/js/metisMenu.js"></script>
    <script src="/resources/js/bootstrap-datetimepicker.js"></script>
    <script src="/resources/js/bootstrap-datetimepicker.ko.js"></script>
    <script src="/resources/js/sb-admin-2.js"></script>
    <script src="/resources/js/jquery.flexslider.js"></script>
    
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

<!-- 전체 체크박스 클릭시 모든 체크박스 선택-->
<!-- 체크박스 하나라도 해제시 전체 체크부분 해제 -->
<script type="text/javascript">
	function allCheckFunc(obj) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked"));
	}

	/* 체크박스 체크시 전체선택 체크 여부 */
	function oneCheckFunc(obj) {
		var allObj = $("[name=checkAll]");
		var objName = $(obj).attr("name");

		if ($(obj).prop("checked")) {
			checkBoxLength = $("[name=" + objName + "]").length;
			checkedLength = $("[name=" + objName + "]:checked").length;

			if (checkBoxLength == checkedLength) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		} else {
			allObj.prop("checked", false);
		}
	}

	$(function() {
		$("[name=checkAll]").click(function() {
			allCheckFunc(this);
		});
		$("[name=checkOne]").each(function() {
			$(this).click(function() {
				oneCheckFunc($(this));
			});
		});
	});

	/* 글쓰기 페이지로 이동 */
	function goboardForm() {
		location.href = "/board/boardForm";
	}

	
	/* 삭제여부 alert 대체 모달 */
	$('.removeBtn').on('click', (function() {
		var link = $(this).parent().parent().parent().prev();
		console.log('link');
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
			form.attr("action", "/board/boardList/delete");
			form.submit();
			link = '';
		})
	}));

</script>

<input type="hidden" id="deletesuccess" value="${message}">
<input type="hidden" id="createsuccess" value="${message}">

<div class="row">
	<div class="col-lg-12">
		<img src="/resources/images/title/board.png" class="page-header"
			style="width: 20%;">
	</div>
</div>

<div class="col-lg-12">
	<div class="panel-body">

		<!-- 테이블 상단 버튼들 -->
		<div class="board-btns">
			<div class="board-btn">
			</div>
			<div class="board-btn" onclick="goboardForm();">
				<button type="button" class="btn btn-default">글쓰기</button>
			</div>
		</div>
		<!-- div.board-btns -->

		<br />
		<div class="table-responsive">

			<!-- 게시판 테이블 구성 -->
			<table class="table table-hover">
				<colgroup>
					<col width="9%" />
					<col width="15%" />
					<col width="*" />
					<col width="14%" />
					<col width="10%" />
					<col width="5%" />
					<col width="5%" />
				</colgroup>
				<thead>
					<tr>
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
							<c:forEach items="${boardList}" var="boardDTO">
								<form role="form" id="deleteform"
									action="/board/boardList/delete" method="post">
									<input type='hidden' name='boardNo' value="${board.boardNo}">
								</form>
								<tr>
									<td>${boardDTO.boardNo}</td>
									<td></td>
									<td><a
										href="/board/boardDetail?boardNo=${boardDTO.boardNo}">${boardDTO.title}<span style="display:inline;">　[${boardDTO.replyCount}]</span> </a></td>
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

			<!-- 검색창 -->
			<div class="search-box" style="margin-top:10%;">
				<input type="search" class="form-control input-sm">
				<button class="btn btn-default">검색</button>
			</div>
			<!-- div.search-box -->


			<!-- 페이징 버튼들 -->
			<div class="paging-box">
				<ul class="pagination">
						
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="/board/boardList${pageMaker.makeQuery(pageMaker.startPage - 1) }">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li  class="paginate_button <c:out value="${pageMaker.cri.page == idx? 'active' :''}"/>">
									<a href="/board/boardList${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li  class="paginate_button next"><a
									href="/board/boardList${pageMaker.makeQuery(pageMaker.endPage +1) }">다음</a></li>
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