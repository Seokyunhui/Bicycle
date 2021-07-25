<%@page import="java.io.PrintWriter"%>
<%@page import="database.MemberDao"%>
<%@page import="database.ChallegeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	ChallegeDao challegeDao = new ChallegeDao();
	
	MemberDao memberDao = new MemberDao();
	
	String writer = (String) session.getAttribute("userID");
	int Challenge_id = Integer.parseInt(request.getParameter("Challenge_id"));
	
	PrintWriter script = response.getWriter();
	
	
	
	if(challegeDao.update(1, Challenge_id )){
		script.println("<script>");
		script.println("alert('등록 완료');");
		script.println("location.href= './admin_challenge.jsp?check=0'");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('등록 실패');");
		script.println("history.back();");
		script.println("</script>");
	}
	
	
	%>
</body>
</html>