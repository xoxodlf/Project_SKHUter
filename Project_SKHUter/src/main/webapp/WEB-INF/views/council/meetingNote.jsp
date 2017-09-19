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
	div.leftAlign{
		text-align:left;
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
<body>
<div class="row">
	<div class="col-lg-12">
		<img src="/resources/images/title/meeting_note.png" class="page-header" style="width: 18%;">
	</div>
</div>
<div class="col-lg-12">
	<div class="panel-body">
           	<div class="board-btns">
				<div class="board-btn">
					<button type="button" class="btn btn-danger">삭제</button>
				</div>
				<div class="board-btn">
					<button type="button" data-toggle="modal" data-target="#doMeetingModal" class="btn btn-default">등록</button>
				</div>
			</div>
            <div class="row" style="margin-top: 20px">
               <div class="col-lg-4" style="text-align:left">
                  <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                           <input type="checkbox" class="posit" >
                     </div>
                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 나상연
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
               </div>
            
                <div class="col-lg-4" style="text-align:left">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList" class="posit">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 이종윤
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4" style="text-align:left">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 김희태
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="row" style="margin-top: 20px">
                <div class="col-lg-4" style="text-align:left">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 김희태
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                <div class="col-lg-4" style="text-align:left">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 김희태
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                <div class="col-lg-4" style="text-align:left">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 김희태
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                </div>
            </div>
           </div>
            <!-- /.row -->
</body>
<jsp:include page="include/doMeetingModal.jsp" />