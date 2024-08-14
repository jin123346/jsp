<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String xml="<user>"
				+"<uid>a101</uid>"
				+"<name>홍길동</name>"
				+"<age>23</age>"
				+"<addr>부산</addr>"
				+"</user>";
				
	out.print(xml);
%>