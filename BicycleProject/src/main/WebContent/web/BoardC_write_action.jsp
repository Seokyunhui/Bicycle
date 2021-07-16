<%@page import="database.MarketBoardDao"%>
<%@page import="database.BoardDto"%>
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
		MarketBoardDao boardDao = new MarketBoardDao();
		MemberDao memberDao = new MemberDao();
		
		
		String categoryLg = "중고거래"; 	 // 대분류
		String categorySm = null;		 // 소분류
		String market_board_addr = null; // 중고거래 지역
		String marketName = null; 		 // 중고거래 물품 종류
		
		for(String value : request.getParameterValues("board_category_sm") ){ // 중고거래 소분류 가져오기
		 	categorySm	= value;
		};
		for(String value : request.getParameterValues("market_board_addr")){ // 중고거래 지역 가져오기
			market_board_addr = value;
		}
		for(String value : request.getParameterValues("market_name")){
			marketName = value;
		}
		int market_price = Integer.parseInt(request.getParameter("market_price"));
		String boardTitle = request.getParameter("board_title"); 		// 글 제목
		String boardContent = request.getParameter("Board_content"); 	//글 내용
		String writer = (String) session.getAttribute("userID");		//글 쓴이
		int MemberUid = memberDao.getMemberUid(writer);					//글 쓴이 기본키
		
		if(boardDao.insert(categoryLg, categorySm, boardTitle, boardContent,
				writer, MemberUid, market_board_addr, marketName, market_price)){
			
			script.println("<script>");
			script.println("alert('글쓰기 성공');");
			script.println("location.href= './BoardC_S.jsp'");
			script.println("</script>");	
		}else{
			script.println("<script>");
			script.println("alert('글쓰기 실패');");
			script.println("history.back();");
			script.println("</script>");	
		}
	
	%>
	
</body>
</html>