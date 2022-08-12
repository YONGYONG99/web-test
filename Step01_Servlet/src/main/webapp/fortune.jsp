<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] list = {"비가 오지만 너무 좋은 날이에요!", "비가와서 슬퍼요", 
        "내일을 기약해요!", "오늘은 공부가 잘 되는 날!", "오늘은 공부가 잘 안 되는 날!"};
  	//0~4 사이의 랜덤한 정수를 얻어내기
  	int ranNum=new Random().nextInt(5);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<p class="alert alert-primary">오늘의 운세: <%=list[ranNum] %></p>
	<p class="alert alert-primary">오늘의 운세: <%out.print(list[ranNum]); %></p>
</body>
</html>