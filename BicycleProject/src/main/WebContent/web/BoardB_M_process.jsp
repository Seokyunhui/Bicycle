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
	MemberDao memberDao = new MemberDao();

	String categoryLg = "소통";
	String categorySm = null;

	String boardTitle = "-";
	String boardContent = request.getParameter("BoardB_M_Contents");
	String writer = (String) session.getAttribute("userID");
	int MemberUid = memberDao.getMemberUid(writer);

	if (boardDao.insert(categoryLg, categorySm, boardTitle, boardContent, writer, MemberUid)) {

		if (categorySm.equals("질문")) {
			script.println("<script>");
			script.println("alert('등록되었습니다.')");
			script.println("location.href='BoardB_view.jsp'");
			script.println("</script>");

		} else if (categorySm.equals("자유")) {
			script.println("<script>");
			script.println("alert('등록되었습니다.')");
			script.println("location.href='BoardB_view.jsp'");
			script.println("</script>");
		} else {
			categorySm.equals("모이자");
			script.println("<script>");
			script.println("alert('등록되었습니다.')");
			script.println("location.href='BoardB_M.jsp'");
			script.println("</script>");
		}
	}else {
		script.println("<script>");
		script.println("alert('글쓰기 실패');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>

</body>
</html>