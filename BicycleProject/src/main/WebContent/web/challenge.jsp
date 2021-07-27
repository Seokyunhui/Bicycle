<%@page import="database.ChallegeDto"%>
<%@page import="database.ChallegeDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%
if (session.getAttribute("userID") == null) {
%>
<script>
	alert('로그인이 필요합니다.');
	window.history.back();
</script>
<%
}
%>
<title>동행하는 사람들...</title>
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

	<!-- 구역 header -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-8">
			<h3>
				<b>챌린지</b>
			</h3>
		</div>
		<div class="col-lg-1"></div>
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


	<form action="challenge_action.jsp" method="post" enctype="multipart/form-data">

		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<button type="submit" class="btn btn-outline-secondary"
					style="float: right;">등록</button>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>

		<!-- 파일 업로드 구역 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<div class="form-group">
					<input type="file" class="form-control-file" name="uploadFile"
						required>
				</div>
			</div>

			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>

		<!-- 주행거리 텍스트 구역 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<div class="form-group">
					<input type="number" class="form-control"
						placeholder="주행거리를 입력해주세요.(km)" name="challenge_dist" required>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>


		<!-- 내용 텍스트 구역 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
			<div class="col-lg-8">
				<div class="form-group">
					<textarea class="form-control" rows="10"
						placeholder="오늘은 어느곳을 다녀오셨나요?.." name="Challenge_content" required></textarea>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>
	</form>


	<!-- hr 구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-8">
			<hr>
		</div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 공백구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br> <br> <br> <br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 구역 header -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-8">
			<h3>
				<b>글 목록</b>
			</h3>
		</div>
		<div class="col-lg-1"></div>
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
	<%
	MemberDao memberDao = new MemberDao();
	ChallegeDao challegeDao = new ChallegeDao();
	ArrayList<ChallegeDto> arrayList = new ArrayList<>();
	String writer = (String) session.getAttribute("userID"); //글 쓴이
	int MemberUid = memberDao.getMemberUid(writer); //글 쓴이 기본키
	arrayList = challegeDao.getList(MemberUid);
	ChallegeDto challegeDto;
	%>


	<!-- 목록 테이블 구역 -->
	<form action="" method="post">
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
						<%
						for (int i = 0; i < 5; i++) {
							if (arrayList.size() <= i) {
								break;
							}
							challegeDto = arrayList.get(i);
						%>
						<tr>

							<td><%=challegeDto.getChallenge_id()%></td>
							<td><%=challegeDto.getChallenge_content()%></td>
							<td><%=challegeDto.getChallenge_regdate()%></td>
							<td><%=challegeDto.getChallenge_dist()%></td>
							<%
							if (challegeDto.getAdmin_approval() == 1) {
							%>
							<td>y</td>
							<%
							} else {
							%>
							<td>n</td>
							<%
							}
							%>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1"></div>
		</div>
	</form>


	<!-- 공백 구역 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
			<br> <br>
			<br>
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
			interval : 10000
		})
	</script>
	<%@include file="./footer.jsp"%>
</body>
</html>