<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>	
<%@ page import="bbs.BbsDAO"%>	
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" ,initial-scale="1" >		
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css?101">
<title>PSK's SIMPLE BBS with Bootstrap</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			
		}
	%>


	<nav class ="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expand="false">
				<span class ="icon-bar"></span>
				<span class ="icon-bar"></span>
				<span class ="icon-bar"></span>
			</button>
			<a class ="navbar-brand" href="main.jsp">PSK's Simple BBS</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">HOME</a></li>
				<li><a href="main.jsp#introuducePSK">Who is PSK</a></li>
				<li class ="active"><a href="bbs.jsp">BBS</a></li>
			</ul>
			
			<% 	
				// if not login - show login/Join
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class = "dropdown-toggle"
					data-toggle="dropdown" role ="button" 
					aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-option-vertical"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">login</a></li>
						<li><a href="join.jsp">join</a></li>					
					</ul>
				</li>
			</ul>		
					
			<%
				}else{
				// 로그인이 되어있다면 - 회원관리/로그아웃 보이기
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class = "dropdown-toggle"
					data-toggle="dropdown" 
					role ="button" 
					aria-haspopup="true"
					aria-expanded="false">Mypage<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">logout</a></li>
					</ul>
				</li>
			</ul>
			
			<%
				}
			%>
			
		</div>	
	</nav>
	<div class="container" style="paddign-top:60px">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">No.</th>
						<th style="background-color: #eeeeee; text-align:center;">Title</th>
						<th style="background-color: #eeeeee; text-align:center;">ID</th>
						<th style="background-color: #eeeeee; text-align:center;">DATE</th>
					</tr>
				</thead>
				<tbody>
				<%
					// 게시글 출력
					
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber); // 배열. 게시글 목록
					for(int i = 0; i < list.size(); i++){
				%>
				
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> </a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"h"+list.get(i).getBbsDate().substring(14,16)+"m" %></td>
					</tr>
				<%
					}
				
				%>
				</tbody>
			</table>
			
			<%
				if(pageNumber !=1){
			%>
				<a href="bbs.jsp?pageNumber=<%= pageNumber-1%>" class="btn btn-success btn-arrow-left">prev</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%= pageNumber+1%>" class="btn btn-success btn-arrow-left">next</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">write</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>