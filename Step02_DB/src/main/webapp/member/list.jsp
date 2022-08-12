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
</head>
<body>

<div class="condtainer">
	<a href="insertform.jsp">회원추가</a>
	<h1>회원 목록입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>