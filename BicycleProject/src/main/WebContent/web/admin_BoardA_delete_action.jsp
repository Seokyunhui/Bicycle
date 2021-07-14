<%@page import="java.io.PrintWriter"%>
<%@page import="database.BoardDao"%>
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
	BoardDao boardDao = new BoardDao();
	PrintWriter script = response.getWriter();
	int boardid = Integer.parseInt(request.getParameter("Board_id"));
	
	if(boardDao.delete(boardid)){
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './admin_BoardA.jsp'");
		script.println("</script>");	
	}
	%>
</body>
</html>