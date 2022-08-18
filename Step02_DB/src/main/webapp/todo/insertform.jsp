<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>    
  
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
      <nav class="mt-2">
         <ol class="breadcrumb">
            <li class="breadcrumb-item">
               <a href="${pageContext.request.contextPath }/index.jsp">Home</a>
            </li>
            <li class="breadcrumb-item">
               <a href="${pageContext.request.contextPath }/member/list.jsp">할인목록</a>
            </li>
            <li class="breadcrumb-item active">할일 추가 페이지</li>
         </ol>
      </nav>
	<h3>할일 추가 페이지</h3>
		<form action="insert.jsp" method="post">
		<div class="form-floating mb-3">
			<input class="form-control" type="text"   name="content" id="content" placeholder="할 일 입력..." />
			<label class="form-label" for="content">할일</label>		
		</div>
		<div class="mb-3">
			<label class="form-label" for="regdate">해야할 날짜</label>
			<input class="form-control" type="date" name="regdate" id="regdate" />
		</div>
		<button class="btn btn-primary btn-sm" type="submit">등록</button>
		</form>
	</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>