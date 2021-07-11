<%@page import = "database.MemberDao" %>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
	MemberDao dao = new MemberDao(request);
	PrintWriter script = response.getWriter();
	String id = request.getParameter("userID");
	int state = dao.loginCheck();
	
	if(state == 1){
			script.println("<script>");
			script.println("alert('로그인 성공');");
			script.println("location.href= './main.jsp'");
			script.println("</script>");
			
			session.setAttribute("userID", id);
			String sessionID = (String) session.getAttribute("id");
			script.println("<script>");
			script.println("alert(sessionID);");
			script.println("</script>");
			
		}else if (state == -1){
			script.println("<script>");
			script.println("alert('로그인 오류.');");
			script.println("history.back();");
			script.println("</script>");
		}else if(state == 0){
			script.println("<script>");
			script.println("alert('패스워드 오류.');");
			script.println("history.back();");
			script.println("</script>");
		}
%>
</body>
</html>