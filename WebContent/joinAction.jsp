<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PSK's SIMPLE BBS with Bootstrap</title>
</head>
<body>
	<%
	
		if (user.getUserID() == null ||
			user.getUserPassword() == null ||
			user.getUserName() == null ||
			user.getUserGender() == null ||
			user.getUserEmail() == null ){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('There is something that has not been entered.')");
			script.println("history.back()");	// 이전 페이지로 사용자를 보냄
			script.println("</script>");
		
		}else{
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ID already exists.')");
				script.println("history.back()");	// 이전 페이지로 사용자를 보냄
				script.println("</script>");
			}
			else{
				session.setAttribute("userID", user.getUserID());	// 회원가입이 완료되면 세션에 userID값을 넣고 main.jsp로 이동  
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>

</body>
</html>