<%@page import="database.BoardcDao"%>
<%@page import="database.BoardcDto"%>
<%@page import="database.Add_fileDao"%>
<%@page import="database.MarketBoardDao"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="database.BoardDao"%>
<%@page import="database.BoardDto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
<title>팝니다</title>
</head>
<body>
	<%@include file="./header.jsp"%>

	<!-- 이미지 배너 캐러셀? -->
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

	<!-- hr 줄바꿈 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!-- 주 카테고리 -->
	<div class="row ">
		<div class="col-lg-1"></div>
		<div class="col-lg-8 "></div>
		<div class="col-lg-2">

			<ul class="nav nav-pills justify-content-around display-5">

				<li><a href="BoardC_S.jsp" class="navbar-link text-dark">팝니다</a></li>
				<li>|</li>
				<li><a href="BoardC_B.jsp" class="navbar-link text-dark">삽니다</a></li>
			</ul>
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

	<!-- 중고거래 팝,삽 header -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10 mb-4">
			<h3>
				<b>중고거래 팝니다</b>
			</h3>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 글 작성 버튼 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<a href="BoardC_write.jsp" class="btn btn-outline-primary"
				style="float: right;">작성</a>
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
	<%
	List<BoardcDto> arrayList = new ArrayList<>();
	BoardcDto boardcDto = new BoardcDto();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	Add_fileDao add_fileDao = new Add_fileDao();
	BoardcDao boardCDao = new BoardcDao();
	int pagesize = 0;
	if (request.getParameter("pagesize") != null) {
		pagesize = Integer.parseInt(request.getParameter("pagesize"));
	}
	arrayList = boardCDao.getList("팝니다", pagesize);
	%>

	<!-- 중고거래 상단 카드 썸네일 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<%
		for (int i = 0; i < 5; i++) {
			if (arrayList.size() <= i) {
				break;
			}
			boardcDto = arrayList.get(i);
		%>
		<div class="col-lg-2 col-md-4">
			<div class="card text-center w-100"
				style="width: 15rem; border-radius: 20px;">
				<img class="card-img-top"
					src="./upload/<%=add_fileDao.getDto(boardcDto.getBoard_Id()).getFile_name() %>"
					alt="Card image cap" style="border-radius: 20px;">
				<div class="card-body">
					<p class="card-text"><%=boardcDto.getCategory_Small() %></p>
					<p class="card-text"><%=boardcDto.getBoard_Editdate() %></p>
					<h5 class="card-title "><%=boardcDto.getBoard_Title() %></h5>
					<p class="card-text"><%=boardcDto.getMarket_Price() %>원
					</p>
					<div class="shadow-lg"><a
						href="BoardC_product.jsp?Market_id=<%=boardcDto.getMarket_Id()%>"
						class="btn btn-outline-primary card text-dark"
						style="border-radius: 20px;">상세내용</a></div>
				</div>
			</div>
		</div>
		<%} %>
		<div class="col-lg-1"></div>

	</div>

	<!--공백-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br> <br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 중고거래 하단 카드 썸네일 -->
	<div class="row">

		<div class="col-lg-1"></div>

		<%
		for (int i = 5; i < 10; i++) {
			if (arrayList.size() <= i) {
				break;
			}
			boardcDto = arrayList.get(i);
		%>
		<div class="col-lg-2 col-md-4">
			<div class="card text-center w-100"
				style="width: 15rem; border-radius: 20px;">
				<img class="card-img-top"
					src="./upload/<%=add_fileDao.getDto(boardcDto.getBoard_Id()).getFile_name() %>"
					alt="Card image cap" style="border-radius: 20px;">
				<div class="card-body">
					<p class="card-text"><%=boardcDto.getCategory_Small() %></p>
					<p class="card-text"><%=boardcDto.getBoard_Editdate() %></p>
					<h5 class="card-title "><%=boardcDto.getBoard_Title() %></h5>
					<p class="card-text"><%=boardcDto.getMarket_Price() %>원
					</p>
					<a
						href="BoardC_product.jsp?Market_id=<%=boardcDto.getMarket_Id()%>"
						class="btn btn-outline-primary card text-dark"
						style="border-radius: 20px;">상세내용</a>
				</div>
			</div>
		</div>
		<%} %>
		<div class="col-lg-1"></div>

	</div>

	<!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
            	<br><br>       
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
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
	
	<!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>   
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>
	
	<!--hr-->
        <div class="row">
            <div class="col-lg-1">
            </div>   
            <div class="col-lg-10">
                <hr>
            </div>
            <div class="col-lg-1">
            </div>
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