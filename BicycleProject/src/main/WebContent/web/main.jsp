<%@page import="database.MarketBoardDao"%>
<%@page import="database.BoardcDto"%>
<%@page import="database.BoardcDao"%>
<%@page import="database.Add_fileDao"%>
<%@page import="database.BoardcDto"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="database.BoardDto"%>
<%@page import="java.util.*"%>
<%@page import="database.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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

	<!-- 공지사항 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10 text-center">
			<h3>공지사항 겸 (프로젝트 후기)</h3>
			<p>프론트 백 고민의 길에 서다... -유창석</p>
			<p>고생했다 윤희야 -석윤희</p>
			<p>잉 너무 어려웠쩡 -윤란영</p>
			<p>날 더운데 다들 고생이 많아요 -김동준</p>
			<p>EZ -이범수</p>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- hr -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
		<div class="col-lg-1"></div>
	</div>



	<%
	String rank_category;
	if (request.getParameter("rank_category_sm") == null) {
		rank_category = "자유";

	} else {
		rank_category = request.getParameter("rank_category_sm");
	}

	//조회수 기능구현시
	BoardDao boardDao = new BoardDao();

	List<BoardDto> arrayList = new ArrayList<>();

	arrayList = boardDao.getList();

	arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals(rank_category))
			.collect(Collectors.toList());
	//조회수 정렬
	Collections.sort(arrayList, new Comparator<BoardDto>() {
		@Override
		public int compare(BoardDto b1, BoardDto b2) {
			if (b1.getInfo_hit() > b2.getInfo_hit()) {
		return -1;
			} else if (b1.getInfo_hit() < b2.getInfo_hit()) {
		return 1;
			}
			return 0;
		}
	});
	%>
	<div class="row">
		<div class="col-lg-1"></div>


		<!-- 인기글 목록 -->
		<div class="col-lg-5">
			<div class="panel panel-info">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<ul class="nav justify-content-start">
						<li class="nav-item"><a class="nav-link disabled"><%=rank_category%>게시판
								인기글</a></li>
						<li class="nav-item"></li>
						<li class="nav-item text-right"><a class="nav-link"
							href="main.jsp?rank_category_sm=자유">자유게시판</a></li>
						<li class="nav-item text-right"><a class="nav-link"
							href="main.jsp?rank_category_sm=질문">질문</a></li>
					</ul>
				</div>

				<!-- Table -->
				<table class="table table-hover table-striped table-condensed ">
					<%
					for (int i = 0; i < 5; i++) {
						if (arrayList.size() <= i) {
							break;
						}

						BoardDto boardDto = arrayList.get(i);
					%>
					<tr
						onclick="location.href ='BoardB_view.jsp?board_id=<%=boardDto.getBoard_id()%>'">
						<th><%=i + 1%>등</th>
						<td><%=boardDto.getBoard_title()%>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>작성자: <%=boardDto.getBoard_writer()%>
						</td>
						<td>조회수: <%=boardDto.getInfo_hit()%>
						</td>



					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>

		<%
		//다음주 월요일
		%>

		<!-- 챌린지 그래프 -->
		<div class="col-lg-5">
			<div class="panel panel-info">
				<!-- Default panel contents -->
				<div class="panel-heading">챌린지</div>

				<!-- Table -->
				<table class="table table-hover table-striped table-condensed ">
					<tr>
						<th>1등</th>
					</tr>
					<tr>
						<th>2등</th>
					</tr>
					<tr>
						<th>3등</th>
					</tr>
					<tr>
						<th>4등</th>
					</tr>
					<tr>
						<th>5등</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-1"></div>



	<!-- hr -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
		<div class="col-lg-1"></div>
	</div>


	<!-- 배너 타이틀 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div id="carouselExampleControls"
			class="col-lg-10 carousel slide text-center w-100 mb-3"
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



	<!-- 배너 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-3"></div>
		<div class="col-lg-4"></div>
		<div class="col-lg-3"></div>
		<div class="col-lg-1"></div>
	</div>

	<!-- hr -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<br>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 거래,질문 구역 header -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-6 mb-3">
			<h3>거래 게시판</h3>
		</div>
		<div class="col-lg-4 mb-3">
			<h3>질문 게시판</h3>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 중고거래 썸네일 -->

	<%
	List<BoardcDto> tradeList = new ArrayList<>();
	BoardcDto boardcDto = new BoardcDto();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	Add_fileDao add_fileDao = new Add_fileDao();
	BoardcDao boardCDao = new BoardcDao();

	tradeList = boardCDao.getList("팝니다");
	%>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-6 mb-4">
			<div class="row mb-3">
				<%
				for (int i = 0; i < 3; i++) {
					if (tradeList.size() <= i) {
						break;
					}
					boardcDto = tradeList.get(i);
				%>
				<div class="col-lg-4 col-md-4">
					<div class="card text-center" style="width: 15rem;">
						<img class="card-img-top"
							src="./upload/<%=add_fileDao.getDto(boardcDto.getBoard_Id()).getFile_name()%>"
							width="286px" height="180px" alt="Card image cap">
						<div class="card-body">
							<p class="card-text"><%=boardcDto.getCategory_Small()%></p>
							<p class="card-text"><%=boardcDto.getBoard_Editdate()%></p>
							<h6 class="card-title "><%=boardcDto.getBoard_Title()%></h6>
							<p class="card-text"><%=boardcDto.getMarket_Price()%>원
							</p>
							<a
								href="BoardC_product.jsp?Market_id=<%=boardcDto.getMarket_Id()%>"
								class="btn btn-primary card text-white bg-dark">상세내용</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="row">
				<%
				for (int i = 3; i < 6; i++) {
					if (tradeList.size() <= i) {
						break;
					}
					boardcDto = tradeList.get(i);
				%>
				<div class="col-lg-4 col-md-4">
					<div class="card text-center" style="width: 15rem;">
						<img class="card-img-top"
							src="./upload/<%=add_fileDao.getDto(boardcDto.getBoard_Id()).getFile_name()%>"
							width="286px" height="180px" alt="Card image cap">
						<div class="card-body">
							<p class="card-text"><%=boardcDto.getCategory_Small()%></p>
							<p class="card-text"><%=boardcDto.getBoard_Editdate()%></p>
							<h6 class="card-title "><%=boardcDto.getBoard_Title()%></h6>
							<p class="card-text"><%=boardcDto.getMarket_Price()%>원
							</p>
							<a
								href="BoardC_product.jsp?Market_id=<%=boardcDto.getMarket_Id()%>"
								class="btn btn-primary card text-white bg-dark">상세내용</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<%
		arrayList = boardDao.getList();

		arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("질문")).collect(Collectors.toList());
		%>
		<div class="col-lg-4 mb-4">
			<%
			for (int i = 0; i < 5; i++) {
				if(arrayList.size() <= i){
					break;
				}
				BoardDto boardDto = arrayList.get(i);
			%>
			<div class="border border-dark" >
			<h5 class="m-3"><%= boardDto.getBoard_title() %><span class="badge badge-secondary m-3" style="font-size:large;">작성자: <%=boardDto.getBoard_writer() %></span></h5>
			<p class="m-3"> <%= boardDto.getBoard_content() %> </p>
			<button class="btn btn-secondary m-3" onclick="location.href ='BoardB_view.jsp?board_id=<%=boardDto.getBoard_id()%>'">보러가기</button>
			</div>
			
			
			<%
			}
			%>
		</div>
		<div class="col-lg-1"></div>
	</div>





	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>



	<script>
		$('.carousel').carousel({
			interval : 3500
		})
	</script>

	<%@include file="./footer.jsp"%>
</body>
</html>
