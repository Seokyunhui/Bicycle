<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
<!-- 리퀘스트로 받아오는 값들의 인코딩을 UTF-8로 선언 -->
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행하는 사람들...</title>
</head>
<body>
<%
		
		PrintWriter script = response.getWriter();
		BoardDao boardDao = new BoardDao();//게시판 DB 구현부 클래스 선언
		int boardid = Integer.parseInt(request.getParameter("Board_id"));//리퀘스트로 받아온 Board_id 값을 int 값으로 변환
		String boardTitle = request.getParameter("board_title");//board_title 값을 받아와서 대입
		String boardContent = request.getParameter("Board_content");//board_content 값을 받아와서 대입
		
		if(boardDao.update(boardid, boardTitle, boardContent)){//메소드 boardDao.update 호출 매개값 boardid, boardTitle, boardContent 을 가져와서 수정
			script.println("<script>");
			script.println("alert('글 수정 성공');");
			script.println("location.href= './admin_BoardA.jsp'");
			script.println("</script>");	
		}else{//실패시 false 를 리턴 하므로 else block 실행
			script.println("<script>");
			script.println("alert('글 수정 실패');");
			script.println("history.back();");
			script.println("</script>");	
		}
	
	%>
	
</body>
</html>