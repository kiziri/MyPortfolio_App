<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>포트폴리오 상세</title>

</head>
<body>

		<!-- navBar Parts -->
	<jsp:include page="/nav.jsp" />
	
<br>
<br>

	<h1>포트폴리오 상세 내역</h1>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${ portfolio.title }</td>
		</tr>
		<tr>
			<td>대표자</td>
			<td>${ portfolio.leader }</td>
		</tr>		
		<tr>
			<td>참여자</td>
			<td>총 ${ portfolio.memberCount }명 : ${ portfolio.member }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${ portfolio.content }</td>
		</tr>
		<tr>
			<td>시작일</td>
			<td>${ portfolio.startDate }</td>
		</tr>
		<tr>
			<td>종료일</td>
			<td>${ portfolio.endDate }</td>
		</tr>
 	</table>
 	<c:forEach items="${ portfolio.dataList }" var="file">
 		<img src="uploadFileSave/${ file.realFileName }" width="200px" height="200px"/>
 		<br>
 	</c:forEach>	
</body>
</html>

		