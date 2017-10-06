<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* 기타 */
	
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
		<img src="/resources/images/title/user_list.png" class="page-header" style="width: 20%">
	</div>
</div>
<div class="col-lg-12">
<div class="panel-body">
	<div class="board-btns">
	<div class="board-btn">
	
	<select id="selectStatus" class="form-control" style="width:23%; display: inline-block; text-align: center;">
        					<option value="0">승인 대기</option>
        					<option value="1">일반 학생</option>
        					<option value="2">학생회</option>
        					<option value="3">회장단</option>
      					</select>
	<button id="changeStatusBtn" type="button" class="btn btn-default" onmouseover="throwStatus()">등급 변경</button>

		
	</div>
	<div class="board-btn">
		<button id="takeoverBtn" type="button" class="btn btn-default" data-toggle="modal" >인수인계</button>
	</div>
	</div>
	<!-- div.board-btns -->
	<br/>
	
	<div class="table-responsive">
	<form id="userForm" role="form" method="post" action="/user/userList/changeStatus">
	<input type="hidden" id="Status"  name="Status">
		<table class="table table-hover">
			<colgroup>
				<col width="7%"/>
				<col width="7%"/>
				<col width="*"/>
				<col width="7%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
				<th>전체<br/><input type="checkbox" id="checkall"/></th>
				<th>No</th>
				<th>학번　</th>
				<th>학년　</th> 
				<th>이름　</th>
				<th>휴대폰 번호</th>
				<th>등록일</th>
				<th>등급</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty list }">
					<div style="margin-top: 10%">
						<p style="text-align: center; font-size: 20px"> <mark>회원 목록이 존재하지 않습니당</mark></p>
					</div>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${list }" var="userList" varStatus="status">
						<tbody>
							<tr>
								<td><input type="checkbox" name="check" value="${userList.userNo }" /></td>
								<td>${userList.userNo }</td>
								<td>${userList.id}</td>
								<td>${userList.grade}</td>
								<td>${userList.name }</td>
								<td>${userList.phone }</td>
								<td>${userList.recentLogin }</td>
								<td> 
								<c:choose>
									<c:when test="${1 eq userList.secession }">
										<font color="red"> 탈퇴 회원 </font>   
									</c:when>
									<c:otherwise>
										<c:if test="${0 eq userList.status}">
											<font color="blue"> 승인 대기 </font>
										</c:if>
										<c:if test="${1 eq userList.status}">
											<font color="green"><strong>일반 학생 </strong></font>
										</c:if>
										<c:if test="${2 eq userList.status}">
											<font color="green"><strong>학생회 </strong></font>
										</c:if>
										<c:if test="${3 eq userList.status}">
											<font color="green"><strong>회장단 </strong></font>
										</c:if>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</c:otherwise>
			
			</c:choose>
		</table>
		</form>
		<form id="takeoverform" role="form" method="post" action="/user/userList/takeover">
		<input type="hidden" name="giverNo" value="${login.userNo}">
		<input type="hidden" name="takerNo" id="takerNo">
		<input type="hidden" name="takeoverCode" id="takeoverCode">
		</form>
		<!-- end of table -->
	</div>
	<!-- div.table-responsive -->
</div>
<!-- div.panel-body -->
</div>
<!-- div.col-lg-12 -->

<script>
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
function throwStatus(){
	var status = $("#selectStatus option:selected").val();
	console.log(status);
	$('input#Status').val(status);
	
}

$('#changeStatusBtn').on('click',(function() {
			var link = $("form#scheduleForm");
			console.log(link);
			 swal({
	               title: '등록 하시겠습니까?',
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
	    			form.attr("action", "/user/userList/changeStatus");
	    			form.submit();
	    			link = '';
	            })
		}));
		
$('#takeoverBtn').on('click',(function() {
	var link = $("form#takeoverform");
	console.log(link);
	var takerNo= $("input[name=check]:checked").val();
	$("input#takerNo").val(takerNo);
	console.log(takerNo);
	$('input#Status').val(status);
	var code = Math.floor(Math.random()*100000000);
	$("input#takeoverCode").val(code);
	console.log(code);
	
	 swal({
           title: '정말 인계를 진행하시겠습니까?',
           text: "",
           type: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: 'YES',
           cancelButtonText: 'NO'
        }).then(function (){
        	 swal({
        		    type: 'info',
        		    title: 'code: '+code,
        		    text: "인계자에게 코드를 알려주세요!"
        	}).then(function (){
            	var form = link;
    			var arr = [];
    			form.attr("action", "/user/userList/takeover");
    			form.submit();
    			link = '';
            })
        })
}));
		
		
</script>
