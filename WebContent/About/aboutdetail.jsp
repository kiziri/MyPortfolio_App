<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>About Kiziri</title>
</head>
<body>
	<!-- navBar Parts -->
	<jsp:include page="/nav.jsp" />
	
<br>
<br>
	<div class="container">
    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>Kiziri's Features</h2>
        <p>The Developement Web Program includes:</p>
        <ul>
          <li>
            <strong>Bootstrap v4</strong>
          </li>
          <li>
            <strong>Servlet, JSP</strong>
          </li>
          <li>Java</li>
          <li>jQuery</li>
          <li>Working contact form with validation</li>
          <li>Unstyled page elements for easy customization</li>
          <li>Simple elements Backend Processes building</li>
        </ul>
        <p>웹 프로그로그래밍 및 자바 기반의 개발을 주요 목표로 활동하며, 대학내의 많은 실기 메인의 프로젝트 교과목을 수강해 경험량 증량 및 실력의 향상 등을 도모함. 학기 또는 방학 내 비교과 프로그램을 이수하여 실력 향상.</p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="/imageFiles/profileImg.jpg" alt="" width=700 height=600>
      </div>
    </div>
    <!-- /.row -->
	</div>

<br>
<br>

	<!-- Footer -->
	<jsp:include page="/footer.jsp" />

</body>
</html>