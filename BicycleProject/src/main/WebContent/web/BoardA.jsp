<%@page import="java.util.stream.Collectors"%>
<%@page import="database.BoardDao"%>
<%@page import="database.BoardDto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동행하는 사람들...</title>
<style>
.prpl {
	padding-left: 20px;
	padding-right: 20px;
}

.footer {
	background-color: cornsilk;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">
</head>
<body>
	<%@include file="./header.jsp"%>
	
	
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="col-lg-3" data-spy="scroll" data-target=".navbar">
			<ul class="nav nav-pills justify-content-around display-5 ">
				<li><a href="BoardA.jsp?categoty_sm=자전거 종류" class="navbar-link text-dark">자전거
						종류</a></li>
				<li>|</li>
				<li><a href="BoardA.jsp?categoty_sm=유의사항" class="navbar-link text-dark">유의사항</a></li>
				<li>|</li>
				<li><a href="BoardA.jsp?categoty_sm=대처사항" class="navbar-link text-dark">대처사항</a></li>
			</ul>
		</div>
	</div>



	<%!
	BoardDao boardDao = new BoardDao(); 
	List<BoardDto> arrayList = new ArrayList<>();
	BoardDto boardDto;
	%>


	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<%
				String cetegory_sm = request.getParameter("categoty_sm");
				arrayList = boardDao.getList();
				arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals(cetegory_sm))
				.collect(Collectors.toList());
				for (int k = 0; k < arrayList.size(); k++) {
					boardDto = arrayList.get(k);
			%>
			<% if(k==0){%>
			<div class="container-fluid text-center"
				style="padding-top: 35px; padding-bottom: 35px">

				<h1><%=boardDto.getCategory_small()%></h1>
			
			</div>
			<%} %>
			<div class="row justify-content-center">
				<div class="col-md-4"></div>
				<div class="col-md-4 text-center">
					<h3>
						<%=boardDto.getBoard_title()%>
					</h3>
					<br>
					<p>
						<%=boardDto.getBoard_content()%>
					</p>

				</div>
				<div class="col-md-4"></div>
			</div>
			<br>
			<%
			}
			%>
			<hr>
			</div>
		</div>
		
		
	<%@include file="./footer.jsp"%>
</body>
</html>