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
		  <li><img src="/resources/images/slider/slider4.jpg" /></li>
		</ul>
    </div>
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
