
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
TodoDao dao = TodoDao.getInstance();
boolean isSuccess = dao.delete(num);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("삭제했습니다.")
			location.href="list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("삭제 실패");
			location.href="list.jsp"
		</script>
	<%} %>
</body>
</html>