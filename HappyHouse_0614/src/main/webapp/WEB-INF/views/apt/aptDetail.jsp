<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 상세 정보 페이지</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script
	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
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
<style type="text/css">
</style>
<script type="text/javascript">
	function writeComment() {
		if (document.getElementById("content").value == "") {
			alert("내용 입력!!!!");
			return;
		} else {
			document.getElementById("commentform").submit();
		}
	}
</script>
</head>
<body>
<script>
// 	var a = `${apt.dealAmount}`;
// 	var b = `${apt.area}`;
// 	var c = a/b;
// 	console.log(c);
</script>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
			<div>
				<h2 style="text-align: center; padding: 20px;">아파트 거래 정보</h2>
			</div>
			<div style="text-align: center;">
				<a href="<c:url value="/search"/>">전체 매매 목록</a> &ensp;
				<a href="<c:url value="/isafe"/>">아이지킴이 정보</a>
			</div>
			<div>
				<div class="container">
					<table class="table table-bordered">
						<tr>
							<th>주택명</th>
							<td>${apt.aptName}</td>
						</tr>
						<tr>
							<th>거래금액</th>
							<td>${apt.dealAmount}</td>
						</tr>
						<tr>
							<th>월세금액</th>
							<c:if test="${empty rentMoney}">
								<td>없음</td>
							</c:if>
						</tr>
						<tr>
							<th>건축연도</th>
							<td>${apt.buildYear}</td>
						</tr>
						<tr>
							<th>전용면적</th>
							<td>${apt.area}</td>
						</tr>
						<tr>
							<th>거래일</th>
							<td>${apt.dealYear}년${apt.dealMonth}월${apt.dealDay}일</td>
						</tr>
						<tr>
							<th>법정동</th>
							<td>${apt.dong}</td>
						</tr>
						<tr>
							<th>지번</th>
							<td>${apt.jibun}</td>
						</tr>
					</table>
				</div>
				<div class="container" id="table2" style="display: none;">
					<div>
						<h2 style="text-align: center; padding: 20px;">최근 거래 정보</h2>
					</div>
					<table class="table mt-2">
						<thead>
							<tr>
								<th>이름</th>
								<th>층</th>
								<th>면적</th>
								<th>거래가격(만원)</th>
								<th>거래일</th>
							</tr>
						</thead>
						<tbody id="result2">
						</tbody>
					</table>
				</div>
				<div class="container" style="text-align: center; padding: 20px;">
					<h2 onclick="scoreOn()" style="display: inline;">사용자 평가</h2>
					&emsp;&emsp;
					<h2 onclick="compareOn()" style="display: inline;">아파트 비교</h2>					
				</div>
				<div class="container">
					<div class="container" id="table3" style="display: none;">
						<table class="table mt-2">
							<thead>
								<tr>
									<th>작성자</th>
									<th>내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="result3">
							</tbody>
						</table>

						<c:if test="${user == null}">
							<h3></h3>
						</c:if>
						<c:if test="${user != null}">
							<form id="commentform" method="post"
								action="<c:url value="/writeComment"/>">
								<input type="hidden" id="aptNo" name="aptNo" value="${apt.no}">
								<input type="hidden" id="aptName" name="aptName"
									value="${apt.aptName}"> <input type="hidden"
									id="userName" name="userName" value="${user.id}">
								<textarea cols="100" id="content" name="content"></textarea>
								<button type="button" class="btn btn-primary"
									onclick="javascript:writeComment();">글작성</button>
							</form>
						</c:if>
					</div>
				</div>				
				<hr>
				<div class="container">
					<div id="table4" style="display: none;">
					<div class="container" style="text-align: center;">
						<!-- 리스트 -->						
						<h4 id="list1" onclick="select('list1')" style="display: inline;"></h4>
						&emsp;&emsp;
						<h4 id="list2" onclick="select('list2')" style="display: inline;"></h4>
						&emsp;&emsp;
						<h4 id="list3" onclick="select('list3')" style="display: inline;"></h4>
						&emsp;&emsp;
						<h4 id="list4" onclick="select('list4')" style="display: inline;"></h4>
						&emsp;&emsp;
						<h4 id="list5" onclick="select('list5')" style="display: inline;"></h4>
					</div>
					<table class="table mt-4">
						<thead>
						<c:if test="${user != null}">
							<tr>
								<th style="width: 25%; text-align: center;">사용자 설정 금액</th>
								<th class="test" style="display: none; width: auto;"></th>
								<th style="width: 25%; text-align: center;">사용자 선호 건축연도</th>
								<th style="width: 25%; text-align: center;">사용자 선호 전용면적</th>
								<th class="test" style="display: none; width: auto;"></th>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">${user.amount}</td>
								<th class="test" style="display: none; width: auto;"></th>
								<td style="width: 25%; text-align: center;">${user.buildYear}</td>
								<td style="width: 25%; text-align: center;">${user.area}</td>
								<th class="test" style="display: none; width: auto;"></th>
							</tr>
							<hr>
						</c:if>
							<tr>
								<th style="width: 25%; text-align: center;">${apt.aptName}</th>
								<th class="test" style="display: none; width: auto;"></th>
								<th style="width: 25%; text-align: center;">이름</th>
								<th style="width: 25%; text-align: center;" id="compare1"></th>	
								<th class="test" style="display: none; width: auto;"></th>							
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">${apt.dealAmount}</td>
								<th class="test1-1" style="display: none; width: auto; color: red;">적합</th>
								<th class="test1-2" style="display: none; width: auto;"></th>
								<th style="width: 25%; text-align: center;">거래금액(만원)</th>
								<td style="width: 25%; text-align: center;" id="compare2"></td>
								<th class="test1-2" style="display: none; width: auto; color: red;">적합</th>
								<th class="test1-1" style="display: none; width: auto;"></th>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">${apt.buildYear}</td>
								<th class="test2-1" style="display: none; width: auto; color: red;">적합</th>
								<th class="test2-2" style="display: none; width: auto;"></th>
								<th style="width: 25%; text-align: center;">건축연도</th>
								<td style="width: 25%; text-align: center;" id="compare3"></td>
								<th class="test2-2" style="display: none; width: auto; color: red;">적합</th>
								<th class="test2-1" style="display: none; width: auto;"></th>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">${apt.area}</td>
								<th class="test3-1" style="display: none; width: auto; color: red;">적합</th>
								<th class="test3-2" style="display: none; width: auto;"></th>
								<th style="width: 25%; text-align: center;">전용면적(평)</th>
								<td style="width: 25%; text-align: center;" id="compare4"></td>
								<th class="test3-2" style="display: none; width: auto; color: red;">적합</th>
								<th class="test3-1" style="display: none; width: auto;"></th>
							</tr>
