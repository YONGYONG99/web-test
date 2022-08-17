

<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	dto.setRegdate(regdate);
	
	TodoDao dao = TodoDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){%>
			<p class="alert alert-success">할일을 추가하겠습니다</p>
			<a class="alert-link" href="list.jsp">확인</a>
	 	<%}else{ %>
	 		<p class="alert alert-danger">추가를 실패하였습니다.</p>
	 		<a class="alert-link" href="insertform.jsp">다시 입력</a>
	 	<%} %>		
	</div>
</body>
</html>