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
		//스크립트 처리 
		PrintWriter script = response.getWriter();
		BoardDao boardDao = new BoardDao(); //board 테이블 관련 기능구현 클래스 호출
		MemberDao memberDao = new MemberDao();//member 테이블 관련 기능 구현 클래스 호출
		String categoryLg = "지식정보"; //categotyLg 초기값 대입
		String categorySm = null;	//categorySm 변수 선언
		for(String value : request.getParameterValues("board_category_sm") ){//foreach문으로 콤보박스에서 선택한 값을 categorysm 에 대입
		 categorySm=value;
		};
		String boardTitle = request.getParameter("board_title"); // board_title 값을 대입 
		String boardContent = request.getParameter("Board_content");//board_content
		String writer = (String) session.getAttribute("userID");//login_process 에서 set 한 userId(아이디값) get 메소드로 호출
		int MemberUid = memberDao.getMemberUid(writer); // userid(아이디) 값으로 member테이블 기본키값 가져오는 메소드 호출
		
		if(boardDao.insert(categoryLg, categorySm, boardTitle, boardContent, writer, MemberUid)){ // db 에 insert 하는 메소드 호출
			script.println("<script>");
			script.println("alert('글쓰기 성공');");
			script.println("location.href= './admin_BoardA.jsp'");
			script.println("</script>");	
		}else{//db에 입력 불가시 실행하는 else block
			script.println("<script>");
			script.println("alert('글쓰기 실패');");
			script.println("history.back();");
			script.println("</script>");	
		}
	
	%>
	
</body>
</html>