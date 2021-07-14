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
    <style>
        .prpl {
            padding-left: 20px;
            padding-right: 20px;
        }
=======
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동행하는사람들...</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">
	 <script src="https://use.fontawesome.com/0b8394fc8a.js"></script>
>>>>>>> branch 'BicycleProject' of https://github.com/Seokyunhui/Bicycle.git

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
	<jsp:include page="header.jsp" />
	
	

	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="col-lg-3" data-spy="scroll" data-target=".navbar">
			<ul class="nav nav-pills justify-content-around display-5 ">
				<li><a href="#section1" class="navbar-link text-dark">자유게시판</a></li>
				<li></li>
				<li><a href="#section2" class="navbar-link text-dark">질문게시판</a></li>
				<li></li>
				<li><a href="#section3" class="navbar-link text-dark">모이자!</a></li>
			</ul>
		</div>
	</div>


	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1">
			<!--검색-->
			<form action="">
				<div class="input-group">
					<input type="search" placeholder="search"
						aria-describedby="button-addon5" class="form-control">
					<div class="input-group-append">
						<button id="button-addon5" type="submit" class="btn btn-info">
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
				<a href="btn btn-info"><input type="button" class="btn btn-info"
					value="글등록"></a>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>
	<div class="row">
		<br>
	</div>

	<!-- Table -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<table class="table table-hover">
					<div class="panel-heading">게시판</div>
					<thead>
						<tr style="height: 60%">
							<th style="width: 10%">번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>댓글수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>안녕하세요</td>
							<td>admin</td>
							<td>2021-07-08</td>
							<td>3</td>
							<td>2</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="col-lg-1"></div>
	</div>


	<!--목록버튼-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
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
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>

	</div>




	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>