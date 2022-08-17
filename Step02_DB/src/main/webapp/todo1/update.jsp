<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼전송되는 수정할 할일의 번호와 내용을 읽어와서
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	//2. DB 에 수정 반영하고
	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	boolean isSuccess=TodoDao.getInstance().update(dto);
	//3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
<div class="container">

	<h1>알림</h1>
	<%if(isSuccess){ %>
		<p>
			할일을 수정 했습니다. <a href="list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p>
			할일 수정 실패! <a href="updateform.jsp?num=<%=num%>">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html>









