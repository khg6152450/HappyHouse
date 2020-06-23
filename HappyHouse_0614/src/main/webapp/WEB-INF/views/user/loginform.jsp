<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
<script type="text/javascript">
window.onload = function(){
	var btn = document.getElementById("btn1");
	btn.addEventListener('click', function(){
		var frm = document.getElementById("frm");
		frm.submit();
	})
</script>
</head>
<body>
<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
	<div class="container" style="background-color: white">
		<form id="frm" method="post" action="login">
			<br>
			<h2 style="text-align: center"> 로그인 </h2>
			<div class="form-group">
				<label> 아이디 </label>
				<input type="text" name="id" class="form-control">
			</div>
			<div class="form-group">
				<label> 비밀번호 </label>
				<input type="password" name="password" class="form-control">
			</div>
			<div>
				<button class="btn btn-primary">로그인</button>
				<input type="button" value="비밀번호 찾기" onClick="location.href='${root}/member.do?act=findpwdform'" class="btn btn-primary">
			</div>	
		</form>
	</div>
	<footer>
			<%@ include file="/resources/menu/footer.jsp" %>
		</footer>
	</div>
</body>
</html>