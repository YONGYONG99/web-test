<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 해서 해당 회원의 정보를 삭제한다.
	boolean isSuccess = MemberDao.getInstance().delete(num);
	//3. 응답한다.
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
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>