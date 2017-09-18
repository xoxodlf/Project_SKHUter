<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Navigation -->
<nav class="navbar navbar-default sidebar" role="navigation">

		<div class="sidebar-nav navbar-collapse">
			<a class="navbar-brand" href="/">
			<img src="/resources/images/logo2.png" style="width: 180px; margin-left: 20px"> </a>

			<div class="row" id="modalWrapper">
				<div class="col-xs-10 col-sm-10">
					<div style="color: white; font-size: 20px; text-align: center; margin-top: 30px">스쿠터</div>
				</div>
			</div>

			<ul class="nav" id="side-menu" style="margin-top: 10%">
				<li id="studentList">
					<a href="/user/userList" style="color: white;"><i class="fa fa-th-list fa-fw"></i> 학생 목록 </a>
				</li>
				<li id="council">
					<a href="#" style="color: white;"><i class="fa fa-users fa-fw"></i> 학생회<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="councilSchedule">
                              <a href="/council/councilSchedule"><i class="fa fa-calendar-o fa-fw"></i> 학생회 일정 </a>
                          </li>
                          <li id="meetingNote">
                                <a href="/council/meetingNote"><i class="fa fa-book  fa-fw"></i> 학생회 회의록 </a>
                          </li>
                      </ul>
				</li>
				<li id="notice">
					<a href="#" style="color: white;"><i class="fa fa-bullhorn fa-fw"></i> 공지사항<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="noticeMenu">
                              <a href="/notice/noticeList"><i class="fa fa-star fa-fw"></i> 공지사항 </a>
                          </li>
                          <li id="stuSchedule">
                                <a href="/notice/stuSchedule"><i class="fa fa-calendar-o fa-fw"></i> 학사 일정 </a>
                          </li>
                          <li id="vote">
                                <a href="/notice/vote"><i class="fa fa-thumbs-up fa-fw"></i> 투표 </a>
                          </li>
                          <li id="accounting">
                                <a href="/notice/accountingList"><i class="fa fa-money fa-fw"></i> 회계 내역 </a>
                          </li>
                      </ul>
				</li>
				<li id="board">
					<a href="/board/boardList" style="color: white;"><i class="fa fa-comments fa-fw"></i> 익명 게시판 </a>
				</li>
				<li id="logout">
					<a href="/" style="color: white;"><i class="fa fa-sign-out fa-fw"></i> 로그아웃 </a>
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	<!-- /.navbar-static-side -->
</nav>