<%@page import="database.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행하는 사람들...</title>
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
		<%
		BoardDao boardDao = new BoardDao();
		String name = 
	
	%>
	
	
	
	<div class="row">
	<div class="col-md-1">
	</div>
	<div class="col-md-10">
	<form action="admin_BoardA_write.jsp" method="post">
	<input type="text" class="form-control" placeholder="카테고리 대분류" name = "category">
	<input type="text" class="form-control" placeholder="카테고리 소분류">
	<input type="text" class="form-control" placeholder="글 제목">
	<textarea class="form-control" placeholder="글 내용" name="Board_content"></textarea>
	<div class="text-right">
	<button class="btn btn btn-success" type="submit" style="width:10%; padding:5px;">제출</button>
	</div>
	</form>
	
	
	
	
	
	
	
	</div>
	<div class="col-md-1">
	</div>
	
	
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<%@include file="./footer.jsp"%>
</body>
</html>