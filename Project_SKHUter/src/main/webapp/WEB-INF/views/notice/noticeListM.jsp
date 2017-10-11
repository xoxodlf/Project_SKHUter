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
		<img src="/resources/images/title/notice.png" class="page-header"
			style="width: 40%;">
	</div>
</div>
<div class="col-lg-12">
	<div class="panel-body">
		<div class="board-btns">
		
			<div class="board-btn">
					</div>
			
			<div class="board-btn">
				<c:if test="${UserDTO.status>=3}">
				<a href="/notice/noticeFormM" class="btn btn-default"> 글쓰기 </a>
				</c:if>

			</div>
		</div>
		<!-- div.board-btns -->
		<br />
	
		<div class="table-responsive">
		<form role="form" id="deleteForm" action="/notice/noticeList/deleteList" method="post">
			<table class="table table-hover">
				<colgroup>
					<col width="7%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수　</th>
					</tr>
				</thead>
				<tbody>
			
				<c:choose>
						<c:when test="${empty noticeList}">
						<td colspan="5" style="background-color: white; text-align: center; font-size: 20px;">
						공지사항이 존재하지 않습니다
						</td>
						</c:when>
						<c:otherwise>
						<c:forEach items="${noticeList}" var="noitceDTO">
					<tr>
						<td>${noitceDTO.noticeNo}</td>
						<td><a href="/notice/noticeDetailM${pageMaker.makeSearch(pageMaker.cri.page)}&noticeNo=${noitceDTO.noticeNo}">${noitceDTO.title}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noitceDTO.regdate}" /></td>
						<td>${noitceDTO.hitCount}　</td>
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>
			<!-- end of table -->

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
									href="/notice/noticeListM${pageMaker.makeSearch(pageMaker.startPage - 1) }">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li  class="paginate_button <c:out value="${pageMaker.cri.page == idx? 'active' :''}"/>">
									<a href="/notice/noticeListM${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li  class="paginate_button next"><a
									href="/notice/noticeListM${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></li>
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



<script type="text/javascript">
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
	
	/* 글쓰기 페이지로 이동 */
	function goboardForm() {
		location.href = "/notice/noticeFormM";
	}

	/* 삭제여부 alert 대체 모달 */
	$('#deletebutton').on('click', (function() {
		var link = $("form#deleteForm");
		console.log(link);
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
			form.attr("action", "/notice/noticeList/deleteList");
			form.submit();
			link = '';
		})
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
							self.location.href = "noticeListM"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("#searchType option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});

</script>

