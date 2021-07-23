<%@page import="database.Add_fileDto"%>
<%@page import="database.Add_fileDao"%>
<%@page import="database.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="database.BoardDao"%>
<%@page import="database.MarketBoardDao"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행하는 사람들</title>
</head>
<body>

	<%
	int market_id = Integer.parseInt(request.getParameter("market_id"));
	
	PrintWriter script = response.getWriter();

	BoardDao boardDao = new BoardDao();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	BoardDto boardDto = marketBoardDao.getDto(market_id);
	
	Add_fileDao add_fileDao = new Add_fileDao();
	Add_fileDto add_fileDto = add_fileDao.getDto(boardDto.getBoard_id());
	
	int board_id = boardDto.getBoard_id();
	if (boardDao.delete(board_id)) {
		add_fileDao.deleteFile(add_fileDto.getFile_name());
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './BoardC_S.jsp'");
		script.println("</script>");
	}
	%>

</body>
</html>