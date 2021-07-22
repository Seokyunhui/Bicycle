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
	<% String  userID = null;
	PrintWriter script = response.getWriter();
	int board_id = Integer.parseInt(request.getParameter("board_id"));
	BoardDao boardDao = new BoardDao();	
	if(session.getAttribute("userID") ==null){
		script.println("<script>");
		script.println("alert('로그인하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	
	}else{
		boardDao.delete(board_id);
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './BoardB_Q.jsp'");
		script.println("</script>");	
	} 
	
	%>
</body>
</html>