<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- bxSlider Javascript file -->
<script src="/resources/js/home/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/resources/css/home/jquery.bxslider.css" rel="stylesheet" />

<style>

.foot {
	background: white;
}

.panel-today {
	background: #a8c8f9;
}

.panel-memo {
	background: #c2e0ba;
}

</style>
<div id="page-wrapper">
	<div class="col-md-12" style="margin-top: 50px">
		<ul class="bxslider">
		  <li><img src="/resources/images/slider/slider1.jpg" /></li>
		  <li><img src="/resources/images/slider/slider2.jpg" /></li>
		  <li><img src="/resources/images/slider/slider3.jpg" /></li>
		  <li><img src="/resources/images/slider/slider3.jpg" /></li>
		</ul>
    </div>
    
    <div class="col-md-12" style="margin-top: 30px">
		<div class="col-lg-6 col-md-6">
			<div class="col-lg-12 col-md-12">
				<div class="panel panel-today">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 text-center">
								<div class="huge">오늘의 일정</div>
							</div>
						</div>
					</div>
					<div class="panel-footer" style="background-color: white; height: 15em">
						<div class="row"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6 col-md-6">
			<div class="col-lg-12 col-md-12" style="height: 50%">
				<div class="panel panel-memo">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 text-center">
								<div class="huge">공지사항</div>
							</div>

						</div>
					</div>
					<div class="panel-footer textarea" style="background-color: white; height: 15em">
						<div class='row'></div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

<script>
/** 이미지 슬라이더 적용 */
$(document).ready(function(){
	  $('.bxslider').bxSlider(
		{ auto: true, autoControls: true}	  
	  );
});
</script>
