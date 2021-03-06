<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>
<body>
		<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
		<div class="container" align="center">
	<div class="col-lg-6">
	  <div class="jumbotron">
	<h2>회원정보 변경이 완료 되었습니다.</h2>
	<a href="<c:url value="/logout"/>">홈화면으로 이동</a>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>