<%@page import="database.MemberDao"%>
<%@page import="database.BoardDao"%>
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
		BoardDao boardDao = new BoardDao();
		String action = request.getParameter("action");
		String b_id = request.getParameter("id");
		int Board_id = Integer.parseInt(b_id);
		if(action.equals("delete")){
			boardDao.delete(Board_id);
			script.println("<script>");
			script.println("location.href= './BoardB_M.jsp'");
			script.println("</script>");
		}else{
			String boardTitle = "-";
			String boardContent = request.getParameter("BoardB_M_Contents");

			if (boardDao.update(Board_id, boardTitle, boardContent)) {
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
		}
	%>

</body>
</html>