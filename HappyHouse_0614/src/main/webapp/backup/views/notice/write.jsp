<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Happy House 공지사항작성</title>
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
	function writeNotice() {
		if (document.getElementById("subject").value == "") {
			alert("제목 입력!!!!");
			return;
		} else if (document.getElementById("content").value == "") {
			alert("내용 입력!!!!");
			return;
		} else {
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
			<div class="container" align="center">
				<div class="col-lg-6" align="center">
					<h2>공지사항 쓰기</h2>
					<form id="writeform" method="post"
						action="<c:url value="writeNotice"/>">
						<input type="hidden" id="adminid" name="adminid"
							value="${user.id}">
						<div class="form-group" align="left">
							<label for="subject">제목:</label> <input type="text"
								class="form-control" id="subject" name="subject">
						</div>
						<div class="form-group" align="left">
							<label for="content">공지내용:</label>
							<textarea class="form-control" rows="15" id="content"
								name="content"></textarea>
						</div>
						<button type="button" class="btn btn-primary"
							onclick="javascript:writeNotice();">글작성</button>
						<button type="reset" class="btn btn-warning">초기화</button>
					</form>
				</div>
			</div>
			<footer>
				<%@ include file="/resources/menu/footer.html"%>
			</footer>
		</div>
	</div>
</body>
</html>