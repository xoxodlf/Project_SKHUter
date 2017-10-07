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
/* 왼쪽 정렬*/
div.leftAlign {
	text-align: left;
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
<body>
	<div class="row">
		<div class="col-lg-12">
			<img src="/resources/images/title/meeting_note.png"
				class="page-header" style="width: 18%;">
		</div>
	</div>
	<div class="col-lg-12">
		<div class="panel-body">
			<div class="board-btns">
				<div class="board-btn"></div>
				<div class="board-btn">
					<button type="button" data-toggle="modal"
						data-target="#doMeetingModal" class="btn btn-default">등록</button>
				</div>
			</div>
			<div class="row" style="margin-top: 20px">
				<c:choose>
					<c:when test="${empty list }">
						<div style="margin-top: 10%">
							<p style="text-align: center; font-size: 20px">
								<mark>회의록 내역이 존재하지 않습니당</mark>
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="MeetingNoteDTO" varStatus="status">
							<form role="form" method="POST">
								<input type="hidden" name="meetingNoteNo" id="meetingNoteNo" value="${MeetingNoteDTO.meetingNoteNo }">
							</form>
							
							<div class="col-lg-4" style="text-align: left">
								<div class="panel panel-info">
									<div class="panel-heading">
										${MeetingNoteDTO.title}
										<button class="btn btn-default btn-sm removeBtn"
											id="removeBtn" style="float: right; padding: 2px 9px;">
											<i class="fa fa-trash-o fa-sm"></i>
										</button>
									</div>
									<div class="panel-body" style="height: 90px">
										<div class="libraryList">${MeetingNoteDTO.fileName }</div>
									</div>

									<div class="panel-footer">
										작성자 : ${name[status.index].name} 
										<a class="btn btn-default btn-sm" id="downloadBtn" onclick="downloadFunc('${MeetingNoteDTO.uuidName}')" style="float: right; padding: 2px 9px;">
										 <i class="fa fa-download fa-sm"></i>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- /.col-lg-4 -->
			</div>
		</div>
	</div>
	<!-- /.row -->
</body>
<script>
	/** 삭제 버튼 이벤트 처리 */
	$(".removeBtn").on("click", function() {
		var link = $(this).parent().parent().parent().prev();
		swal({
			title : '자료를 삭제하시겠습니까?',
			text : "",
			type : 'question',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : 'Yes',
			cancelButtonText : 'No',
		}).then(function() {
			var formObj = link;
			var arr = [];
			$(".thumbnailList img").each(function(index) {
				arr.push($(this).attr("src"));
			});

			//           $.post("/project/deleteAllFiles", {files : arr}, function() {

			//           });

			formObj.attr("action", "/council/meetingNote/remove");
			formObj.submit();
			link = '';
		})
	});

	/** 다운로드 클릭 시 이벤트 */
	function downloadFunc(uuidName) {
		event.preventDefault();
		console.log(uuidName);
		var data = uuidName;
		var url = "";

		if (checkImageType(data)) {
			var front = data.substring(0, 9); // /asc 경로 추출
			var end = data.substring(11); // s_ 제거

			location.href = "/council/meetingNote/displayFile?fileName=" + front
					+ end;
		} else {
			location.href = "/council/meetingNote/displayFile?fileName=" + data;
		}
	}
	
	
	function checkImageType(fileName) {
		  var pattern = /jpg|gif|png|jpeg/i;   // i는 대소문자 구분 없음을 의미
	      
	      return fileName.match(pattern);
	   }
</script>
<jsp:include page="include/doMeetingModal.jsp" />