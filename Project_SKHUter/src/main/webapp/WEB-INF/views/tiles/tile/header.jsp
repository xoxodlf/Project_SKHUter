<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.sidebar .sidebar-nav.navbar-collapse {
	overflow: hidden;
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-default sidebar" role="navigation">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="dropdown" data-target="#navbar">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- /.navbar-header -->

		<div class="sidebar-nav navbar-collapse" id="navbar">
			<a class="navbar-brand" href="/">
			<img src="/resources/images/logo2.png" style="width: 180px; margin-left: 20px"> </a>

			<div class="row" id="modalWrapper">
				<div class="col-xs-10 col-sm-10">
					<div style="color: white; font-size: 20px; text-align: center; margin-top: 30px">스쿠터</div>
				</div>
			</div>

			<ul class="nav" id="side-menu" style="margin-top: 10%">
				<li id="studentList">
					<a href="/notice/userList" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 학생 목록 </a>
				</li>
				<li id="council">
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 학생회<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="councilSchedule">
                              <a href="#">학생회 일정</a>
                          </li>
                          <li id="meetingNote">
                                <a href="/council/meetingNote">학생회 회의록</a>
                          </li>
                      </ul>
				</li>
				<li id="notice">
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 공지사항<span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li id="noticeMenu">
                              <a href="/notice/noticeList">공지사항</a>
                          </li>
                          <li id="schoolSchedule">
                                <a href="#">학사 일정</a>
                          </li>
                          <li id="vote">
                                <a href="/vote/vote">투표</a>
                          </li>
                          <li id="accounting">
                                <a href="#">회계 내역</a>
                          </li>
                      </ul>
				</li>
				<li id="board">
					<a href="/board/boardList" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 익명 게시판 </a>
				</li>
				<li id="logout">
					<a href="/" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 로그아웃 </a>
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	<!-- /.navbar-static-side -->
</nav>