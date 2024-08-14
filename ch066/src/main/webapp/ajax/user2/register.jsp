<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user2::register</title>
	<script>
		window.onload = function(){
			
			const btnSubmit = document.getElementsByName('submit')[0];
			const form = document.getElementsByTagName('form')[0];
			
			
			btnSubmit.onclick = (e) =>{
				e.preventDefault();
				
				const uid= form.uid.value;
				const name= form.name.value;
				const birth= form.birth.value;
				const addr =form.addr.value;
				
				jsonData = {
						"uid" : uid,
						"name" : name,
						"birth" : birth,
						"addr" : addr
				};//json end
				
				console.log(jsonData);
			
				async function registerProc(){
					try{

						const response = await fetch('./proc/registerProc.jsp',{
							method : 'POST',
							headers : {"Content-Type" : "application/json"},
							body: JSON.stringify(jsonData)
						});
						
						const data = await response.json();
						console.log(data);
						
						if(data.result > 0){
							alert('등록 완료!');
							location.href='./list.jsp';
						}else{
							alter('등록 실패!');
							location.href='./list.jsp';
						}
						
					}catch(err){
						console.log(err);
					}
				}
				
				registerProc();
				
				
				
			}//btnSubmit end
			
		}//onload end
	</script>
</head>
<body>
	<h3>user2 등록</h3>
	
	<a href="./list.jsp">목록이동</a>
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"/></td>
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