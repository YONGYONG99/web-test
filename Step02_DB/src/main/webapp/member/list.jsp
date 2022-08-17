<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //MemberDao 객체의 참조값을 얻어와서
    MemberDao dao = MemberDao.getInstance();
    //회원목록을 얻어온다.
    List<MemberDto> list = dao.getList();
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

<%-- navbar.jsp 포합시키기 --%>
<jsp:include page="/include/navbar.jsp">
	<jsp.param value="member" name="thisPage"/>
</jsp:include>

<div class="container">
   
   <h5><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg>회원 목록입니다.</h5>
   <table class="table table-striped">
      <thead class="table-danger">
         <tr>
            <th>번호</th>
            <th>이름</th>
            <th>주소</th>
            <th>수정</th>
            <th>삭제</th>
         </tr>
      </thead>
      <tbody>
         <%for(MemberDto tmp:list){ %>
            <tr>
               <td><%=tmp.getNum() %></td>
               <td><%=tmp.getName() %></td>
               <td><%=tmp.getAddr() %></td>
               <td>
               		<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
               </td>
               <td>
               		<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
               </td>
            </tr>
         <%} %>
      </tbody>
      </table>
   		<a class="btn btn-info" href="/Step02_DB/member/insertform.jsp" role="button">회원추가</a>
   		<br/>
   		<br/>
   		<a href="${pageContext.request.contextPath }"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  		<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
		</svg>인덱스로</a>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>