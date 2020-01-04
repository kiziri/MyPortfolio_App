<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

 	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>	
 	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
 	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>
 	<title>Portfolio Register</title>
 	
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
	<div class="jumbotron">
    	<h1 class="display-4">Portfolioer's register</h1>
     	<p class="lead">New World, Creative Thinking</p>
	</div>
	<h2>Register</h2>
	<form>
		<div class="form-group mt-50">
             <label class="sr-only" for="userName">Name</label>
             <input type="text" class="form-control" id="userName" name="name" placeholder="Name">
             <div class="invalid-feedback">이름을 입력하세요.</div>
   		</div>
   		<div class="form-group">
             <label class="sr-only" for="userEmail">Email</label>
             <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Email">
             <div class="invalid-feedback">이메일 주소를 올바르게 입력하세요.</div>
   		</div>
   		<div class="form-group">
             <label class="sr-only" for="userPassword">Password</label>
             <input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="Password">
             <div class="invalid-feedback">10 이상의 영문,숫자,특수문자를 포함하도록 입력하세요.</div>
  		</div>
   		<div class="form-group">
             <label class="sr-only" for="userPassword2">Retype Password</label>
             <input type="password" class="form-control" id="userPassword2" name="userPassword2"  placeholder="Confirm Password">
             <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
   		</div>
	</form>
	<div>
   		<button id="btn_register" class="btn btn-primary">가입</button><a class="float-right" href="/login/login.jsp">로그인</a>
  	</div>
  	</div>

<script>
	$(document).ready(function(){
 		$("#btn_register").click(function(){
  
 	 		if( validate() ){
   				register();
  			}
 		});
	});
	
	function validate(){ 
		var isUserNameValid = false;
		var isUserEmailValid = false;
		var isUserPasswordValid = false;
		var isUserPassword2Valid = false;
		
		var patternEng = new RegExp(/[a-zA-Z]/); // all english
		
		// 이메일 형식인지.
		var patternEmail = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		 
		var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
		var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
		var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one
		
		//userName
		var userNameValue = $("#userName").val();	// form에서 id로 읽어올 수 있어야함.
		var userNameLength = userNameValue.length;	// 값의 길이
		
		// 길이의 조건
		if (userNameLength > 0) {
			isUserNameValid = true;
		}
		
		
		if (isUserNameValid) {
			$("#userName").removeClass("is-invalid");
		} else {
			$("#userName").addClass("is-invalid");
		}
		
		//userEmail
		var userEmailValue = $("#userEmail").val();
		var userEmailLength = userEmailValue.length;
		
		// 형식 체크
		if (patternEmail.test(userEmailValue)) {
			isUserEmailValid = true;
		}
		
		if (isUserEmailValid) {
			$("#userEmail").removeClass("is-invalid");
		} else {
			$("#userEmail").addClass("is-invalid");
		}
		
		//password
		var userPasswordValue = $("#userPassword").val();
		var userPasswordLength = userPasswordValue.length;

		var userPassword2Value = $("#userPassword2").val();
		//var password2Length = password2Value.length; // no need
		
		// 비밀번호 패턴 체크 단, 하나라도 해당안되면 안되므로.
		if (patternEngAtListOne.test(userPasswordValue)
				&& patternSpeAtListOne.test(userPasswordValue)
				&& patternNumAtListOne.test(userPasswordValue)
				&& userPasswordLength >= 10) {
			isUserPasswordValid = true;
		}

		if (isUserPasswordValid) {
			$("#userPassword").removeClass("is-invalid");
		} else {
			$("#userPassword").addClass("is-invalid");
		}
		
		//password confirm
		console.log(userPasswordValue);
		console.log(userPassword2Value);
		
		// 첫번째 비밀번호와 같은지만 확인하면 OK/
		if (userPasswordValue == userPassword2Value) {
			isUserPassword2Valid = true;
		}

		if (isUserPassword2Valid) {
			$("#userPassword2").removeClass("is-invalid");
		} else {
			$("#userPassword2").addClass("is-invalid");
		}
		
		
		// 모든 확인 결과를 체크하는 부분.
		if (isUserNameValid && isUserEmailValid && isUserPasswordValid
				&& isUserPassword2Valid) {
			return true;
		} else {
			return false;
		}
	}
	
	function register() { 
		$.ajax({
			type : 'post',
			url : '/register',
			dataType : 'json',
			data : {
				userName : $("#userName").val(),
				userEmail : $("#userEmail").val(),
				userPassword : $("#userPassword").val()
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동

				console.log(data.result);

				if (data.result == "success") {
					alertify.alert('Welcome!', '회원가입을 축하합니다. 로그인 페이지로 이동합니다',
							function() {
								window.location.href = "/login/login.jsp";
							});
				} 
				else {
					alertify.notify('Opps!! 회원가입에 문제가 생겼습니다.', 'error', //'error','warning','message'
					3, //-1
					function() {
						console.log(jqXHR.responseText);
					});
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('Opps!! 회원가입에 문제가 생겼습니다.', 'error', //'error','warning','message'
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