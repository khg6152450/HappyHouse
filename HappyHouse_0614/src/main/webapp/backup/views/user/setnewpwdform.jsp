<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>
<body>
	<div>
		<div>${errMsg}</div>
		<form method="post" action="<c:url value="/member.do"/>">
		<input type="hidden" name="act" value="setnewpwd">
				<div>
					<label>새로운 비밀번호</label>
					<input type="password" name="pw1"/>
				</div>
				<div>
					<label>비밀번호 확인</label>
					<input type="password" name="pw2"/>
				</div>
				<div>
					<button>비밀번호 설정</button>
				</div>
		</form>
	</div>
</body>
</html>