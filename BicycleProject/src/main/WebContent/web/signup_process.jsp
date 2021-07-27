<%@ page contentType="text/html; charset=utf-8"%>
 <%@ page import= "database.MemberDto" %>
 <%@ page import = "database.MemberDao" %>
 <%@ page import ="java.io.PrintWriter" %>
<html>
<head>
<title>Validation</title>
</head>
<body>
	<%
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone =request.getParameter("phonenum");
		String email = request.getParameter("email");
		
		int phonenum = Integer.parseInt(phone);
		
		MemberDto new_mem = new MemberDto(id,pw,name,phonenum,email,1);
		MemberDao dao = new MemberDao();
		
		int state = dao.Mem_register(new_mem);
		
		if( state == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공');");
			script.println("location.href= './main.jsp'");
			script.println("</script>");	
		} else if( state == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디가 존재합니다.');");
			script.println("history.back();");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 실패');");
			script.println("history.back();");
			script.println("</script>");
		}
		
		
		
	%>

</body>
</html>