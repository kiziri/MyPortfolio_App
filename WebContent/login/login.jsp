<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>
	<title>Login</title>
	
<style>
html{
	height:100%;
}
.bg {
  /* The image used */
  background-image: url("/imageFiles/login_reg.jpg");

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
<br>
<br>
	<div class="container">
 	<div class="jumbotron jumbotron-primary">
		<h1 class="display-4">Kiziri, Login Please.</h1>
     	<p class="lead">New World, Creative Thinking</p>
	</div>
	<h2>Login</h2>
	<form>
		<div class="form-group">
		<label class="sr-only" for="userEmail">Email</label>
		<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Email">
   		</div>
   		<div class="form-group">
    		<label class="sr-only" for="userPassword">Password</label>
    		<input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="Password">
   			</div>
  	</form>
  	<div>
   	<button id="btn_login" class="btn btn-primary">로그인</button><a class="float-right" href="/register/register.jsp">회원가입</a>
  	</div> 
	</div>
	
	<script>
		$(document).ready(function() {
			$("#btn_login").click(function() {

				if (validate()) {
					login();
				}
			});
		});

		function validate() {
			var isUserEmailValid = false;
			var isUserPasswordValid = false;

			var userEmailValue = $("#userEmail").val();
			var userEmailLength = userEmailValue.length;

			if (userEmailLength > 0) {
				isUserEmailValid = true;
			}

			var userPasswordValue = $("#userPassword").val();
			var userPasswordLength = userPasswordValue.length;

			if (userPasswordLength > 0) {
				isUserPasswordValid = true;
			}

			if (isUserEmailValid && isUserPasswordValid) {
				return true;
			} else {
				return false;
			}
		}
		
		function login() {
			$.ajax({
				type : 'post',
				url : '/login',
				dataType : 'json',
				data : {
					userEmail : $("#userEmail").val(),
					userPassword : $("#userPassword").val(),
				},
				success : function(data, status, xhr) { // alertify or another welcome page 이동

					console.log(data.result);

					if (data.result == "success") {
						window.location.href = "/main/mainHomePage.jsp";
					} else {
						alertify.notify('Opps!! 이메일 또는 비밀번호가 올바르지 않습니다.',
								'error', //'error','warning','message'
								3);
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alertify.notify('Opps!! 로그인 과정에 문제가 생겼습니다.', 'error', //'error','warning','message'
					3, //-1
					function() {
						console.log(jqXHR.responseText);
					});
				}
			});
		}
	</script>

</body>
</html>