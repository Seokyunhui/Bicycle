<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.ChallegeDto"%>
<%@page import="database.ChallegeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/0b8394fc8a.js"></script>
<style>
.prpl {
	padding-left: 20px;
	padding-right: 20px;
}

.footer {
	background-color: cornsilk;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="./header.jsp"%>

	<!-- 배너 타이틀 -->
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

	<!-- hr 줄 구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
		<div class="col-lg-1"></div>
	</div>
	<!-- 공백구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br> <br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 구역 header -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-6">
			<h3>
				<b>챌린지 목록</b>
			</h3>
		</div>
		<div class="col-lg-3">
	
				<ul class="nav nav-pills justify-content-around display-5">
					
					<li><a href="admin_challenge.jsp?check=0" class="navbar-link text-dark">등록보류</a></li>
					
					<li>|</li>
					
					<li><a href="admin_challenge.jsp?check=1" class="navbar-link text-dark">등록완료</a></li>
					
				</ul>
			
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br> <br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 목록 테이블 구역 -->
	<%
	List<ChallegeDto> arrayList = new ArrayList<>();
	ChallegeDao challegeDao = new ChallegeDao();
	ChallegeDto challegeDto;
	
	arrayList = challegeDao.getList();
	int check = Integer.parseInt(request.getParameter("check"));  
	if(check == 1){
		arrayList = arrayList.stream().filter(list -> list.getAdmin_approval()==1).collect(Collectors.toList());
	} else {
		arrayList = arrayList.stream().filter(list -> list.getAdmin_approval()==0).collect(Collectors.toList());
	}
	
	String km = "km";
	
	%>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>

			<div class="col-lg-8">
		
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>등록일</th>
							<th>주행거리</th>
							<th>승인여부</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i = 0; i<5; i++){
						if(arrayList.size()<=i){
							break;
						}
						challegeDto = arrayList.get(i);
						
						%>
						<tr>
							<td style="vertical-align: middle;"><%=challegeDto.getChallenge_id() %></td>
							<td style="vertical-align: middle;"><%=challegeDto.getChallenge_content() %></td>
							<td style="vertical-align: middle;"><%=challegeDto.getChallenge_regdate() %></td>
							<td style="vertical-align: middle;"><%=challegeDto.getChallenge_dist() + km %></td>
							<%if(challegeDto.getAdmin_approval()==1){ %>
							<td><button type="button" class="btn btn-outline-success disabled">등록완료</button></td>
							<%} else { %>
							<td><a class="btn btn-outline-danger" href="admin_challenge_action.jsp?Challenge_id=<%=challegeDto.getChallenge_id() %>">등록</a></td>
							<%} %>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>

	<!-- 공백 구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br><br>
			<br><br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!--네이션구역-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<nav style="text-align: center;">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="BoardC_S.jsp?pagesize=0">1</a></li>
					<li><a href="BoardC_S.jsp?pagesize=10">2</a></li>
					<li><a href="BoardC_S.jsp?pagesize=20">3</a></li>
					<li><a href="BoardC_S.jsp?pagesize=30">4</a></li>
					<li><a href="BoardC_S.jsp?pagesize=40">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>

		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- hr 구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!-- js -->
	<script>
            $('.carousel').carousel({
                interval: 10000
            })
        </script>
	<%@include file="./footer.jsp"%>
</body>
</html>