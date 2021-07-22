<%@page import="database.BoardDao"%>
<%@page import="database.BoardDto"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	request.setCharacterEncoding("utf-8");
	
	BoardDao boardDao = new BoardDao();
	PrintWriter script = response.getWriter();
	int id = Integer.parseInt(request.getParameter("board_Id"));
	String boardTitle = request.getParameter("board_title");
	String boardContent = request.getParameter("Board_content");
	boolean board = boardDao.update(id, boardTitle, boardContent);
	if(board==true){
		script.println("<script>");
		script.println("alert('글 수정 성공');");
		script.println("location.href= './BoardB_Q.jsp'");
		script.println("</script>");	
	}else{
		script.println("<script>");
		script.println("alert('글 수정 실패');");
		script.println("history.back();");
		script.println("</script>");	
	}

%>
	%>
			
</body>
</html>