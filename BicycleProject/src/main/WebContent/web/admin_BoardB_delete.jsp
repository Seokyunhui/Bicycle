<%@page import="database.BoardDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% request.setCharacterEncoding("utf-8"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	BoardDao boardDao = new BoardDao();
	PrintWriter script = response.getWriter();
	String userID = null;
	String categoryLg = "소통";
	String categorySm = null;
	
	int boardid = Integer.parseInt(request.getParameter("board_id"));
	
	if(boardDao.delete(boardid)){
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './admin_BoardB_Q.jsp'");
		script.println("</script>");	
	} 
	%>
	
	%>
</body>
</html>