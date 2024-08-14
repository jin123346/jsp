<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user2::list</title>
	<script>
		
		window.onload=function(){
			
		const table = document.getElementsByTagName('table')[0];	
		
		//사용자 데이터 요청
		fetch('./proc/getUsers.jsp')
			.then(response => response.json())
			.then(data => {
				console.log(data);
				for(const user2 of data){
					console.log(user2.uid);
					const row = `<tr>
								   <td>\${user2.uid}</td>
								   <td>\${user2.name}</td>
								   <td>\${user2.birth}</td>
								   <td>\${user2.addr}</td>
								   <td>
								        <a href='#' class='modify'>수정</a>
								        <a href='#' class='delete'>삭제</a>
								   </td>
								</tr>`;
					table.insertAdjacentHTML('beforeend',row);
				}
			})
			.catch(err => {
				console.log(err);
			})//fetch end
			
		document.body.addEventListener('click',function(e){
			
			//삭제 이벤트
			if(e.target.classList.contains('delete')){
				e.preventDefault();
				
				const tr = e.target.closest('tr');
				const uid=tr.children[0].innerText;
				
				async function deleteProc(){
					try{
						const response = await fetch('./proc/deleteProc.jsp?uid='+uid);
						
						const data = await response.json();
						console.log(data);
						
						if(data.result>0){
							alert('삭제 완료!');
							tr.remove();
							location.href='./list.jsp';
						}else{
							alert('삭제 실패');
							location.href='./list.jsp';
						}
					}catch (err) {
						console.log(err);
					}
					
					
				}//deletProc end
				
				deleteProc();
				
			}
			
			
			//수정 이벤트
			if(e.target.classList.contains('modify')){
				e.preventDefault();
				const tr = e.target.closest('tr');  
				const uid=tr.children[0].innerText;
				
				location.href='./modify.jsp?uid='+uid;
			}
			
			
		});//body click end
			
		
		
		
			
		}//onload end
	</script>
</head>
<body>
	<h3>user2</h3>
	<a href="./register.jsp">등록하기</a>
	<table border="1" >
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생연월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
	</table>
</body>
</html>