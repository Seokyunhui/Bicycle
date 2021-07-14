<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
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
		
		PrintWriter script = response.getWriter();
		BoardDao boardDao = new BoardDao();
		int boardid = Integer.parseInt(request.getParameter("Board_id"));
		String boardTitle = request.getParameter("board_title");
		String boardContent = request.getParameter("Board_content");
		
		if(boardDao.update(boardid, boardTitle, boardContent)){
			script.println("<script>");
			script.println("alert('글 수정 성공');");
			script.println("location.href= './admin_BoardA.jsp'");
			script.println("</script>");	
		}else{
			script.println("<script>");
			script.println("alert(' 실패');");
			script.println("history.bac글 수정k();");
			script.println("</script>");	
		}
	
	%>
	
</body>
</html>