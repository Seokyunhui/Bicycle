<%@page import="java.io.PrintWriter"%>
<%@page import="database.ChallegeDao"%>
<%@page import="database.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
</style>
<title>동행하는 사람들...</title>
</head>
<body>
<%
MemberDao memberDao = new MemberDao();
ChallegeDao challegeDao = new ChallegeDao();
PrintWriter script = response.getWriter();

String writer = (String) session.getAttribute("userID"); //글 쓴이
int MemberUid = memberDao.getMemberUid(writer); //글 쓴이 기본키
int Challenge_dist = Integer.parseInt(request.getParameter("challenge_dist"));
String Challenge_content = request.getParameter("Challenge_content");



if(challegeDao.insert(MemberUid,Challenge_content ,Challenge_dist)){
	script.println("<script>");
	script.println("alert('글쓰기 성공');");
	script.println("location.href= './challenge.jsp'");
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