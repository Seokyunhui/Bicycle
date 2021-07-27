<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="database.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동행 하는사람들...</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://use.fontawesome.com/0b8394fc8a.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
</head>
<body>
	<jsp:include page="header.jsp" />

 
 
		 <!-- 배너 이미지 -->
        <div class="row">
            <div class="col-lg-1">
            </div>

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
            <div class="col-lg-1">
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
        
			<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>
		
		<!-- 소통 탭  -->
	<div class="row">
		<div class="col-lg-8"></div>
		<div class="col-lg-3" data-spy="scroll" data-target=".navbar">
			<ul class="nav nav-pills justify-content-around display-5 ">
				<li><a href="BoardC_B.jsp" class="navbar-link text-dark">질문게시판</a></li>

				<li></li>
				<li><a href="BoardB_Q.jsp" class="navbar-link text-dark">자유게시판</a></li>
				<li></li>
				<li><a href="BoardB_M.jsp" class="navbar-link text-dark">모이자!</a></li>
			</ul>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<div class="col-lg-12">
			<br>
		</div>
	</div>

		<%   // 메인페이지 이동시 세션값이 있는지 확인 
			String userID = null;
		
			if(session.getAttribute("userID")!=null)
				
				userID = (String)session.getAttribute("userID");
			
			int board_id =0;// 글목록이 있는지 확인 
			if(request.getParameter("board_id")!=null){
				board_id = Integer.parseInt(request.getParameter("board_id"));
			}
			if(board_id==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않는 글입니다.')");
				script.println("location.href=BoardB_jsp");
				script.println("</script>");
			}
			// 게시글이 있는지 확인 문단 
			BoardDto boardDto = new BoardDao().getDto(board_id);	
		
			%>

		<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<td style="width: 20%">글 제목</td>
						<td colspan="2"><%= boardDto.getBoard_title()
						%></td>
					</tr>
					<tr>	
						<td>작성자</td>
						<td colspan="2"><%= boardDto.getBoard_writer() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= boardDto.getBoard_regdate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2"><%= boardDto.getBoard_content() %></td>
					</tr>
				</thead>
			</table>
			
		</div>
		<div class="col-lg-1"></div>
	</div>
	
	<div class="row">
	<div class="col-lg-9"></div>
	<div class="col-lg-2"><a href="BoardB_Q.jsp" class="btn btn-primary">목록</a>
	
	<%

	if(userID!=null&& userID.equals(boardDto.getBoard_writer())){
			
	%>
		
	<a href="BoardB_update.jsp?board_id=<%=boardDto.getBoard_id() %>" class="btn btn-primary">수정</a>
	<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="BoardB_delete.jsp?board_id=<%= boardDto.getBoard_id()%>" class="btn btn-primary ">삭제</a>
	<% } %>
	</div>
	<div class="col-lg-1"></div>
	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>