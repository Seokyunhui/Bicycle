 <%@page import="database.MemberDto"%>
<%@page import="database.MemberDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>

<title>로그인</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	MemberDto new_mem = new  MemberDto(id,"-",name,0,"-@-",2);
	MemberDao dao = new MemberDao();

	if(dao.getUserInfo(id) == null){
		dao.Mem_register(new_mem);
		script.println("<script>");
		script.println("alert('회원가입 성공');");
		script.println("location.href= './main.jsp'");
		script.println("</script>");	

		session.setAttribute("userID", id);
		session.setAttribute("userGroup", dao.getUserInfo(id).getMember_group());
		
	}else{
		script.println("<script>");
		script.println("alert('로그인 성공');");
		script.println("location.href= './main.jsp'");
		script.println("</script>");	
		session.setAttribute("userID", id);
		session.setAttribute("userGroup", dao.getUserInfo(id).getMember_group());
	}
	
	
	%>
</body>
</html>