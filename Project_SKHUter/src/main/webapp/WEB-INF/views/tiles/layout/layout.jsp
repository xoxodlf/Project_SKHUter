<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>스쿠터</title>

	
	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link href="/resources/css/bootstrap.vertical-tabs.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
	
    <!-- SweetAlert CSS -->
    <link href="/resources/css/sweetalert2.min.css" rel="stylesheet">
    
    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- 원래커스텀자리 -->
    <!-- Custom CSS -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">
    
	<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>

    <!-- SweetAlert JavaScript -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    
    <script src="/resources/js/bootstrap-datetimepicker.js"></script>
    <script src="/resources/js/bootstrap-datetimepicker.ko.js"></script>
    
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrapper">
		 <header id="header">
        	<tiles:insertAttribute name="header" />
    	</header>

		<section id="siteContent">
        	<tiles:insertAttribute name="content" />
   		</section>
		<footer id="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>

</body>
</html>