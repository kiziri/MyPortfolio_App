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

<title>Kiziri's World</title>

<style>
</style>

</head>
<body>
	
	<!-- navBar Parts -->
	<jsp:include page="/nav.jsp" />
	
<br>

	<!-- Main ImageShow Prats -->
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  		<ol class="carousel-indicators">
    		<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    		<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    		<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  		</ol>
  	<div class="carousel-inner">
   	 	<div class="carousel-item active">
      		<img src="/imageFiles/mainimg1.png" class="d-block w-100" alt="..." width=1500 height=450>
      		<div class="carousel-caption d-none d-md-block">
        		<h5>선문 G-Fair Competition Festival</h5>
        		<p>선문대학교 소프트웨어 개발 경진 대회.</p>
      		</div>
    	</div>
    	<div class="carousel-item">
      		<img src="/imageFiles/mainimg2.jpg" class="d-block w-100" alt="..." width=1500 height=450>
      		<div class="carousel-caption d-none d-md-block">
        		<h5>Second slide label</h5>
        		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      		</div>
    	</div>
    	<div class="carousel-item">
      		<img src="http://placehold.it/1900x450" class="d-block w-100" alt="..." width=1500 height=450>
      		<div class="carousel-caption d-none d-md-block">
        		<h5>Third slide label</h5>
        		<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      		</div>
    	</div>
  	</div>
  	<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	<span class="sr-only">Previous</span>
  	</a>
  	<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
 	 </a>

<br>
<br>

	</div>
	<div class="container">
	<!-- Main Portfolio Act Card Parts -->
	<h2 class="text-center">Portfolio Heading</h2>
	<div class="row">
      <div class="col-lg-4 col-sm-4 portfolio-item">
        <div class="card w-80 h-100">
          <a href="#"><img class="card-img-top" src="/imageFiles/facebook.jpg" alt="" width=250 height=300></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-4 portfolio-item">
        <div class="card w-80 h-100">
          <a href="#"><img class="card-img-top" src="/imageFiles/apple.jpg" alt="" width=250 height=300></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-4 portfolio-item">
        <div class="card w-80 h-100">
          <a href="#"><img class="card-img-top" src="/imageFiles/google.jpg" alt="" width=250 height=300></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
	</div>
    <!-- /.row -->
    
<br>
<br>

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
  	<footer class="py-5 bg-dark">
    	<div class="container">
      		<p class="m-0 text-center text-white">Copyright &copy; Kiziri's Website 2020</p>
    	</div>
   	<!-- /.container -->
  	</footer>	

	
</body>
</html>