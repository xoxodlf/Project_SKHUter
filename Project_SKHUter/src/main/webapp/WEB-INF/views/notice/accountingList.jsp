<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/js/lightbox.js"></script>
<link href="/resources/css/lightbox.css" rel="stylesheet" />

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
		<img src="/resources/images/title/account.png" class="page-header"
			style="width: 20%;">
	</div>
</div>
<div class="col-lg-12">
	<div class="panel-body">
		<c:if test="${login.status>=2}">
		<div class="board-btns">
			<!-- 삭제 버튼 -->
				<div class="board-btn">
					<button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
				</div>
			<!-- 글 등록 버튼 -->
			<div class="board-btn">
				<button type="button" data-toggle="modal"
					data-target="#accountingModal" class="btn btn-default">등록</button>
			</div>
		</div>
		</c:if>
		<!-- div.board-btns -->
		<br />
		<form role="form"  id="checkForm" method="post" action="/notice/accountingList/remove">
		<div class="table-responsive">
			<c:choose>
				<c:when test="${empty list }">
					<table class="table table-hover">
						<thead style="text-align: left">
							<tr>
							<c:if test="${login.status>=2}">
								<th>전체<br /> <input type="checkbox" id="checkall"/></th>
							</c:if>
								<th>No</th>
								<th>거래 내역</th>
								<th>지출</th>
								<th>수입</th>
								<th>작성일</th>
								<th>영수증</th>
							</tr>
						</thead>
					</table>
					<div style="margin-top: 10%">
						<p style="text-align: center; font-size: 20px">
							<mark>회계 내역이 존재하지 않습니당!</mark>
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<table class="table table-hover">
						<thead style="text-align: left">
							<tr>
								<c:if test="${login.status>=2}">
								<th>전체<br /> <input type="checkbox" id="checkall"/></th>
								</c:if>
								<th>No</th>
								<th>거래 내역</th>
								<th>지출</th>
								<th>수입</th>
								<th>사용 날짜</th>
								<th>영수증</th>
							</tr>
						</thead>
						<c:forEach items="${listpaged}" var="AccountingDTO" varStatus="status">
							<input type="hidden" value="${AccountingDTO.price }" id="price">
							<input type="hidden" value="${AccountingDTO.status }" id="what">
							<tbody>
								<tr>
									<c:if test="${login.status>=2}">
									<td><input type="checkbox" name="check" value="${AccountingDTO.accountNo }"/></td>
									</c:if>
									<td>${AccountingDTO.accountNo }</td>
									<td>${AccountingDTO.content }</td>
									
									<!-- 현재 루프가 처음이라면 잔액 계산을 위해 초기값 저장 -->
									<c:choose>
										<c:when test="${AccountingDTO.status eq 1 }">
											<input type="hidden" value="${AccountingDTO.status }" id="status">
											<td style="color: RED">-<fmt:formatNumber value="${AccountingDTO.price }" pattern="#,###" /> 원 </td>
											<td></td>
										</c:when>
										<c:otherwise>
											<input type="hidden" value="${AccountingDTO.status }" id="status">
											<td></td>
											<td style="color: BLUE">+<fmt:formatNumber value="${AccountingDTO.price }" pattern="#,###" /> 원</td>
										</c:otherwise>
									</c:choose>
									<td>${AccountingDTO.accountDate}</td>
									<td><a href="/resources/upload${listFileName[status.index] }" rel="lightbox" data-lightbox="image-${status.index}">${AccountingDTO.fileName }</a></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
			<div style="text-align:right;font-size:25px;style:bold">잔액:    <fmt:formatNumber value="${money }" pattern="#,###" /> 원</div>
			
			<div class="paging-box">
				<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="/notice/accountingList${pageMaker.makeSearch(pageMaker.startPage - 1) }">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li  class="paginate_button <c:out value="${pageMaker.cri.page == idx? 'active' :''}"/>">
									<a href="/notice/accountingList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li  class="paginate_button next"><a
									href="/notice/accountingList${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></li>
							</c:if>
					
				</ul>
			</div>
			
		</div>
	</form>
		</div>
	</div>
<script type="text/javascript">

$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=check]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=check]").prop("checked",false);
	        }
	    })
	})

	$("#removeBtn").on('click',(function() {
			var link = $("form#checkForm");
			console.log(link);
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
	    			form.attr("action", "/notice/accountingList/remove");
	    			form.submit();
	    			link = '';
	            })
		}));

   function getFileInfo(fullName) {
      var fileName, imgsrc, getLink;
      
      var fileLink;
      
      if (checkImageType(fullName)) {
         imgsrc = "/displayFile?fileName=" + fullName;
         fileLink = fullName.substr(7);
         
         var front = fileName.substr(0, 9);   // /asc 경로 추출
         var end = fileName.substr(11);    // s_ 제거
         
         getLink = "/displayFile?fileName=" + front + end;
      } else {
         imgsrc = "resources/images/file.png";
         fileLink = fullName.substr(7);
         getLink = "/displayFile?fileName=" + fullName;
      }
      
      fileName = fileLink.substr(fileLink.indexOf("_")+1);
      
      return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
   }
</script>

<jsp:include page="include/accountingModal.jsp" />
