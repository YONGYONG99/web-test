<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 
  <!-- animation -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  
<style>
	form legend{
		font-size: 1rem;
	}
</style>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-6 offset-md-3 animate__animated animate__tada">
			<h1>테스트 폼 입니다.</h1>
		<form action="signup.jsp" method="post" class="shadow p-3 rounded">
		
			<div class="mb-3">
			  <label for="email" class="form-label">이메일</label>
			  <input type="email" class="form-control" name ="email" id="email" placeholder="name@example.com">
			</div>
			
			<div class="mb-3">
	  			<label for="comment" class="form-label">할말</label>
	  			<textarea class="form-control" name="comment" id="comment" rows="3"></textarea>
			</div>
			
			<div>
			<label for="job">직업</label>
			<select name="job" class="form-select" aria-label="Default select example">
	  			<option value="">선택</option>
	  			<option value="programmer">프로그래머</option>
	  			<option value="teacher">선생님</option>
	  			<option value="doctor">의사</option>
	  			<option value="etc">기타</option>
			</select>
			</div>
					
			<br />
			<div>
				<fieldset>
					<legend>관심사 체크</legend>
					<div class="form-check">
						<label>
							<input class="form-check-input" type="checkbox" name="concern" value="reading" />
							독서
						</label>
					</div>
					<div class="form-check">
						<label>
							<input class="form-check-input" type="checkbox" name="concern" value="game" />
							게임
						</label>
					</div>
					<div class="form-check">
						<label>
							<input class="form-check-input" type="checkbox" name="concern" value="cooking" />
							요리
						</label>
					</div>
				</fieldset>
			</div>
			<br />
			<div>
				<fieldset>
					<legend>성별 체크</legend>
					<div class="form-check">
					<label>
						<input class="form-check-input" type="radio" name="gender" value="man" checked />
						남자
					</label>
					</div>
					<div class="form-check">
					<label>
						<input class="form-check-input" type="radio" name="gender" value="women"  />
						여자
					</label>
					</div>
				</fieldset>
			</div>
			<br />
			<button class="btn btn-primary" id="submitBtn" type="submit" >전송</button>
		</form>	
		</div>
	</div>
</div>
<script>
	//특정 요소에 이벤트가 발생했을때 실행할 함수 등록
   document.querySelector("#submitBtn").addEventListener("mouseover", function(){
      //원하는 애니메이션 클래스를 추가해서 애니메이션을 동작 시킨다.
      this.classList.add("animate__animated");
      this.classList.add("animate__pulse");
   });
   //특정 요소에 애니메이션이 끝나는 이벤트가 발생했을때 실행할 함수 등록
   document.querySelector("#submitBtn").addEventListener("animationend", function(){
      //추가 했던 클래스를 제거해야지만 다음번에 클래스를 추가했을때 또 애니메이션이 동작한다.
      this.classList.remove("animate__animated");
      this.classList.remove("animate__pulse");
	});
</script>
</body>
</html>