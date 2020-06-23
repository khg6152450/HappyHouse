<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상권 목록 페이지</title>
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
<script type="text/javascript">
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").submit();
	}

	$("#searchBtn").on("click", function() {

	});
</script>
</head>
<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white;">
			<div class="container" align="center">
				<div class="col-lg-6" align="center">
					<form name="pageform" id="pageform" method="post"
						action="<c:url value="/store" />">
						<input type="hidden" name="act" value="list" /> <input
							type="hidden" name="pg" id="pg" value="">
						<div style="padding: 20px;">
							<select name="searchType">
								<option value="all">전체</option>
								<option value="dong">동</option>
								<option value="codename3">업종</option>
							</select> <input type="text" name="searchWord" />
							<button class="btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="container">
				<table class="table table-bordered">
					<tr>
						<th>번호</th>
						<th>가게명</th>
						<th>업종</th>
						<th>주소</th>
					</tr>
					<c:forEach var="store" items="${list}">
						<tr>
							<td>${store.no}</td>
							<td>${store.shopname}</td>
							<td>${store.codename3}</td>
							<td>${store.address}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="margin-left: 200px;">${navigation.navigator}</div>
		<footer>
			<%@ include file="/resources/menu/footer.jsp"%>
		</footer>
		</div>
	</div>
</body>
</html>