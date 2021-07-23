<%@page import="database.BoardDto"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.*"%>
<%@page import="database.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.MemberDao"%>
<%@page import="database.MemberDto"%>
<%@page import="database.CommentDao"%>
<%@page import="database.CommentDto"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">

</head>
<script type="text/javascript">
function guest_rep_onclick_codelete(action, id){
	var s = id;
	var a = action;
	var result = confirm("정말 삭제하시겠습니까 ?");
	 if(result)
     {
		var url = 'BoardB_M_comment_edit.jsp?action=' + encodeURI(a) +'&id=' + encodeURI(s); 
		window.location.href = url;     
     }
}
function guest_rep_onclick_coedit(action,id){
	var s = id;
	var a = action;
	window.open("BoardB_M_comment_editform.jsp?action="+encodeURI(a)+"&id=" +encodeURI(s),"댓글수정","width=400, height=300, left=100, top=50");
	//window.location.href = url; 
}
function guest_rep_onclick_reply(action, id){
	var s = id;
	var a = action;
	window.open("BoardB_M_commentform.jsp?action="+encodeURI(a)+"&id="+encodeURI(s),"댓글","width=400, height=300, left=100, top=50");
}
function guest_rep_onclick_edit(action,id){
	var s = id;
	var a = action;
	window.open("BoardB_M_editform.jsp?action="+encodeURI(a)+"&id="+encodeURI(s),"댓글수정","width=400, height=300, left=100, top=50");
	//window.location.href = url; 
}
function guest_rep_onclick_delete(action,id){
	var s = id;
	var a = action;
	var result = confirm("정말 삭제하시겠습니까 ?");
	 if(result)
     {
		var url = 'BoardB_M_edit.jsp?action=' + encodeURI(a) +'&id=' + encodeURI(s); 
		window.location.href = url;     
     }
    
}
</script>
<body>
	<%@ include file="./header.jsp"%>
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-7"></div>
		<div class="col-lg-3">
			<ul class="nav nav-pills justify-content-around display-5">
				<li><a href="BoardB_Q.jsp" class="navbar-link text-dark">질문게시판</a></li>
				<li>|</li>
				<li><a href="#" class="navbar-link text-dark">자유게시판</a></li>
				<li>|</li>
				<li><a href="BoardB_M.jsp" class="navbar-link text-dark">모이자!</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<br>
	</div>
	<%!
	BoardDao boardDao = new BoardDao();
	List<BoardDto> arrayList = new ArrayList<>();
	BoardDto boardDto;
	MemberDto memberDto;
	MemberDao m_dao = new MemberDao();

	CommentDao commentDao = new CommentDao();
	List<CommentDto> arrayList2 = new ArrayList<>();
	CommentDto CommentDto;
	%>
	<% 
	arrayList = boardDao.getList();
	arrayList = arrayList.stream().filter(list -> list.getCategory_small().equals("모이자")).collect(Collectors.toList());
	
	
	

%>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="guestList">
				<ol class="list-group">
					<li id="guest_rep_id" class="list-group-item">
						<!-- 글 시작 --> <% 
					for(int i = 0; i < arrayList.size(); i++){ 
						if(arrayList.size() < i) break;
						boardDto = arrayList.get(i);
					%>

						<div class="guest_rep_class">
							<strong><%=boardDto.getBoard_writer()%></strong> <small>
								<%=boardDto.getBoard_regdate() %></small> <span class="control">
								<%
								String id = (String)session.getAttribute("userID");
								int uid = 0;
								if(id != null){
									uid = m_dao.getMemberUid(id);
								}
								int b_m_uid = boardDto.getMember_uid();
								if (boardDto.getMember_uid() == uid){ %> <a href="#"
								onclick="guest_rep_onclick_edit('edit','<%=boardDto.getBoard_id()%>');"
								class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> <a
								href="#"
								onclick="guest_rep_onclick_delete('delete','<%=boardDto.getBoard_id() %>')"
								class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> 
								<%} %>
								 <!--if 문 추가 !-->
								 <%
								 if(id!=null){
								 %>
								 
								 <a	href="#" onclick="guest_rep_onclick_reply('comment','<%=boardDto.getBoard_id() %>')"
								class="btn btn-default btn-xs">&nbsp;<span>댓글</span></a>
							</span>
							<%}%>
							<div class="row">

								<div class="col-lg-10">
									<p><%=boardDto.getBoard_content() %></p>
								</div>
							</div>
								<!-- 댓글 시작 -->
				
							<%
							arrayList2 = commentDao.getList(boardDto.getBoard_id());
							for(int a = 0; a < arrayList2.size(); a++){ 
								if(arrayList2.size() < a) break;
									CommentDto = arrayList2.get(a);%>
							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-10">
									<ul class="list-group">
										<li id="guest_rep_id" class="list-group-item">
											<div class="guest_rep_class">
												<strong><%=CommentDto.getComment_name()%></strong> <small><%=CommentDto.getComment_regdate() %></small>
												<span class="control"> 
												<%
								String c_id = (String)session.getAttribute("userID");
								int c_uid = 0;
								if(id != null){
									c_uid = m_dao.getMemberUid(c_id);
								}
								if (CommentDto.getMember_uid() == c_uid){ %> 
								<a href="#"	onclick="guest_rep_onclick_coedit('edit','<%=CommentDto.getComment_id()%>')"
													class="btn btn-default btn-xs"> <span>수정</span></a> 
													<a
													href="#"
													onclick="guest_rep_onclick_codelete('delete','<%=CommentDto.getComment_id()%>')"
													class="btn btn-default btn-xs"><span>삭제</span></a>
													 <%} %>
												</span>
												<p><%=CommentDto.getComment_content() %></p>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-1"></div>
							</div>
						<br>
						<% } %><!-- 댓글 끝 -->
						</div> <br> 
						<% 	} %> 
						<br> <br>
					</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<div class="row">
		<br>
	</div>
	<% 
	String id = (String)session.getAttribute("userID");
	if(id != null){
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
<% } %>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10"></div>
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