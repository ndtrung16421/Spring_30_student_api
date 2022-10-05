<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
<%@include file="/components/common_css_js.jsp"%>
</head>
<body>

	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar" style=" background: linear-gradient(0deg, rgb(22, 147, 230) 1%, rgb(237, 241, 245) 95%); color:black">
			<div class="sidebar-header" >
				<h5 id="namelogin"></h5>
			</div>

			<ul class="list-unstyled components"   style=" background: linear-gradient(0deg, rgb(22, 147, 230) 1%, rgb(237, 241, 245) 90%); color:black" >
				<li><a href="${baseURL}/"> Home </a></li>
				<br>
				<li><a id="Calendar" href="${baseURL}/Calendar"> Calendar </a></li>
				<br>
				<li><a href="${baseURL}/AddTask"> Add task </a></li>
				<br>
				<li><a href="${baseURL}/add"> Add Student </a></li>
				<br>

				<li><a href="${baseURL}/student"> Student list </a></li>
				<br>

				<li><a href="${baseURL}/about"> About </a></li>
				<br>
				<li><a id="logout"> Logout </a></li>
				<br>

			</ul>

			<!-- <ul class="list-unstyled CTAs">
				<li><a
					href="https://bootstrapious.com/tutorial/files/sidebar.zip"
					class="download">Download source</a></li>
				<li><a href="https://bootstrapious.com/p/bootstrap-sidebar"
					class="article">Back to article</a></li>
			</ul> -->
		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i> <span>Menu</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>

					<!--      <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                        </ul>
                    </div> -->
				</div>
			</nav>



			<script>
				$(document).ready(function() {
					$("#logout").click(function() {

						//alert( "logggg"  );
						localStorage.removeItem("key");
						//localStorage.clear();
						var url = "${baseURL}/login";
						$(location).attr("href", url);

					});
				});
			</script>
			<script>
				$(document).ready(function() {
					let events = localStorage.getItem('key');
		            let obj ;
		            if (events) {   
		                $("#namelogin").text(events.split(".")[1]);
		                
		            }

				
				});
			</script>
			
			
			
	<!-- 	<script>
				$(document).ready(function() {
					var pa = (window.location.pathname) ;
					var pa2 = pa.split('/');
					var pa3 = (pa2[  pa2.length -1  ]);

					alert(    $("#Calendar").text()  );
					alert(    pa3  );
					
					alert(  pa3 ==   $("#Calendar").text());
					if(  pa3.localeCompare(  $("#Calendar").text() )  ){

						alert("ssssss");
						 $("#Calendar").html(`<a style="background-color:white;" id="Calendar" href="${baseURL}/Calendar"> Calendar </a>`);
					}

				
				});
			</script> -->