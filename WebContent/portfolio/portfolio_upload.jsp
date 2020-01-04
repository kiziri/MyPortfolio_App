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
<title>Upload Portfolio</title>

<style>
	html{
	height:100%;
	}
	
	.bg {
  			/* The image used */
 			background-image: url("/imageFiles/upload_bg.jpg");

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
	<h1>Apply Portfolio</h1>
	<br>
  	<form method="post"  enctype="multipart/form-data" action="/portfolio_register.do" class="border p-3">
  		<div class="form-group">
    		<label for="FormControlTitle">Title</label>
    		<input type="text" class="form-control" name="Title" placeholder="My Portfolio Title">
 	 	</div>
  		<div class="form-group">
    		<label for="FormControlRepresentative">Representative</label>
    		<input type="text" class="form-control" name="Representative" placeholder="Representative Name">
 	 	</div>
  		<div class="form-group">
    		<label for="FormControlParticipants">Participants</label>
    		<input type="text" class="form-control" name="Participants" placeholder="Categorized list of participants by ','">
 	 	</div>
  		<div class="form-group">
    		<label for="FormControlContent">Content</label>
    		<textarea class="form-control" name="Content" rows="10" placeholder="Input Content"></textarea>
 	 	</div>
 	 	<div class="form-group">
    		<label for="FormControlStartDate">Start Date</label>
    		<input type="date" class="form-control" name="StartDate">
 	 	</div>
 	 	<div class="form-group">
    		<label for="FormControlEndDate">End Date</label>
    		<input type="date" class="form-control" name="EndDate">
 	 	</div>
   		<div class="form-group">
    		<label for="FormControlAttachment">Attachment File</label>
    		<input type="file" class="form-control-file" name="Attachment">
  		</div>
  		<div>
  			<input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="등록" align="center">
			<input class="btn btn-outline-dark my-2 my-sm-0" type="reset" name="취소" align="center">
  		</div>
	</form>
  	</div>

</body>
</html>