<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PSK's SIMPLE BBS with Bootstrap</title>
</head>
<body>
	<%
		// 로그인 여부 확인  - 세션 값 할당여부 확인.
		String userID = null;
		
		// 할당이 되어있다면 비교를 위해 String userID에 세션 값을 등록
		if (session.getAttribute("userID") != null){				
			userID = (String) session.getAttribute("userID");	
		}
		
		// 할당받은 userID값(세션)이 널값인지 확인
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Already login')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result ==1){
			session.setAttribute("userID", user.getUserID());	// userID를 세션값에 넣기
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong password.')");
			script.println("history.back()");	// 이전 페이지로 사용자를 보냄
			script.println("</script>");
		}
		else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong ID')");
			script.println("history.back()");	// 이전 페이지로 사용자를 보냄
			script.println("</script>");
		}
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB err')");
			script.println("history.back()");	// 이전 페이지로 사용자를 보냄
			script.println("</script>");
		}
	%>

</body>
</html>