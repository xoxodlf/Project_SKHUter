<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>스쿠터</title>
	
	<!-- 파비콘 설정 -->
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/skhuter.ico" />
	
	
    <!-- SweetAlert JavaScript -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    
</head>

<body>
	<div id="wrapper">
		

		<section id="empty">
        	<tiles:insertAttribute name="content" />
   		</section>
		
	</div>

</body>
</html>