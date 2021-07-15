<%@page import="java.io.PrintWriter"%>
<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		MemberDao memberDao = new MemberDao();
		String categoryLg = "지식정보";
		String categorySm = null;
		for(String value : request.getParameterValues("board_category_sm") ){
		 categorySm=value;
		};
		String boardTitle = request.getParameter("board_title");
		String boardContent = request.getParameter("Board_content");
		String writer = (String) session.getAttribute("userID");
		int MemberUid = memberDao.getMemberUid(writer);
		
		if(boardDao.insert(categoryLg, categorySm, boardTitle, boardContent, writer, MemberUid)){
			script.println("<script>");
			script.println("alert('글쓰기 성공');");
			script.println("location.href= './admin_BoardA.jsp'");
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