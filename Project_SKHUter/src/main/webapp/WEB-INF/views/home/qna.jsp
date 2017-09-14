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

								<!-- contact section -->
								<div class="item-slide show">
									<!-- container -->
									<div class="container">
										<div class="row">
											<div class="col-md-10 col-md-offset-1">

												<!-- header section -->
												<div class="header-section animated bounceInDown"
													data-animation-delay="700">
													<!-- title section -->
													<h2 class="title-section">Contact Us</h2>
													<!-- /title section -->
													<div class="line-separate line-white line-center">
														<span></span>
													</div>
												</div>
												<!-- /header section -->

												<!-- content slide -->
												<div class="content-slide aboutus">
													<div class="row">
														<div class="col-xs-12 col-md-6 animated bounceInLeft"
															data-animation-delay="700">
															<h3>Do You Have a Question ?</h3>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit, sed do eiusmod tempor incididunt ut
																labore et dolore magna aliqua.</p>


															<!-- contact form -->
															<form method="post" action="../../send-mail.php"
																class="contact-form">

																<input type="text" name="name" placeholder="Name"
																	class="required"> <input type="email"
																	name="email" placeholder="Email address"
																	class="contact-form-email required"> <input
																	type="text" name="subject" placeholder="Subject"
																	class="contact-form-subject">

																<textarea name="message" placeholder="Message"
																	class="required" rows="7"></textarea>

																<div class="response-message"></div>
																<button class="border-button" type="submit" id="submit"
																	name="submit">Send Message</button>

															</form>
															<!-- /contact form -->
														</div>
														<!-- /col-xs-12 col-md-6 -->

														<!-- maps section -->
														<div
															class="col-xs-12 col-md-6 maps-section animated bounceInRight"
															data-animation-delay="700">
															<div class="big-maps center">
																<ul>
																	<li><span>address: </span> New York</li>
																	<li><span>call us: </span><a href="tel:123456789">123
																			456 789</a></li>
																	<li><span>Fax: </span><a href="tel:123456789">123
																			456 789</a></li>
																	<li><span>email: </span><a href="#">support@mail.com</a></li>
																	<li><span>Website: </span><a href="#">www.templatestock.cm</a></li>
																</ul>
																<div id="map1"></div>
															</div>
														</div>
														<!-- /maps section -->
													</div>
													<!-- /row -->

												</div>
												<!-- /content slide -->
											</div>
										</div>
										<!-- /row -->
									</div>
									<!-- /container -->
								</div>
								<!-- /contact section -->

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


	<!-- JS -->
	<script type="text/javascript" src="/resources/js/home/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/retina.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="/resources/js/home/jquery.countdown.min.js"></script>
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