<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글이 깨지지 않도록
request.setCharacterEncoding("utf-8");
	/*
		폼 전송되는 모든 내용을 추출해서 아래에 정보를 출력한다.
	*/

	//입력한 email
	String email = request.getParameter("email");
	String comment = request.getParameter("comment");
	String job = request.getParameter("job");
    String[] concern = request.getParameterValues("concern");
    //만일 concern 이 null 이라면
    if(concern==null){
    	concern=new String[0]; //빈 배열의 참조값을 넣어준다.
    }
    String gender = request.getParameter("gender");
    
    //String[]을 List<String> 으로 변환하기
    //변환하면 .contains() 메소드를 활용할수 있다.
    List<String> list = Arrays.asList(concern);
  	
    
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
		<h1>전송된 정보는 아래와 같습니다.</h1>
		
		<div class="mb-3">
		  <label for="email" class="form-label">이메일</label>
		  <input type="email" class="form-control" name ="email" id="email" value="<%=email%>">
		</div>
		
		<div class="mb-3">
  			<label for="comment" class="form-label">할말</label>
  			<textarea class="form-control" name="comment" id="comment" rows="3"><%=comment%></textarea>
		</div>
		<div>
		<label for="job">직업</label>
		<select name="job" class="form-select" aria-label="Default select example">
		         <option value="">선택</option>
		         <option value="programmer"<%=job.equals("programmer")?"selected":""%>>프로그래머</option>
		         <option value="teacher"<%=job.equals("teacher")?"selected":""%>>선생님</option>
		         <option value="doctor"<%=job.equals("doctor")?"selected":""%>>의사</option>
		         <option value="etc"<%=job.equals("etc")?"selected":""%>>기타</option>
		</select>
		</div>
	<br />
		<div>
			<fieldset>
				<legend>관심사 체크</legend>
				<label>
					<input type="checkbox" name="concern" value="reading" <%=list.contains("reading")?"checked":"" %>  />
					독서
				</label>
				<label>
					<input type="checkbox" name="concern" value="game" <%=list.contains("game")?"checked":"" %> />
					게임
				</label>
				<label>
					<input type="checkbox" name="concern" value="cooking" <%=list.contains("cooking")?"checked":"" %>/>
					요리
				</label>
			</fieldset>
		</div>
		<div>
			<fieldset>
				<legend>성별 체크</legend>
				<label>
					<input type="radio" name="gender" value="man" <%=gender.equals("man")?"checked":"" %>/>
					남자
				</label>
				<label>
					<input type="radio" name="gender" value="woman" <%=gender.equals("woman")?"checked":"" %>/>
					여자
				</label>
			</fieldset>
		</div>
</div>
</body>
</html>