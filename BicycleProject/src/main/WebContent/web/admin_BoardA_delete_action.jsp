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
	//삭제 구현부 클래스 boardDao 생성
	BoardDao boardDao = new BoardDao();
	PrintWriter script = response.getWriter();
	int boardid = Integer.parseInt(request.getParameter("Board_id"));
	
	//db 에서 boardid 값으로 판단하여 삭제하는 메소드 사용 리턴 타입이 boolean
	if(boardDao.delete(boardid)){
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './admin_BoardA.jsp'");
		script.println("</script>");	
	} 
	%>
</body>
</html>