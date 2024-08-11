<%@page import="theater.CustomersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<CustomersVO> customers  = new ArrayList<>();

	try{
	//1단계 - JNDI 서비스 객체 생성 
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/theater");
		Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
	//4단계 - SQL실행
		ResultSet rs = stmt.executeQuery("select * from `customers`");
	//5단계 - 결과처리
	
		while(rs.next()){
			CustomersVO vo = new CustomersVO();
			vo.setCustomer_id(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setEmail(rs.getString(3));
			vo.setPhone(rs.getString(4));
			customers.add(vo);
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
<title>Theater-customers::List</title>
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
	<h3>Customers List</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/theater/customers/register.jsp">등록</a>
	
	
	<table border="1">
		<tr>
			<th>고객번호</th>
			<th>고객명</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>관리</th>
		</tr>
		
		<%
			for(CustomersVO vo : customers){
		%>
		<tr>
			<td><%=vo.getCustomer_id() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getEmail() %></td>
			<td><%=vo.getPhone() %></td>
			<td>
				<a href="/ch06/theater/customers/modify.jsp?uid=<%=vo.getCustomer_id() %>">수정</a>
					<a href="/ch06/theater/customers/delete.jsp?uid=<%=vo.getCustomer_id() %>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>