<!-- 							<tr> -->
<%-- 								<td style="width: 33%; text-align: center;">${apt.dealAmount}/${apt.area}</td> --%>
<!-- 								<th style="width: 33%; text-align: center;">평당 거래금액(만원)</th> -->
<!-- 								<td style="width: 33%; text-align: center;">""</td> -->
<!-- 							</tr> -->
						</thead>
					</table>
					</div>
				</div>
				
			</div>
		<footer>
			<%@ include file="/resources/menu/footer.jsp"%>
		</footer>
		</div>
	</div>
	<script>
		var aptName = `${apt.aptName}`;
		showDeal(aptName);
		showScore(aptName);
		showApt();
		
		function showDeal(data) {
			// 		console.log(data);
			$.get("${pageContext.request.contextPath}/SelectBoxController", {
				command : "aptDeal",
				aptName : data
			}, function(data, status) {
				// 					console.log(data);
				$("#result2").text("");
				$("#table2").hide();
				$.each(data, function(index, vo) {
					//							console.log(data);
					let str = "<tr>" + "<td>" + vo.aptName + "</td>" + "<td>"
							+ vo.floor + "</td>" + "<td>" + vo.area + "</td>"
							+ "<td>" + vo.dealAmount + "</td>" + "<td>"
							+ vo.dealYear + "/" + vo.dealMonth + "/"
							+ vo.dealDay + "</td></tr>";
					$("#table2").show();
					$("#result2").append(str);
				});
			}, "json");
		}
		function showScore(data) {
			// 		console.log(data);
			$.get("${pageContext.request.contextPath}/SelectBoxController", {
				command : "aptScore",
				aptName : data
			}, function(data, status) {
				console.log(data);
				$("#result3").text("");
				$("#table3").hide();
				console.log(data);
				$.each(data, function(index, vo) {
					let str = "<tr>" + "<td>" + vo.userName + "</td>" + "<td>"
							+ vo.content + "</td>" + "<td>" + vo.time
							+ "</td></tr>";
// 					$("#table3").show();
					$("#result3").append(str);
				});
			}, "json");
		}
		var ca = "";
		var cb = "";
		var cc = "";
		function select(number){
			var abc = $("#"+number);
			var name = abc[0].innerText;
// 			var name = $("#number")[0].innerText;
			
			$.get("${pageContext.request.contextPath}/SelectBoxController", {
				command : "aptDeal",
				aptName : name
			}, function(data, status) {
									console.log(data);
				$("#compare1").text("");
				$("#compare2").text("");
				$("#compare3").text("");
				$("#compare4").text("");
				$.each(data, function(index, vo) {
					let str1 = vo.aptName;
					let str2 = vo.dealAmount;
					let str3 = vo.dealYear;
					let str4 = vo.area;
					ca = str2.trim().replace(",", "");
					cb = parseInt(str3);
					cc = parseInt(str4);
					$("#compare1").text(str1);
					$("#compare2").text(str2);
					$("#compare3").text(str3);
					$("#compare4").text(str4);
				});
				
			recommend();
			}, "json");
		}
		function showApt() {
			// 		console.log(data);
			$.get("${pageContext.request.contextPath}/SelectBoxController", {
				command : "showApt"
			}, function(data, status) {
				// 					console.log(data);
// 				$("#result2").text("");
// 				$("#table2").hide();
					var cnt = 1;
				$.each(data, function(index, vo) {
					let str = vo.aptName
// 					$("#table2").show();
					console.log(str);
					if(cnt == 1){
						$("#list1").append(str);
						cnt++;
					} else if(cnt == 2){
						$("#list2").append(str);
						cnt++;
					} else if(cnt == 3){
						$("#list3").append(str);
						cnt++;
					} else if(cnt == 4){
						$("#list4").append(str);
						cnt++;
					} else if(cnt == 5){
						$("#list5").append(str);
						cnt++;
					}
				});
			}, "json");			
		}
		
		var flag1 = 0;
		var flag2 = 0;
		function scoreOn() {
			if(flag1 == 0){
				$("#table3").show();
				$("#table4").hide();
				flag1 = 1;
				flag2 = 0;				
			} else {
				$("#table3").hide();
				$("#table4").hide();
				flag1 = 0;
				flag2 = 0;
			}
		}
		function compareOn() {
			if(flag2 == 0){
				$("#table3").hide();
				$("#table4").show();
				flag1 = 0;
				flag2 = 1;
			} else {
				$("#table3").hide();
				$("#table4").hide();
				flag1 = 0;
				flag2 = 0;
			}
		}
		
		var aamount = `${apt.dealAmount}`;
		var aa = parseInt(aamount.trim().replace(",", ""));
		var ab = parseInt(`${apt.buildYear}`);
		var ac = parseInt(`${apt.area}`);
		
		var bamount = `${user.amount}`;
		var ba = parseInt(bamount.trim().replace(",", ""));		
		var bb = parseInt(`${user.buildYear}`);
		var bc = parseInt(`${user.area}`);
		
		function recommend() {
			if( Math.abs(ba-aa) < Math.abs(ba-ca) ){				
				$(".test").show();
				$(".test1-1").show();
				$(".test1-2").hide();
			} else {
				$(".test").show();
				$(".test1-1").hide();
				$(".test1-2").show();
			}
			
			if( Math.abs(bb-ab) < Math.abs(bb-cb) ){				
				$(".test").show();
				$(".test2-1").show();
				$(".test2-2").hide();
			} else {
				$(".test").show();
				$(".test2-1").hide();
				$(".test2-2").show();
			}
			
			if( Math.abs(bc-ac) < Math.abs(bc-cc) ){				
				$(".test").show();
				$(".test3-1").show();
				$(".test3-2").hide();
			} else {
				$(".test").show();
				$(".test3-1").hide();
				$(".test3-2").show();
			}
		}
	</script>
</body>
</html>