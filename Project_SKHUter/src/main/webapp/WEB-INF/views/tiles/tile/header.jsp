<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.profile {
	width: 70px;
	height: 70px;
	border-radius: 70px;
	overflow: hidden;
	margin-left: 70%;
	float: left;
	margin-top: 50%;
}

.profile img {
	height: 70px;
	width: 70px;
}

.sidebar .sidebar-nav.navbar-collapse {
	overflow: hidden;
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-default sidebar" role="navigation">

	<div class="navbar-default sidebar" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- /.navbar-header -->

		<div class="sidebar-nav navbar-collapse">
			<a class="navbar-brand" href="/">
			<img src="/resources/images/logo2.png" style="width: 180px; margin-left: 20px"> </a>

			<div class="row" id="modalWrapper">
				<div class="col-xs-6 col-sm-6">
					<div class="profile"> <img src='/resources/images/team.png'> </div>
				</div>

				<div class="col-xs-10 col-sm-10">
					<div style="color: white; font-size: 20px; text-align: center; margin-top: 10px">스쿠터</div>
				</div>
			</div>

			<ul class="nav" id="side-menu" style="margin-top: 10%">
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 학생회 관리<span class="fa arrow"></span></a>
				</li>
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 공지 관리<span class="fa arrow"></span></a>
				</li>
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 익명 게시판 </a>
				</li>
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 가입 신청 목록 </a>
				</li>
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 인수인계 </a>
				</li>
				<li>
					<a href="#" style="color: white;"><i class="fa fa-bar-chart-o fa-fw"></i> 로그아웃 </a>
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>