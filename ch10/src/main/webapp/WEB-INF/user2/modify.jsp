<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User2-수정</title>
</head>
<body>
	<a href="/ch10/">처음으로</a><br>
	<a href="/ch10/user2/register.do">등록</a>
	
	
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value=""></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value=""></td>
			</tr>

			<tr>	
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>

		</table>	
	</form>


</body>
</html>