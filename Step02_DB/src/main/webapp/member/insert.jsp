<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //post 방식 전송 파라미터 추출할때 한글깨지지 않도록 
    request.setCharacterEncoding("utf-8");
    //1. 폼 전송되는 name 과 addr를 추출한다.
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    //MemberDto 객체에 회원 정보를 담고
    MemberDto dto = new MemberDto();
    dto.setName(name);
    dto.setAddr(addr);
    
    //2. DB에 저장한다.
    MemberDao dao = MemberDao.getInstance(); //외부에서 객체생성하지 못하도록 막아놓았기 때문에 new하지 못함
    //MemberDao 객체를 이용해서 DB에 저장을 하고 성공여부를 리턴 받는다.
    boolean isSuccess = dao.insert(dto);
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
   				<strong><%=name %></strong> 의 정보를 추가 했습니다.
   				<a class="alert-link" href="list.jsp">확인</a>
   			</p>
      		
   		<%}else {%>
   			<p class="alert alert-danger">
   				회원 정보 추가실패
   				<a class="alert-link" href="insertform.jsp">다시 입력</a>
   			</p>
   		<%} %>
   </div>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>