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
<title>중고거래 삭제~</title>
</head>
<body>

	<%
	PrintWriter script = response.getWriter();
	
	BoardDao boardDao = new BoardDao();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	int market_id = Integer.parseInt(request.getParameter("market_id"));

	BoardDto boardDto = marketBoardDao.getDto(market_id);
	int board_id = boardDto.getBoard_id();
	if(marketBoardDao.deletemarekt(board_id, market_id )){
		if(boardDao.delete(board_id)){
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './BoardC_S.jsp'");
		script.println("</script>");
		}
	} 
	
	
	%>

</body>
</html>