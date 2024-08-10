<%@page import="bank.Bank_AccountVO"%>
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
	List<Bank_AccountVO> accounts  = new ArrayList<>();

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
		ResultSet rs = stmt.executeQuery("select * from `bank_account`");
	//5단계 - 결과처리
	
		while(rs.next()){
			Bank_AccountVO vo = new Bank_AccountVO();
			vo.setA_no(rs.getString(1));
			vo.setA_item_dist(rs.getString(2));
			vo.setA_item_name(rs.getString(3));
			vo.setA_c_no(rs.getString(4));
			vo.setA_balance(rs.getInt(5));
			vo.setA_open_date(rs.getString(6));
			accounts.add(vo);
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
			<th>계좌번호</th>
			<th>계좌분휴</th>
			<th>계좌종류</th>
			<th>주민번호(사업자)</th>
			<th>계좌잔액</th>
			<th>계좌개설일</th>
			<th>관리</th>
		</tr>
		
		<%
			for(Bank_AccountVO vo : accounts){
		%>
		<tr>
			<td><%=vo.getA_no() %></td>
			<td><%=vo.getA_item_dist() %></td>
			<td><%=vo.getA_item_name() %></td>
			<td><%=vo.getA_c_no() %></td>
			<td><%=vo.getA_balance() %></td>
			<td><%=vo.getA_open_date() %></td>
			<td>
				<a href="/ch06/bank/account/modify.jsp?uid=<%=vo.getA_no() %>">수정</a>
					<a href="/ch06/bank/account/delete.jsp?uid=<%=vo.getA_no() %>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>