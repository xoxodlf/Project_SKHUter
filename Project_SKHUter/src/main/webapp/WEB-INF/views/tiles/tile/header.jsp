<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 

<style>
@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

* {
	font-family: 'LotteMartDream';
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-default sidebar" role="navigation">

		<div class="sidebar-nav navbar-collapse">
			<a class="navbar-brand" href="/home"> <img src="/resources/images/logo2.png" style="width: 180px; margin-left: 20px"> </a>

			<div class="row" id="modalWrapper">
				<div class="col-xs-10 col-sm-10">
					<div style="font-size: 25px;text-align: center;margin-top: 50px;margin-bottom: 5px;">
						<a data-toggle="modal" data-target="#modifyModal" style="color: white;"> ${m:urlDecode(cookie.CookieForUser.value)} </a>
					</div>
				</div>
			</div>
		 <form action="/user/logout" id="logout">
			<ul class="nav" id="side-menu" style="margin-top: 10%">
				<li id="studentList">
					<a href="/user/userList" style="color: white;"><i class="fa fa-th-list fa-fw"></i> 학생 목록 </a>
				</li>
				<li id="council">
					<a href="#" style="color: white;"><i class="fa fa-users fa-fw"></i> 학생회<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="councilSchedule">
                              <a href="/council/councilSchedule" style="color: white;"><i class="fa fa-calendar-o fa-fw"></i> 학생회 일정 </a>
                          </li>
                          <li id="meetingNote">
                                <a href="/council/meetingNote" style="color: white;"><i class="fa fa-book  fa-fw"></i> 학생회 회의록 </a>
                          </li>
                      </ul>
				</li>
				<li id="notice">
					<a href="#" style="color: white;"><i class="fa fa-bullhorn fa-fw"></i> 공지사항<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="noticeMenu">
                              <a href="/notice/noticeList" style="color: white;"><i class="fa fa-star fa-fw"></i> 공지사항 </a>
                          </li>
                          <li id="stuSchedule">
                                <a href="/notice/stuSchedule" style="color: white;"><i class="fa fa-calendar-o fa-fw"></i> 학사 일정 </a>
                          </li>
                          <li id="vote">
                                <a href="/notice/voteList" style="color: white;"><i class="fa fa-thumbs-up fa-fw"></i> 투표 </a>
                          </li>
                          <li id="accounting">
                                <a href="/notice/accountingList" style="color: white;"><i class="fa fa-money fa-fw"></i> 회계 내역 </a>
                          </li>
                      </ul>
				</li>
				<li id="board">
					<a href="/board/boardList" style="color: white;"><i class="fa fa-comments fa-fw"></i> 익명 게시판 </a>
				</li>
				<li id="logout">
					<a href="#" class="logout" style="color: white;"><i class="fa fa-sign-out fa-fw"></i> 로그아웃 </a>
				</li>
			</ul>
			</form>
		</div>
		<!-- /.sidebar-collapse -->
	<!-- /.navbar-static-side -->
</nav>


<script>

$('.logout').on('click', function() {
    swal({
       title: '로그아웃 하시겠습니까?',
       text: "",
      type: 'warning',
       showCancelButton: true,
      confirmButtonColor: '#3085d6',
       cancelButtonColor: '#d33',
       confirmButtonText: 'YES',
       cancelButtonText: 'NO'
    }).then(function () {
       document.getElementById("logout").submit();
     })
 });

</script>

<!-- Modal -->
<jsp:include page="modifyModal.jsp" />