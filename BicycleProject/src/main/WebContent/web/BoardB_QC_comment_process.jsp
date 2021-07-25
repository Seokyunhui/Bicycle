<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
<%@page import="database.CommentDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<%
		request.setCharacterEncoding("utf-8");
		PrintWriter script = response.getWriter();
		CommentDao c_dao = new CommentDao();
		BoardDao b_dao = new BoardDao();
		MemberDao m_dao = new MemberDao();
	//Comment_name, Comment_content,C_Member_id,C_Board_id
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		String Comment_content = request.getParameter("BoardB_Contents");
		String writer = (String) session.getAttribute("userID");
		int MemberUid = m_dao.getMemberUid(writer);
		boolean result = c_dao.insert(writer, Comment_content, MemberUid, board_id);
		
		if (result==true) {
			script.println("<script>");
			script.println("alert('글쓰기 성공');");
			script.println("window.close()");
			response.sendRedirect("./BoardB_view.jsp?board_id="+ board_id);
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('글쓰기 실패');");
			script.println("history.back();");
			script.println("</script>");
		}
		
	%>
</body>
</html>