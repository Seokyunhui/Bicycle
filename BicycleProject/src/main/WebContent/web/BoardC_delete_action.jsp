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

	String fileName = "test.html"; //지울 파일명
	String fileDir = "fileDir"; //지울 파일이 존재하는 디렉토리
	String filePath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
	filePath += fileName;

	File f = new File(filePath); // 파일 객체생성
	if (f.exists())
		f.delete(); // 파일이 존재하면 파일을 삭제한다.

	BoardDto boardDto = marketBoardDao.getDto(market_id);
	int board_id = boardDto.getBoard_id();
	if (boardDao.delete(board_id)) {
		script.println("<script>");
		script.println("alert('글삭제 성공');");
		script.println("location.href= './BoardC_S.jsp'");
		script.println("</script>");
	}
	%>

</body>
</html>