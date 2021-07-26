<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.*"%>
<%@page import="database.BoardDto"%>
<%@page import="database.BoardDao"%>
<%@page import="database.MemberDao"%>
<%@page import="database.MemberDto"%>
<%@page import="database.CommentDao"%>
<%@page import="database.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String pageNum = request.getParameter("pageNum");
String pageState = request.getParameter("pageBlock");
int currentPage = 1;
if (pageNum != null)
	currentPage = Integer.parseInt(pageNum);
int pageDisplayNum = 5;

int startNum = currentPage;

if (pageState == null) {
} else if (pageState.equals("Next"))
	startNum += 1;
else if (pageState.equals("Previous"))
	startNum = (startNum <= 1) ? 1 : startNum - 1;
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">

</head>
<!--대댓글 삭제 스크립트-->
<script type="text/javascript">
	function guest_rep_onclick_codelete(action, id) {
		var s = id;
		var a = action;
		var result = confirm("정말 삭제하시겠습니까 ?");
		if (result) {
			var url = 'BoardB_M_comment_edit.jsp?action=' + encodeURI(a)
					+ '&id=' + encodeURI(s);
			window.location.href = url;
		}
	}
<!--대댓글 수정 스크립트-->
	function guest_rep_onclick_coedit(action, id) {
		var s = id;
		var a = action;
		window.open("BoardB_M_comment_editform.jsp?action=" + encodeURI(a)
				+ "&id=" + encodeURI(s), "댓글수정",
				"width=400, height=300, left=100, top=50");

	}
<!--대댓글 스크립트-->
	function guest_rep_onclick_reply(action, id) {
		var s = id;
		var a = action;
		window
				.open("BoardB_M_commentform.jsp?action=" + encodeURI(a)
						+ "&id=" + encodeURI(s), "댓글",
						"width=400, height=300, left=100, top=50");
	}
<!--댓글 수정 스크립트-->
	function guest_rep_onclick_edit(action, id) {
		var s = id;
		var a = action;
		window.open("BoardB_M_editform.jsp?action=" + encodeURI(a) + "&id="
				+ encodeURI(s), "댓글수정",
				"width=400, height=300, left=100, top=50");
	}
<!--댓글 삭제 스크립트-->
	function guest_rep_onclick_delete(action, id) {
		var s = id;
		var a = action;
		var result = confirm("정말 삭제하시겠습니까 ?");
		if (result) {
			var url = 'BoardB_M_edit.jsp?action=' + encodeURI(a) + '&id='
					+ encodeURI(s);
			window.location.href = url;
		}
	}
</script>
<body>
	<%@ include file="./header.jsp"%>
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
	</div>

	<!-- hr -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 소제목 -->
	<div class="row">
		<div class="col-lg-8"></div>
		<div class="col-lg-3" data-spy="scroll" data-target=".navbar">
			<ul class="nav nav-pills justify-content-around display-5 ">
				<li><a href="BoardB_Q.jsp" class="navbar-link text-dark">질문게시판</a></li>
				<li>|</li>
				<li><a href="BoardB_C.jsp" class="navbar-link text-dark">자유게시판</a></li>
				<li>|</li>
				<li><a href="#section3" class="navbar-link text-dark">모이자!</a></li>
			</ul>
		</div>
		<div class="col-lg-1"></div>
	</div>
	
	
	<div class="row">
		<br>
	</div>

	<%!BoardDao boardDao = new BoardDao();
	List<BoardDto> arrayList = new ArrayList<>();
	BoardDto boardDto;
	MemberDto memberDto;
	MemberDao m_dao = new MemberDao();

	CommentDao commentDao = new CommentDao();
	List<CommentDto> arrayList2 = new ArrayList<>();
	CommentDto CommentDto;%>
	<%
	arrayList = boardDao.getList();
	arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("모이자")).collect(Collectors.toList());
	%>
	<!--댓글 시작-->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="guestList">
				<ol class="list-group">
					<li id="guest_rep_id" class="list-group-item">
