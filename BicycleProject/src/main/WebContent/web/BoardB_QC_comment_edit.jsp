<%@page import="database.CommentDto"%>
<%@page import="database.MemberDao"%>
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
		CommentDao commentDao = new CommentDao();
		String action = request.getParameter("action");
		
		int board_id = Integer.parseInt(request.getParameter("id"));

		if(action.equals("delete")){
			commentDao.delete(board_id);
			response.sendRedirect("./BoardB_view.jsp?board_id="+ board_id);
		}else{
			String commentContent = request.getParameter("BoardB_M_Comment_Contents");

			if (commentDao.update(board_id, commentContent)) {
				script.println("<script>");
				script.println("alert('글쓰기 성공');");
				script.println("window.close()");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('글쓰기 실패');");
				script.println("history.back();");
				script.println("</script>");
			}
			//response.sendRedirect("./BoardB_view.jsp?board_id="+ board_id);
		}
	%>

</body>
</html>