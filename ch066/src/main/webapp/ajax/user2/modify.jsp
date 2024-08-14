<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user2::modify</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		window.onload = function(){
			
			const params = location.href.split("?")[1];
			const value  = params.split("=")[1];
			
			
			const form = document.getElementsByTagName('form')[0];	
			const btnSubmit = form.submit;
			
			
			btnSubmit.onclick = (e)=>{
				e.preventDefault();
				
				const jsonData ={
						"uid" : form.uid.value,
						"name" : form.name.value,
						"birth" : form.birth.value,
						"addr" : form.addr.value
				};//jsondata end
				
				$.ajax({
					method: 'POST',
					url: './proc/modifyProc.jsp',
					data: jsonData,
					success: function(data){
						console.log(data);
						
						if(data.result > 0){
							alert('수정 되었습니다.');
							location.href = './user2/list.jsp';
						}else{
								location.href = './list.jsp';

						}
					}
				});//ajax end
				
			}//btn end
			
			fetch('./proc/getUser.jsp?uid='+value)
				.then(response=>response.json())
				.then(data=>{
					console.log(data);
					form.uid.value=data.uid;
					form.name.value=data.name;
					form.birth.value=data.birth;
					form.addr.value=data.addr;
				})
				.catch(err=>{
					console.log(err);
				})
			
			
			
		}//onload end
	</script>
</head>
<body>
	<h3>user2 수정하기</h3>
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
				<td>주소</td>
				<td><input type="text" name="addr" value=""></td>
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