<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<c:choose>
		<c:when test="${not empty memberInfo}">
			<c:redirect url="/member.do?act=setnewpwdform"></c:redirect>
		</c:when>
		<c:otherwise>
			<h3>${errMsg}</h3>
			<a href="<c:url value="/member.do?act=findpwdform"/>">비밀번호 찾기</a>
		</c:otherwise>
	</c:choose>
</body>
</html>