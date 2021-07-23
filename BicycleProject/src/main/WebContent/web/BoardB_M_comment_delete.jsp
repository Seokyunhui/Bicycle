<%@page import="java.io.PrintWriter"%>
<%@page import="database.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	CommentDao commentDao = new CommentDao();
	PrintWriter script = response.getWriter();
	int commentid = Integer.parseInt(request.getParameter("Board_id"));
	
	if(commentDao.delete(commentid)){
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './BoardB_M.jsp'");
		script.println("</script>");	
	} 
	%>
</body>
</html>