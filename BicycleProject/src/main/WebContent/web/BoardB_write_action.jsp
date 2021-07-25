<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardB_write_action</title>
</head>
<body>
			
			
			<% 
				PrintWriter script = response.getWriter();  //객체확인
				BoardDao boardDao = new BoardDao();			// DB연결해서 객체를 보내는곳 
				MemberDao memberDao = new MemberDao();		// DB연결
				
				
				//로그인 세션 확인 
				String userID = null;
				String categoryLg = "소통";
				String categorySm = null;
				
				for(String value : request.getParameterValues("board_category_sm")){
					categorySm = value;
					}
					String boardTitle = request.getParameter("board_title");
					String boardContent	= request.getParameter("board_content");
					String writer = (String) session.getAttribute("userID");
					int MemberId 	= memberDao.getMemberUid(writer);
					
					
				if(boardDao.insert(categoryLg,categorySm, boardTitle, boardContent ,writer,MemberId)){
					if(categorySm.equals("질문")){
					script.println("<script>");
					script.println("alert('등록되었습니다.')");
					script.println("location.href='BoardB_Q.jsp'");
					script.println("</script>");
					}else{
						categorySm.equals("자유");
						script.println("<script>");
						script.println("alert('등록되었습니다.')");
						script.println("location.href='BoardB_C.jsp'");
						script.println("</script>");
					}
				}else {
					script.println("<script>");
					script.println("alert('등록 실패 하였습니다.')");
					script.println("</script>");
				}
				
				
			%>
			

</body>
</html>