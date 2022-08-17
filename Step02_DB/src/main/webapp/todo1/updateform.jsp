<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 할일 번호 읽어오기 
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 할일의 정보를 얻어와서
	TodoDto dto=TodoDao.getInstance().getData(num);
	//3. 할일 수정 폼을 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
</head>
<body>
<div class="container">
	<h1>할일 수정 양식</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>"/>
		<div>
			<label for="num">번호</label>
			<input type="text" id="num" value="<%=num%>" disabled/>
		</div>
		<div>
			<label for="content">내용</label>
			<input type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
		</div>
		<div>
			<label for="regdate">등록일</label>
			<input type="text" id="regdate" value="<%=dto.getRegdate()%>" disabled/>
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>

















