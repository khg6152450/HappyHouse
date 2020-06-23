<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Happy House Q&A 목록</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
<link href="${pageContext.request.contextPath}/resources/static/js/app.1a7cefb2.js" rel=preload as=script>
<link href="${pageContext.request.contextPath}/resources/static/js/chunk-vendors.3f52ffc7.js" rel=preload as=script>
<style>
#searchDiv{
  margin-left: 385px;
  margin-top: 2rem;
  margin-bottom: 1rem;
}
h2{
	padding-top: 2rem;
}
</style>
</head>
<body>
<div style="display: block;">
	<div>
		<%@ include file="/resources/menu/header.jsp"%>
	</div>
	<div style="background-color: white">
	<div id=app></div>
	</div>
	<div>
	<script src="${pageContext.request.contextPath}/resources/static/js/chunk-vendors.3f52ffc7.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/app.1a7cefb2.js"></script>
	</div>
	<footer>
			<%@ include file="/resources/menu/footer.html" %>
	</footer>
	</div>
</body>
</html>
