<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.FileUploadTest</title>
	<!--  
		날짜 : 2024/08/12
		이름 : 하진희
		내용 : 파일 업로드 실습하기
		
		--톰캣 context.xml > Context 태그에 allowCasualMultipartParsing="true" 설정
		--톰캣 server.xml > Connector 태그에 maxPostSize="10485760" 설정
	-->
</head>
<body>
	<h3>1. FileUpload</h3>
	
	<form action="/ch07/proc/fileUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" placeholder="아이디 입력"/><br>
		<input type="text" name="name" placeholder="이름 입력"/><br>
		<input type="file" name="fname" placeholder="파일 추가"/><br>
		<input type="submit" value="전송하기" />
	</form>



</body>
</html>