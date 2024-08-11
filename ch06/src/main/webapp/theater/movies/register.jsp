<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register.jsp</title>
</head>
<body>

	<h3>User1 등록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/theater/movies/register.jsp">등록</a><br>
	
	
	<form action="/ch06//theater/movies/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>영화번호</td>
				<td><input type="number" name="movie_id"></td>
			</tr>
			<tr>
				<td>영화제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>영화장르</td>
				<td><input type="text" name="genre"></td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><input type="text" name="release_date"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기">
				</td>
			</tr>

		</table>	
	</form>
	
</body>
</html>