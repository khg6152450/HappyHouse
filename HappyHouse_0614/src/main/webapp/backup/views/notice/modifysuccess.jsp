<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Happy House 공지사항 성공</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script
	src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>

<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
			<div class="container" align="center">
			<h2>공지사항 수정..완료</h2>
			<p>
				<a href="${root}/noticeList">글목록 가기</a>
			</p>
			</div>
		<footer>
			<%@ include file="/resources/menu/footer.html"%>
		</footer>
		</div>
	</div>
</body>
</html>
