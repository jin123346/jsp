<%@page import="bank.Bank_CustomerVO"%>
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
	List<Bank_CustomerVO> customers  = new ArrayList<>();

	try{
	//1단계 - JNDI 서비스 객체 생성 
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/bank");
		Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
	//4단계 - SQL실행
		ResultSet rs = stmt.executeQuery("select * from `bank_customer`");
	//5단계 - 결과처리
	
		while(rs.next()){
			Bank_CustomerVO vo = new Bank_CustomerVO();
			vo.setC_no(rs.getString(1));
			vo.setC_name(rs.getString(2));
			vo.setC_dis(rs.getInt(3));
			vo.setC_addr(rs.getString(4));
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
<title>Customer::List</title>
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
	<a href="/ch06/bank/customer/register.jsp">등록</a>
	
	
	<table border="1">
		<tr>
			<th>주민번호</th>
			<th>고객명</th>
			<th>고객분류</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
		<%
			for(Bank_CustomerVO vo : customers){
		%>
		<tr>
			<td><%=vo.getC_no() %></td>
			<td><%=vo.getC_name() %></td>
			<td><%=vo.getC_dis() %></td>
			<td><%=vo.getC_phone() %></td>
			<td><%=vo.getC_addr() %></td>
			<td>
				<a href="/ch06/bank/customer/modify.jsp?uid=<%=vo.getC_no() %>">수정</a>
					<a href="/ch06/bank/customer/delete.jsp?uid=<%=vo.getC_no() %>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>