<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- FlexSlider CSS -->
<link href="/resources/css/flexslider.css" rel="stylesheet">

<style>

.foot {
	background: white;
}

#memo {
	overflow: auto;
	height: 250px;
	width: 100%;
	border: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
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
	<!--slider-->
	<div id="slider" class="flexslider">
        <ul class="slides">
            <li>
            	<img src="/resources/images/slider/slider1.jpg">
            </li>
            <li>
            	<img src="/resources/images/slider/slider2.jpg">
            </li>
            <li>
            	<img src="/resources/images/slider/slider3.jpg">
            </li>
        </ul>
    </div>
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

