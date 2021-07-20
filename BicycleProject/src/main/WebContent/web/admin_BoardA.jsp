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
				<li><a href="#section1" class="navbar-link text-dark">자전거
						종류</a></li>
				<li></li>
				<li><a href="#section2" class="navbar-link text-dark">유의사항</a></li>
				<li></li>
				<li><a href="#section3" class="navbar-link text-dark">대처사항</a></li>
			</ul>
		</div>
	</div>



	<%!BoardDao boardDao = new BoardDao();
	List<BoardDto> arrayList = new ArrayList<>();
	BoardDto boardDto;%>


	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<%
			for (int i = 1; i <= 3; i++) {
			%>
			<%
			if (i == 1) {
				arrayList = boardDao.getList();//현재 board 테이블에 있는 모든 값을 객체화 하여 ArrayList 컬렉션으로 대입
				arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("자전거 종류"))
				.collect(Collectors.toList());
				//board 테이블안 행 요소들의 category_sm 값이 자전거 종류(공백포함) 인 요소들만 필터링하여 List 타입으로 리턴
			%>
			<div id="section<%=i%>" class="container-fluid text-center"
				style="padding-top: 35px; padding-bottom: 35px">

				<h1>지식정보</h1>
				<div class="text-right">
					<a href="admin_BoardA_write.jsp" class="btn btn-uni btn-sm">글
						쓰기</a>
				</div>


			</div>


			<%
			for (int k = 0; k < arrayList.size(); k++) {
				//k가 arrayList 안 객체숫자보다 클때까지 반복
				boardDto = arrayList.get(k);//arrayList의 k 번째 값을 boardDto에 대입 *제네릭타입은 <BoardDto> 이다.*
			%>

			<div class="row justify-content-end">

				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_update.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<!-- k번째 boardDto.getBoard_id() 리턴값 으로 form태그 action 태그안 Board_id 값을 지정  -->
						<button type="submit" class="btn btn-uni btn-sm">글 수정</button>
					</form>
				</div>
				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_delete_action.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<!-- k번째 boardDto.getBoard_id() 리턴값 으로 form태그 action 태그안 Board_id 값을 지정  -->
						<button type="submit" class="btn btn-uni btn-sm mr-3"
							onclick="return confirm('정말로 삭제하시겠습니까?')">글 삭제</button>
					</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-4"></div>
				<div class="col-md-4 text-center">
					<h3>
						<%=boardDto.getBoard_title()%> <!-- k번째 boardDto의 Board_title 필드값 get 메소드로 호출 -->
					</h3>
					<br>
					<p>
						<%=boardDto.getBoard_content()%><!-- k번째 boardDto의 Board_content 필드값 get 메소드로 호출 -->
					</p>

				</div>
				<div class="col-md-4"></div>
			</div>
			<%
			}
			%>

			<hr>




			<%
			} else if (i == 2) {//i가 2일때 category_sm 값이 유의사항인 객체를 필터링
			arrayList = boardDao.getList();
			arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("유의사항")).collect(Collectors.toList());
			%>
			<div id="section<%=i%>" class="container-fluid text-center"
				style="padding-top: 35px; padding-bottom: 35px">

				<h1>대처사항</h1>
				<div class="text-right">
					<a href="admin_BoardA_write.jsp" class="btn btn-uni btn-sm">글
						쓰기</a>
				</div>


			</div>

			<%
			for (int k = 0; k < arrayList.size(); k++) {

				boardDto = arrayList.get(k);
			%>




			<div class="row justify-content-end">

				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_update.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<button type="submit" class="btn btn-uni btn-sm">글 수정</button>
					</form>
				</div>
				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_delete_action.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<button type="submit" class="btn btn-uni btn-sm mr-3"
							onclick="return confirm('정말로 삭제하시겠습니까?')">글 삭제</button>
					</form>
				</div>
			</div>
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
			<%
			}
			%>

			<hr>

			<%
			} else if (i == 3) { //i가 2일때 category_sm 값이 대처사항 인 객체를 필터링
			arrayList = boardDao.getList();
			arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("대처사항")).collect(Collectors.toList());
			%>
			<div id="section<%=i%>" class="container-fluid text-center"
				style="padding-top: 35px; padding-bottom: 35px">

				<h1>유의사항</h1>
				<div class="text-right">
					<a href="admin_BoardA_write.jsp" class="btn btn-uni btn-sm">글
						쓰기</a>
				</div>


			</div>

			<%
			for (int k = 0; k < arrayList.size(); k++) {
				boardDto = arrayList.get(k);
			%>

			<div class="row justify-content-end">

				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_update.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<button type="submit" class="btn btn-uni btn-sm">글 수정</button>
					</form>
				</div>
				<div class="col-md-1 text-right">
					<form
						action="admin_BoardA_delete_action.jsp?Board_id=<%=boardDto.getBoard_id()%>"
						method="post">
						<button type="submit" class="btn btn-uni btn-sm mr-3"
							onclick="return confirm('정말로 삭제하시겠습니까?')">글 삭제</button>
					</form>
				</div>
			</div>
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
			<%
			}
			%>

			<hr>
			<%
			}
			}
			%>

		</div>
		<div class="col-lg-1"></div>
	</div>





	<%@include file="./footer.jsp"%>
</body>
</html>