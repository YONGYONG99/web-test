
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. get 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. DB에서 수정할 회원의 정보를 얻어온다.
	TodoDto dto = TodoDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 form에 출력해서 응답한다.
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
	<div class="container">
		<h1>수정 폼</h1>
		<form action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="num">번호</label>
				<div class="col-sm-10">
				<input type="text" id="num" value="<%=dto.getNum()%>" readonly class="form-control-plaintext"/>
				</div>
			</div>
			<div class="mb-3">
				<label class="col-sm-2 col-form-label" for="content">할일</label>
				<div class="col-sm-10">
				<input class="form-control" type="text" name="content" id="content" placeholder="수정 내용입력" value="<%=dto.getContent()%>" />
				</div>
			</div>
			<div lass="mb-3">
				<label class="form-label" for="regdate">마감일</label>
				<input class="form-control" type="date" name="regdate" id="regdate" value="<%=dto.getRegdate()%>" />
			</div>
			<button class="btn btn-outline-primary btn-sm" type="submit">수정확인</button>
			<button class="btn btn-outline-danger btn-sm" type="reset">취소</button>
		</form>
	</div>
</body>
</html>