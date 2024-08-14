<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//String uid= request.getParameter("uid");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax::user1</title>
	<script>
			<%-- const uid=<%=uid %>; --%>
			
			window.onload= function(){
				//주소 파라미터 파싱
				const params = location.href.split('?')[1];
				const value = params.split('=')[1];
				
				

				//문서 객체 생성
				const form = document.getElementsByTagName('form')[0];	
				const btnSubmit = form.submit;
				
				
				
				//수정하기 버튼 이벤트 
				btnSubmit.onclick =()=>{
					fetch('./proc/modifyProc.jsp',{
						method: 'POST',
						headers: {'Content-Type': 'application/json'},
						body: JSON.stringify(jsonData)
					})
						.then(response => response.json())
						.then(data => {
							console.log(data);
							
							if(data.result>0){
								alert('수정되었습니다.')
								location.href= './list.jsp';
							}else{
								alert('수정 실패')
							}
						})
				}
				
				
			
				//수정데이터 요청하기
				fetch('./proc/getUser.jsp?uid='+value)
					.then(response => response.json())
					.then(data =>{
						console.log(data);
						form.uid.value = data.uid;
						form.name.value=data.name;
						form.birth.value=data.birth;
						form.hp.value=data.hp;
						form.age.value=data.age;
					})
					.catch(err=>{
						console.log(err);
					});
				
				
					
				
				
			}//onload end
	</script>
</head>
<body>
	<h3>user1 수정하기</h3>
	<a href="./list.jsp">목록이동</a>
	<form action="./proc/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="" ></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value="" ></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value=""></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="submit" value="등록하기"/>
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>