<%@page import="database.CommentDto"%>
<%@page import="database.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<%
	String B_id = request.getParameter("id");
	int id = Integer.parseInt(B_id);
	CommentDao dao= new CommentDao();
	CommentDto dto = dao.getcontent(id);
%>

</head>
<body>
	<div id = "wrap">
	<br>
	<b><font size="5" color ="gray">댓글 수정</font></b>
	<hr>
	<br>
	
	<div id = "editForm">
		<form name ="editInfo" method="post" action ="BoardB_QC_comment_edit.jsp?action=edit">
			<input type="hidden" name="id" value=<%=B_id%>> 
			<textarea rows = "7" cols ="70" name ="BoardB_M_Comment_Contents"><%=dto.getComment_content() %></textarea>
			<br><br>
			<input type = "submit" value = "등록" >
			<input type = "button" value = "창닫기" onclick ="window.close()">
		</form>
	</div>
	
	</div>

</body>
</html>