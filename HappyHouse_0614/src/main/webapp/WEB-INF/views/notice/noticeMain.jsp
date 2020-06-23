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
<style>
h2{
font-size: 2rem;
    margin-bottom: 50px;
    padding-top: 16%;
}
</style>
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
			<h3>로그인이 필요한 페이지입니다.</h3>
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
			<div style="height: 500px;">
				<h2>관리자님 환영합니다.</h2>
				<a href="${root}/writeNotice">공지사항 쓰기</a>
				<br>
				<a href="${root}/noticeList">공지사항 목록</a>
				</div>
			</c:if>
		</c:if>
	</div>
	</div>
	<footer>
			<%@ include file="/resources/menu/footer.jsp" %>
		</footer>
	</div>
</body>
</html>