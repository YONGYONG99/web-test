<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //할일 목록 읽어오기
   List<TodoDto> list=TodoDao.getInstance().getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
   <a href="insertform.jsp">할일 추가</a>
   <h1>할일 목록 입니다.</h1>
   <table class="table table-bordered">
      <thead class="table-dark">
         <tr>
            <th>번호</th>
            <th>내용</th>
            <th>등록일</th>
            <th>수정</th>
            <th>삭제</th>
         </tr>
      </thead>
      <tbody>
      <%for(TodoDto tmp:list){ %>
         <tr>
            <td><%=tmp.getNum() %></td>
            <td><%=tmp.getContent() %></td>
            <td><%=tmp.getRegdate() %></td>
            <td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
            <td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
         </tr>
      <%} %>
      </tbody>
   </table>
</div>
</body>
</html>




