<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	<a class="navbar-brand" href="/main/mainHomePage.jsp">Kiziri's Portfolio</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   	<span class="navbar-toggler-icon"></span>
 	</button>

 	<div class="collapse navbar-collapse" id="navbarSupportedContent">
   	<ul class="navbar-nav mr-auto">
     	<li class="nav-item active">
       	<a class="nav-link" href="/main/mainHomePage.jsp">Home <span class="sr-only">(current)</span></a>
     	</li>
     	<li class="nav-item">
       	<a class="nav-link" href="/About/aboutdetail.jsp">About</a>
     	</li>
     	<li class="nav-item">
       	<a class="nav-link" href="#">Gallery</a>
     	</li>
   		<c:if test="${not empty sessionScope.userDto}">
     	<li class="nav-item dropdown">
	       	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Managing</a>
	       	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
	         		<a class="dropdown-item" href="/portfolio/portfolio_upload.jsp">Upload</a>
	         		<a class="dropdown-item" href="/portfolio_list.do">List Management</a>
	       	</div>
	    </li>
   		</c:if>
   	</ul>
   <form class="form-inline my-2 my-lg-0">
   	<c:choose>
   		<c:when test="${not empty sessionScope.userDto}">
		    <a class="btn btn-outline-success my-2 my-sm-0" href="/logout.do" >Logout</a>
   		</c:when>
   		<c:otherwise>
		    <a class="btn btn-outline-success my-2 my-sm-0" href="/login/login.jsp">Login</a>
   		</c:otherwise>
   	</c:choose>
   </form>
 	</div>
</nav>