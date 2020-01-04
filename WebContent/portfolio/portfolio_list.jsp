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
<title>Portfolio List</title>

<style>
html{
	height:100%;
}
.bg {
  /* The image used */
  background-image: url("/imageFiles/list.png");

  /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

</head>
<body class="bg">

		<!-- navBar Parts -->
	<jsp:include page="/nav.jsp" />
	
<br>
<br>
	<div class="container">
	<h1>포트폴리오 리스트</h1>
	
	<form action="/portfolio_search.do" method="post">
		<input type="text" name="title" placeholder="제목을 입력하세요." value="${ param.title }">	
		<input type="submit" value="검색">	
	</form>
	
	<table class="table table-striped">
  	<thead>
    	<tr>
      		<th scope="col">#</th>
      		<th scope="col">제목</th>
      		<th scope="col">시작일</th>
      		<th scope="col">종료일</th>
      		<th scope="col">자료수</th>
      		<th scope="col">대표자</th>
      		<th scope="col">참여자수</th>
      		<th scope="col"></th>
      		<th scope="col"></th>
    	</tr>
  	</thead>
  	<tbody>
  	<c:forEach items="${ list }" var="portfolio">
    <tr>
		<th scope="row">1</th>
      	<td>${ portfolio.no }</td>
      	<td><a href="/portfolio_detail.do?no=${ portfolio.no }"> ${ portfolio.title }</a></td>
      	<td>@${ portfolio.startDate }</td>
      	<td>@${ portfolio.endDate }</td>
      	<td>${ portfolio.dataCount }</td>
		<td>${ portfolio.leader }</td>
		<td>${ portfolio.memberCount }</td>
		<td><input type="button" value="삭제" data-no="${ portfolio.no }"/></td>
    </tr>
    </c:forEach>
  	</tbody>
	</table>
</div>
	
<%-- 	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>자료수</th>
				<th>대표자</th>
				<th>참여자수</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody id="portfolioLsit">
		<c:forEach items="${ list }" var="portfolio">
			<tr>
				<td>${ portfolio.no }</td>
				<td><a href="/portfolio_detail.do?no=${ portfolio.no }"> ${ portfolio.title }</a></td>
				<td>${ portfolio.startDate }</td>
				<td>${ portfolio.endDate }</td>
				<td>${ portfolio.dataCount }</td>
				<td>${ portfolio.leader }</td>
				<td>${ portfolio.memberCount }</td>
				<td><input type="button" value="삭제" data-no="${ portfolio.no }"/></td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table> --%>
</body>
</html>