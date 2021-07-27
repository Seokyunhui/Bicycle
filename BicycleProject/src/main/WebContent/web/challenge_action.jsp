<%@page import="database.Add_fileDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String writer = (String) session.getAttribute("userID"); //글 쓴이

	String Dir = "j:/Bicycle/Bicycle/BicycleProject/src/main/WebContent/web/Challenge/" + writer;
	Add_fileDao add_fileDao = new Add_fileDao();

	add_fileDao.createFolder(Dir);

	MultipartRequest multi = new MultipartRequest(request, Dir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

	MemberDao memberDao = new MemberDao();
	ChallegeDao challegeDao = new ChallegeDao();
	PrintWriter script = response.getWriter();

	int MemberUid = memberDao.getMemberUid(writer); //글 쓴이 기본키
	int Challenge_dist = Integer.parseInt(multi.getParameter("challenge_dist"));
	String Challenge_content = multi.getParameter("Challenge_content");

	if (challegeDao.insert(MemberUid, Challenge_content, Challenge_dist)) {
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