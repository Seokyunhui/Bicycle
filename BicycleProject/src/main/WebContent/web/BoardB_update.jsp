<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.*"%>
<%@page import="database.BoardDao"%>
<%@page import="database.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글작성</title>
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

	<!-- 헤더 -->
	<%@include file="./header.jsp"%>

	<!-- 배너 이미지 -->
	<div class="row">
		<div class="col-lg-1"></div>

		<div id="carouselExampleControls"
			class="col-lg-10 carousel slide text-center w-100"
			data-ride="Carousel">

			<div class="carousel-inner">
				<div class="carousel-item active ">
					<img src="./image/배너%20수정본/배너1.png" alt="First slide" class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너2.png" alt="Second slide"
						class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너3.jpg" alt="Third slide" class="w-100">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!--hr-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

	<%
	
	
	int boardid = Integer.parseInt(request.getParameter("board_id"));// 수정 버튼 클릭시 누른 객체의 Board_id 값을 가지고 옴
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getDto(boardid);//board 테이블의 기본 값 을 가지고 boardDto 에 객체 반환
	%>
	



	<form
		action=" BoardB_update_action.jsp?board_id=<%=boardDto.getBoard_id()%>"
		method="post">
		<!-- 팝,삽 카테고리 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<div class="form-group">

					<select class="form-control" name="board_category_sm">
						<option value="<%=boardDto.getCategory_small()%>">자유게시판</option>
						<option value="질문">질문게시판</option>

					</select>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>

		<!-- 제목 텍스트 구역 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="제목"
						name="board_title" value="<%=boardDto.getBoard_title()%>">
				</div>
				<input type="file" value="fileName">
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>

		<!-- 공백 -->
		<div class="row">
			<div class="col-lg-12">
				<br>
			</div>
		</div>

		<!-- 상세 텍스트 구역 -->
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="form-group">

					<textarea class="form-control" rows="20" placeholder="자유롭게 작성해주세요."
						name="board_content"><%=boardDto.getBoard_content()%></textarea>
				</div>
				<button type="submit" class="btn btn-primary" style="float: right;">수정</button>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</form>
	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>


	<!--hr-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!-- footer -->
	<%@include file="./footer.jsp"%>

	<!-- js -->
	<script>
		$('.carousel').carousel({
			interval : 10000
		})
	</script>
</body>
</html>