<%@page import="java.io.File"%>
<%@page import="database.Add_fileDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	 /*절대경로 본인껄로 바꿔 쓰세요 J = D J:\Bicycle\Bicycle\BicycleProject\src\main\WebContent\web\\upload*/
	MultipartRequest multi = new MultipartRequest(request, "J:/Bicycle/Bicycle/BicycleProject/src/main/WebContent/web/upload", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	

	String file = (String) files.nextElement();
	String filename = multi.getFilesystemName(file); //
	
	String file_contenttype = multi.getContentType(file);
	File filesize = multi.getFile(file); 
	int file_Size = (int) filesize.length();
	String file_Dir = "J:/Bicycle/BicycleProject/src/main/WebContent/web/upload" + filename;
	
	
	
	PrintWriter script = response.getWriter();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	Add_fileDao add_fileDao = new Add_fileDao();
	BoardDao boardDao = new BoardDao();
	MemberDao memberDao = new MemberDao();

	String categoryLg = "중고거래"; // 대분류
	String categorySm = null; // 소분류
	String market_board_addr = null; // 중고거래 지역
	String marketName = null; // 중고거래 물품 종류
	
	//카테고리 콤보박스
	for (String value : multi.getParameterValues("board_category_sm")) { // 중고거래 소분류 가져오기
		categorySm = value;
	}
	
	for (String value : multi.getParameterValues("market_board_addr")) { // 중고거래 지역 가져오기
		market_board_addr = value;
	}
	for (String value : multi.getParameterValues("market_name")) { // 물품 종류
		marketName = value;
	}
	int market_price = Integer.parseInt(multi.getParameter("market_price"));
	String boardTitle = multi.getParameter("board_title"); // 글 제목
	String boardContent = multi.getParameter("Board_content"); //글 내용
	String writer = (String) session.getAttribute("userID"); //글 쓴이
	int MemberUid = memberDao.getMemberUid(writer); //글 쓴이 기본키

		
	if (boardDao.insert(categoryLg, categorySm, boardTitle, boardContent, writer, MemberUid)) {
		int board_id = boardDao.getboardId(writer, boardContent, MemberUid);
		if (marketBoardDao.insert(MemberUid, market_board_addr, marketName, market_price, board_id) && add_fileDao.insert(filename, file_Size, file_Dir, file_contenttype, board_id, MemberUid) ) {
			script.println("<script>");
			script.println("alert('글쓰기 성공');");
			script.println("location.href= './BoardC_S.jsp'");
			script.println("</script>");
		}

	} else {
		script.println("<script>");
		script.println("alert('글쓰기 실패');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>

</body>
</html>