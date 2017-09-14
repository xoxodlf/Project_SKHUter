<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<!-- META DATA -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>스쿠터</title>

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="/resources/css/home/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/home/style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" type="text/css" href="/resources/css/home/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/ionicons.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/animate.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/flexslider.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/owl.carousel.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/owl.theme.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/vegas.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/menu.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/home/sidebar.css" />

<!-- Fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,700italic,400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700,900' rel='stylesheet' type='text/css'>

<!-- JS -->
<script type="text/javascript" src="/resources/js/home/modernizr.js"></script>
<script type="text/javascript" src="/resources/js/home/snap.svg-min.js"></script>

<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>

<body class="image-background">
	
	<!-- Preloader -->
	<div id="preloader">
		<div id="loading-animation">&nbsp;</div>
	</div>
	<!-- /Preloader -->

	<!-- Overlay -->
	<div id="section-home" class="home-section-wrap center">
		<div class="section-overlay"></div>
	</div>
	<!-- /Overlay -->

	<!-- container -->
	<div class="containers">
		<!-- menu -->
		<nav id="menu" class="menu">
			<button class="menu__handle">
				<span>Menu</span>
			</button>
			<div class="menu__inner">
				<ul>
					<li><a href="/"><i class="fa fa-fw fa-home"></i><span>Home</span></a></li>	
					<li><a href="/about"><i class="fa fa-fw fa-info"></i><span>About</span></a></li>
					<li><a href="/qna"><i class="fa fa-fw fa-envelope"></i><span>Q & A</span></a></li>
					<li><a href="/team"><i class="fa fa-fw fa-users"></i><span>Team</span></a></li>
				</ul>
			</div>
			<div class="morph-shape"
				data-morph-open="M300-10c0,0,295,164,295,410c0,232-295,410-295,410"
				data-morph-close="M300-10C300-10,5,154,5,400c0,232,295,410,295,410">
				<svg width="100%" height="100%" viewBox="0 0 600 800" preserveAspectRatio="none">
					<path fill="none" d="M300-10c0,0,0,164,0,410c0,232,0,410,0,410" />
				</svg>
			</div>
		</nav>
		<!-- /menu -->

		<!-- main -->
		<div class="main">
			<!-- header -->
			<header class="header-site">
				<div class="logo-site animated bounceInDown" data-animation-delay="700">
					<img class="img-responsive" src="/resources/images/logo.png" alt="Logo" />
				</div>
			</header>
			<!-- /header -->

			<!-- section -->
			<section class="section fullscreen site-main">
				<div class="container-section">
					<div class="container-table">
						<div class="content-table">
							<!-- bt-carousel -->
							<div class="bt-carousel">

								<!-- home section -->
								<div class="item-slide show">
									<!-- container -->
									<div class="container">
										<div class="row">
											<div class="col-md-10 col-md-offset-1">
											
												<!-- header section -->
												<div class="header-section animated bounceInDown" data-animation-delay="700">
													<div class="line-separate line-white line-center">
														<span></span>
													</div>
												</div>
												<!-- /header section -->

												<!-- content slide -->
												<div class="content-slide">

													<!-- Subscribe Form -->
													<div class="form animated bounceInUp" data-animation-delay="700">
														<!-- container form -->
														<div class="container-form">
															<!-- section page -->
															<form method="post" action="" class="login-form">
																<div class="section-page" id="signup">
																	<input type="text" name="id" placeholder="ID" class="required"> <br>
																	<input type="password" name="password" placeholder="Password" class="contact-form-email required"> <br>
																	
																	<br>
																	<button class="border-button" type="submit" id="loginBtn" name="loginBtn">로그인</button> <br> <br>
																	
																	<a data-toggle="modal" data-target="#registerModal">회원가입</a> / 
																	<a data-toggle="modal" data-target="#findIdPwModal">비밀번호 찾기</a>
																	
																<p class="message-error"></p>
																<p class="message-success"></p>
																</div>
															</form>
															<!-- /section page -->
														</div>
														<!-- /container form -->
													</div>
													<!-- /Subscribe Form -->

													<!-- copyright -->
													<footer class="copy-right animated bounceInUp"
														data-animation-delay="700">
														<div class="copyright"> <br>
															© 2017 Classs / SKHU - All Rights Reserved
														</div>
													</footer>
													<!-- /copyright -->

												</div>
												<!-- /content slide -->
											</div>
										</div>
										<!-- /row -->
									</div>
									<!-- /container -->
								</div>
								<!-- /home section -->

							</div>
							<!-- /bt-carousel -->
						</div>
					</div>
				</div>
			</section>
			<!-- /section -->
		</div>
		<!-- /main -->
		
	</div>
	<!-- /container -->
	
	<!-- Modal -->
	<jsp:include page="user/include/registerModal.jsp" />
	<jsp:include page="user/include/findIdPwModal.jsp" />

	<!-- JS -->
	<script type="text/javascript" src="/resources/js/home/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/retina.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.parallaxify.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.particleground.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/vegas.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/trianglify.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.mb.YTPlayer.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/home/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.appear.js"></script>
	<script type="text/javascript" src="/resources/js/home/classie.js"></script>
	<script type="text/javascript" src="/resources/js/home/sidebar.js"></script>
	<script type="text/javascript" src="/resources/js/home/main.js"></script>

</body>
</html>