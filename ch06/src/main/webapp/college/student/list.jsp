<%@page import="college.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.CustomerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<StudentVO> students  = new ArrayList<>();

	try{
	//1단계 - JNDI 서비스 객체 생성 
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/college");
		Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
	//4단계 - SQL실행
		ResultSet rs = stmt.executeQuery("select * from `customer`");
	//5단계 - 결과처리
	
		while(rs.next()){
			StudentVO vo = new StudentVO();
			vo.setStdNo(rs.getString(1));
			vo.setStdName(rs.getString(2));
			vo.setStdName(rs.getString(3));
			vo.setStdYear(rs.getString(4));
			vo.setStdAddress(rs.getString(5));
			students.add(vo);
		}
		//6단계 - 커넥션 반납
		}catch(Exception e){
			e.printStackTrace();
			
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College-Student::List</title>
<script>
	
	window.onload = function(){
		const del = document.querySelectorAll('.del');
		//리스트에 '삭제' 링크가 여러개이기 때문에 문서객체 리스트를 순회하면서 이벤트 처리
		// 고전 문서객체 선택함수(getElement~)는 forEach 지원 안함
		del.forEach(function(item){
			item.onclick = function(e){
				const result = confirm('정말 삭제 하시겠습니까?');
				
				if(!result) e.preventDefault();
				
			}
		});
		
	}
</script>
</head>
<body>
	<h3>Customer List</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/college/student/register.jsp">등록</a>
	
	
	<table border="1">
		<tr>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>휴대폰</th>
			<th>입학년도</th>
			<th>학생주소</th>
			<th>관리</th>
		</tr>
		
		<%
			for(StudentVO vo : students){
		%>
		<tr>
			<td><%=vo.getStdNo() %></td>
			<td><%=vo.getStdName() %></td>
			<td><%=vo.getStdHp() %></td>
			<td><%=vo.getStdYear() %></td>
			<td><%=vo.getStdAddress() %></td>
			<td>
				<a href="/ch06/college/student/modify.jsp?uid=<%=vo.getStdNo()%>">수정</a>
					<a href="/ch06/college/student/delete.jsp?uid=<%=vo.getStdNo()%>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>