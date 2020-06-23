<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지 페이지</title>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>

<body>
<div style="display: block;">
	<div>
		<%@ include file="/resources/menu/header.jsp"%>
	</div>
	<div style="background-color: white">
	<div align="center">
		<div></div>
		<div></div>
		<c:if test="${user == null}">
			<h3>로그인 해주세요</h3>
		</c:if>
		<c:if test="${user != null}">
			<c:if test="${user.id != 'admin'}">
				<div>
					<strong>${user.name}</strong> 회원님 환영합니다.
				</div>
				<a href="${root}/noticeList">공지사항 목록</a>
				<br>
			</c:if>
			<c:if test="${user.id == 'admin'}">
				<div>
					관리자님 환영합니다.
				</div>
				<a href="${root}/writeNotice">공지사항 쓰기</a>
				<br>
				<a href="${root}/noticeList">공지사항 목록</a>
			</c:if>
		</c:if>
	</div>
	<footer>
			<%@ include file="/resources/menu/footer.html" %>
		</footer>
	</div>	
	</div>
</body>
</html>