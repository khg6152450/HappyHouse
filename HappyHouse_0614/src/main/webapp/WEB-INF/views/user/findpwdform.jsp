<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
</head>
<body>
	<div class="container">
		<h2 style="text-align: center">비밀번호 찾기</h2>
		<form method="post" action="<c:url value="/member.do"/>">
			<input type="hidden" name="act" value="findpwd">
			<div class="form-group">
				<label>아이디 :</label>
				<input type = "text" name="id" class="form-control">			
			</div>
			<div class="form-group">
				<label>이름 :</label>
				<input type = "text" name="name" class="form-control">			
			</div>
			<div class="form-group">
				<label>전화번호 :</label>
				<input type = "text" name="phoneNum" class="form-control">			
			</div>
			<div style="float: right">
				<button class="btn btn-primary">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</body>
</html>