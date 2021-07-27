<%@page import="database.BoardcDto"%>
<%@page import="database.BoardcDao"%>
<%@page import="database.Add_fileDto"%>
<%@page import="database.Add_fileDao"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="database.BoardDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
<%@page import="database.MarketBoardDao"%>

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
	//파일 경로 수정
	MultipartRequest multi = new MultipartRequest(request,"E:/유창석/bicycleproject/Bicycle/BicycleProject/src/main/WebContent/web/upload", 5 * 1024 * 1024, "utf-8",
			new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();

	String file = (String) files.nextElement();
	String filename = multi.getFilesystemName(file); //

	String file_contenttype = multi.getContentType(file);
	File filesize = multi.getFile(file);
	int file_Size = (int) filesize.length();
	String file_Dir = "E:/유창석/bicycleproject/Bicycle/BicycleProject/src/main/WebContent/web/upload" + filename;


	PrintWriter script = response.getWriter();

	BoardDao boardDao = new BoardDao();//게시판 DB 구현부 클래스 선언
	BoardcDao boardcDao = new BoardcDao();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	Add_fileDao add_fileDao = new Add_fileDao();
	Add_fileDto add_fileDto;

	int market_id = Integer.parseInt(multi.getParameter("market_id"));//리퀘스트로 받아온 Board_id 값을 int 값으로 변환
	BoardcDto boardcDto = boardcDao.getDto(market_id);
	int boardid = boardcDto.getBoard_Id();

	add_fileDto = add_fileDao.getDto(boardid);

	String market_name = null;
	String market_addr = null;
	for (String value : multi.getParameterValues("market_name")) { // 물품 종류
		market_name = value;
	}
	for (String value : multi.getParameterValues("market_board_addr")) { // 거래 지역
		market_addr = value;
	}

	String boardTitle = multi.getParameter("board_title");//board_title 값을 받아와서 대입
	String market_price = multi.getParameter("market_price");
	String boardContent = multi.getParameter("Board_content");//board_content 값을 받아와서 대입
	String filedeletename = add_fileDto.getFile_name();

	if (boardDao.update(boardid, boardTitle, boardContent)) {//메소드 boardDao.update 호출 매개값 boardid, boardTitle, boardContent 을 가져와서 수정
		if (marketBoardDao.updateMarket(market_id, market_name, market_addr, market_price)
		&& add_fileDao.update(filename, file_Size, file_Dir, file_contenttype, boardid)) {
			add_fileDao.deleteFile(filedeletename);
			script.println("<script>");
			script.println("alert('글 수정 성공');");
			script.println("location.href= './BoardC_S.jsp'");
			script.println("</script>");
		}
	} else {//실패시 false 를 리턴 하므로 else block 실행
		script.println("<script>");
		script.println("alert('글 수정 실패');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>

</body>
</html>