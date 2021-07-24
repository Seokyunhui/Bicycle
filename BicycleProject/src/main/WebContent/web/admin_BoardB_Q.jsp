<%@page import="database.MemberDao"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="database.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DBDriver"%>
<%@page import="database.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동행 하는사람들...</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://use.fontawesome.com/0b8394fc8a.js"></script>
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
<style>
.prpl {
	padding-left: 20px;
	padding-right: 20px;
}
<
style>.prpl {
	padding-left: 20px;
	padding-right: 20px;
}

.footer {
	background-color: cornsilk;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<!-- 배너 타이틀 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div id="carouselExampleControls"
			class="col-lg-10 carousel slide text-center w-100"
			data-ride="Carousel">

			<div class="carousel-inner">
				<div class="carousel-item active ">
					<img src="./image/배너%20수정본/배너%20복사본.png" alt="First slide"
						class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너%20복사본.png" alt="Second slide"
						class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너%20복사본.png" alt="Third slide"
						class="w-100">
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

	<!-- hr -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 소통 탭  -->
	<div class="row">
		<div class="col-lg-8"></div>
		<div class="col-lg-3" data-spy="scroll" data-target=".navbar">
			<ul class="nav nav-pills justify-content-around display-5 ">
				<% 
				int group = 0;
				if (session.getAttribute("userGroup") != null) {
					group = (Integer) session.getAttribute("userGroup");
				}else {
					group = 0;
				}if (group != 5) {
				%>
				<%  }else if (group == 5) { %>
				<li><a href="admin_BoardB_Q.jsp?categoty_sm=소통" class="navbar-link text-dark">질문게시판</a></li>
				<li>|</li>
				<li><a href="admin_BoardB_C.jsp?categoty_sm=소통" class="navbar-link text-dark">자유게시판</a></li>
				<% } %>
				<li>|</li>
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


	<div class="row">
		<div class="col-lg-9"></div>
		<div class="col-lg-1">
			<!--검색-->
			<form action="">
				<div class="input-group">
					<input type="search" placeholder="search"
						aria-describedby="button-addon5" class="form-control">
					<div class="input-group-append">
						<button id="button-addon5" type="submit" class="btn btn-primary">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</form>
		</div>

		<!--글등록-->
		<div class="col-lg-1">
			<div class="col-lg-5"></div>
			<div class="col-lg-5">
				<a href="BoardB_write.jsp"><input type="button"
					class="btn btn-primary" value="글등록"></a>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>

	<!-- 공백 -->
	<div class="row">
		<br>
	</div>



	<%
		BoardDao boardDao = new BoardDao();
		List<BoardDto> arraylist = new ArrayList<BoardDto>();
		MemberDao memberDao = new MemberDao();
		BoardDto boardDto;
		
	
	%>



	<!-- Table -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10 text-center">

			<div class="panel panel-default">
				<table class="table table-hover">
					<div class="panel-heading">질문 게시판</div>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>아이디</th>
							<th>조회수</th>
						</tr>
					</thead>
					<%
					arraylist = boardDao.getList();
					arraylist = arraylist.stream().filter(list -> list.getCategory_small().equals("질문")).collect(Collectors.toList());
					for (int j = 0; j < arraylist.size(); j++) {
					%>
					<%
					boardDto = arraylist.get(j);
					%>
					<tbody>
						<tr onclick = "location.href ='admin_BoardB_view.jsp?board_id=<%=boardDto.getBoard_id()%>'">
							<!-- 번호  -->
							<td><%=boardDto.getBoard_id()%></td>
							<!-- 제목  -->
							<td><%=boardDto.getBoard_title()%></td>
							<!-- 날짜 -->
							<td><%=boardDto.getBoard_regdate()%></td>
							<!-- 아이디 -->
							<td><%=boardDto.getBoard_writer()%></td>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!--목록버튼-->
	<div class="row">
		<div class="col-lg-5"></div>
		<div class="col-lg-2">
		
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"> < </a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>
		</div>
		<div class="col-lg-5"></div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>