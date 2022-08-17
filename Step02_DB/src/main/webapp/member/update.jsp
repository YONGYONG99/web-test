<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    //1. 폼 전송되는 수정할 회원의 정보를 읽어온다.
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	int num = Integer.parseInt(request.getParameter("num"));
	//MemberDto 객체에 수정할 회원의 정보를 담는다.
	MemberDto dto = new MemberDto(num,name,addr);
	//2. DB에 수정 반영한다.
	boolean isSuccess=MemberDao.getInstance().update(dto);

	//3. 응답한다.
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
   		<%if(isSuccess){ %>
   			<p class="alert alert-success">
   				<strong><%=num %></strong> 번의 정보를 수정 했습니다.
   				<a class="alert-link" href="list.jsp">확인</a>
   			</p>
      		
   		<%}else {%>
   			<p class="alert alert=danger">
   				회원 정보 추가실패
   				<a class="alert-link" href="insertform.jsp">다시 입력</a>
   			</p>
   		<%} %>
   </div>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>