<%
 for (int i = pageDisplayNum * (currentPage - 1); i < (pageDisplayNum * currentPage); i++) {
 	if (pageDisplayNum * (currentPage - 1) > arrayList.size())
 		break;
 	if (i >= arrayList.size())
 		break;
 	boardDto = arrayList.get(i);
 %>
						<!-- 댓글 작성자, 작성 시간 -->
						<div class="guest_rep_class">
							<strong><%=boardDto.getBoard_writer()%></strong> 
							<small><%=boardDto.getBoard_regdate()%></small> 
							<span class="control">
<!-- 자신의 댓글에 대한 권한 주기 --> 
<%
 String id = (String) session.getAttribute("userID");
 int uid = 0;
 if (id != null) {
 	uid = m_dao.getMemberUid(id);
 }
 int b_m_uid = boardDto.getMember_uid();
 if (boardDto.getMember_uid() == uid) {
 %> 
 								<!-- 댓글 수정 및 삭제 -->
 								<a href="#" onclick="guest_rep_onclick_edit('edit','<%=boardDto.getBoard_id()%>');"
								class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> 
								<a href="#" onclick="guest_rep_onclick_delete('delete','<%=boardDto.getBoard_id()%>')"
								class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> 
<!-- 관리자 권한 -->
<%
 } else if (id != null && m_dao.getUserGroup(id).equals("5")) {
%> 	
								<a href="#" onclick="guest_rep_onclick_delete('delete','<%=boardDto.getBoard_id()%>')"
								class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> 
								<%}%>
<!-- 비회원이 아니면 리플 가능 --> 
<%
 if (id != null) {
%> 								<a href="#" onclick="guest_rep_onclick_reply('comment','<%=boardDto.getBoard_id()%>')"
								class="btn btn-default btn-xs">&nbsp;<span>댓글</span></a>
							</span>
							<%}%>
							
							<!-- 댓글 내용 -->
							<div class="row">

								<div class="col-lg-10">
									<p><%=boardDto.getBoard_content()%></p>
								</div>
							</div>
							
							
							<!-- 대댓글 시작 -->
							<%
							arrayList2 = commentDao.getList(boardDto.getBoard_id());
							for (int a = 0; a < arrayList2.size(); a++) {
								if (arrayList2.size() < a)
									break;
								CommentDto = arrayList2.get(a);
							%>
							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-10">
									<!-- 대댓글 구분 -->
									<ul class="list-group">
										<li id="guest_rep_id" class="list-group-item">
											<div class="guest_rep_class">
												<strong><%=CommentDto.getComment_name()%></strong> 
												<small><%=CommentDto.getComment_regdate()%></small>
												<span class="control"> 
<!-- 자신의 대댓글에 대한 권한주기 -->
<%							
 String c_id = (String) session.getAttribute("userID");
 int c_uid = 0;
 if (id != null) {
 	c_uid = m_dao.getMemberUid(c_id);
 }
 if (CommentDto.getMember_uid() == c_uid) {
 %>
 													<a href="#" onclick="guest_rep_onclick_coedit('edit','<%=CommentDto.getComment_id()%>')"
													class="btn btn-default btn-xs"> <span>수정</span></a> 
													<a href="#" onclick="guest_rep_onclick_codelete('delete','<%=CommentDto.getComment_id()%>')"
													class="btn btn-default btn-xs"><span>삭제</span></a> 								
<!-- 관리자 권한 -->
<%
 } else if (c_id != null && m_dao.getUserGroup(c_id).equals("5")) {
 %> 												
 
 													<a href="#" onclick="guest_rep_onclick_codelete('delete','<%=CommentDto.getComment_id()%>')"
													 class="btn btn-default btn-xs"><span>삭제</span></a> <%
 }
 %>
												</span>
												<!-- 대댓글 내용 -->
												<p><%=CommentDto.getComment_content()%></p>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-1"></div>
							</div>
							<br>

							<%
							}
							%><!-- 댓글 끝 -->
						</div> <br> <%
 }
 %> <br> <br>
					</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 댓글 등록 창 -->
	<div class="row">
		<br>
	</div>
	<%
	String id = (String) session.getAttribute("userID");
	if (id != null) {
	%>
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<form action="BoardB_M_process.jsp" method="post">
				<textarea name="BoardB_M_Contents" class="form-control"
					style="resize: none;" placeholder="내용을 입력하세요"></textarea>
				<p class="text-center"></p>
				<input type="submit" value="등록" class="btn btn-default submit" />
			</form>
		</div>
		<div class="col-lg-1"></div>
	</div>
	<%
	}
	%>
	
	<!-- 한줄 공백 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10"></div>
		<div class="col-lg-1"></div>
	</div>

	<!-- 페이지 넘버 -->
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<nav style="text-align: center;">
				<ul class="pagination">
					<li><a
						href="./BoardB_M.jsp?pageBlock=Previous&pageNum=<%=currentPage%>"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<%
					for (int i = 0; i < pageDisplayNum; i++) {
					%>
					<%
					if ((startNum + i) == currentPage) {
					%>
					<li class="page-item active"><a
						href="./BoardB_M.jsp?pageNum=<%=startNum + i%>"><%=startNum + i%></a></li>
					<%
					} else {
					%>
					<li class="page-item"><a
						href="./BoardB_M.jsp?pageNum=<%=startNum + i%>"><%=startNum + i%></a></li>
					<%
					}
					}
					%>

					<li><a href="./BoardB_M.jsp?pageBlock=Next" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
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
	<%@include file="./footer.jsp"%>

</body>
</html>