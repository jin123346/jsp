<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글보기</title>
   <link rel="stylesheet" href="/jboard/css/style.css">  
   <script>
		window.onload = function(){
			
			const commentForm = document.commentForm;
	        const commentList= document.getElementsByClassName('commentList')[0];
	        const commentRemove = document.getElementsByClassName('commentRemove');
	        const commentModify = document.getElementsByClassName('commentModify');
	        const btndelete = document.querySelector('.btnDelete');
	        let originalText='';
	        
	        
	    	
	        
	        
	       
	        
	        //여기에 생성시 동적처리된 댓글은 삭제가 불가능해진다.
	       /*  for(const btnRemove of commentRemove){
	        	btnRemove.onclick = function(e){
	        		e.preventDefault();
	        		alert('`ares~!');
	        		
	        		fetch('/jboard/comment/delete.do')
	        		
	        	}
	        } */
	        
	        
	        //동적 이벤트 처리
	        document.addEventListener('click',function(e){
	        
	        	
	        	//삭제 
	        	 if (e.target.classList.contains('btnDelete')) {
			        const articleNo = e.target.dataset.articleNo;
			        console.log(articleNo);
			    }
	        	
	        	//수정완료
	        	if(e.target.classList == 'commentUpdate'){
					e.preventDefault();

	        		const article = e.target.closest('article');
					const textarea = article.querySelector('textarea');
				
					
					const no = e.target.dataset.no;
				
	        		const comment = textarea.value;
	        		const formData = new FormData();
	        		formData.append("comment",comment);
	        		formData.append("no",no);
	        		
	        		
	        		fetch('/jboard/comment/modify.do',{
	        			method:'POST',
	        			body: formData
	        		})
	        			.then(resp => resp.json())
	        			.then(data => {
	        				console.log(data);
	        				if(data.result > 0){
	        					alert('댓글이 수정되었습니다.');
	        					
	        					textarea.value=comment;
	        					
	    						textarea.readOnly = true;
	    						textarea.style.background='transparent';
	    						textarea.style.border = 'none';
	    						e.target.style.display='none';
	    						article.querySelector('.commentModify').innerText = '수정';
	    						
	        				}else{
	        					alert('댓글 수정에 실패했습니다.')
	        					textarea.value=originalText;
	        				}
	        				
	        			})
	        			.catch(err=>{})
	        	}
	        	
	        	
	        	
	        	//댓글 수정 $ 취소 
	        	if(e.target.classList == 'commentModify'){
					e.preventDefault();
					
					
					const article = e.target.closest('article');
					const textarea = article.querySelector('textarea');
					
					 const commentUpdate = article.querySelector('.commentUpdate');
					console.log(commentUpdate);
					
					const mode = e.target.innerText;
					
					console.log(textarea);
					
					if(mode=='수정'){
						originalText= textarea.value;
						textarea.readOnly = false;
						textarea.style.background='white';
						textarea.style.border = '1px solid black';
						textarea.focus();
						e.target.innerText='취소';
					 	commentUpdate.style.display = 'inline';
						
					}else{
						textarea.value = originalText;
						textarea.readOnly = true;
						textarea.style.background='transparent';
						textarea.style.border = 'none';
						e.target.innerText='수정';
						commentUpdate.style.display = 'none';
					}
					
					
					
					
					
					
					
					
					
	        	}
	        	
	        	
	        	
	        	//댓글 삭제 
	        	if(e.target.classList == 'commentRemove'){
					e.preventDefault();
				
						//삭제여부 확인 
						if(!confirm('정말 삭제하시겠습니까?')){
							return;
						}
						
						const article = e.target.closest('article');
						const no = e.target.dataset.no; // a태그 data-no 속성값 가져오기
						console.log(no);
		
						fetch('/jboard/comment/delete.do?no='+no)
							.then(resp => resp.json())
							.then(data => {
								console.log(data);
								
								if(data.result > 0){
									alert('댓글이 삭제되었습니다.');
									
									// 동적 삭제 처리
									article.remove();
									
								}else{
									alert('댓글이 삭제가 실패했습니다.');
								}
								
							})
							.catch(err => {
								console.log(err);
							});
						
		        	}
		        });
	        
	        
	        //댓글 등록 
			commentForm.onsubmit=function(e){
				e.preventDefault();
				
				const parent = commentForm.parent.value;
				const writer= commentForm.writer.value;
				const comment = commentForm.comment.value;
				
				/* const jsonData = {
						"parent" : parent,
						"wirter" : writer,
						"comment": comment
				}; 
				json데이터로 넘기면 parameter로 받을 수 없다. 
				해결방법 :  formdata로 넘기기*/
				
				//formdata생성
				const formData = new FormData();
				formData.append("parent",parent);
				formData.append("writer",writer);
				formData.append("comment",comment);
				console.log(parent);
				console.log(writer);
				console.log(comment);
				
				
				fetch('/jboard/comment/write.do',{
						method:'POST',
						body : formData
					})
					.then(resp => resp.json())
					.then(data => {
						console.log(data);
						if(data != null){
							alert('댓글이 등록되었습니다.')
							/*등록된 댓글을 동적처리함  */
							//등록된 댓글 동적 태그 생성

							const commentArticle = `<article class="comment">
								                        <span>
								                            <span>\${data.date}</span>
								                            <span>\${data.writer}</span>
								                        </span>
								                        <textarea name="comment" readonly>\${data.content}</textarea>
								                        <div>
									                        <a href="#" class="commentRemove" data-no="${comment.no }">삭제</a>
								                            <a href="#" class="commentModify" data-no="${comment.no }">수정</a>
								                            <a href="#" class="commentUpdate" data-no="${comment.no }" style="display:none;">수정완료</a>
								                        </div>
							                    </article>`;	
							commentList.insertAdjacentHTML('beforeend', commentArticle);
							
							commentForm.reset();
							
						}else{
							alert('댓글 등록이 실패했습니다.')
						}
						
						
					})
					.catch(err=>{
						console.log(err);
					})
				
				
				
			}
			
			
			
			
		}
	
	
	</script>
</head>
	
<body>
    <div id="container">
    	<%@ include file="./_header.jsp" %> 

        <main>
            <section class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="${article.title }" readonly/></td>
                    </tr>
                    
                    <c:if test="${article.file > 0 }">
	                   
	                  	   <tr>
		                        <td>첨부파일</td>
		                        <td>
		                         <c:forEach var="file" items="${article.files }">
		                        	<p style="margin-bottom:6px">
			                        	<a href="/jboard/article/filedownload.do?fno=${file.fno}">${file.oName }</a>
			                            <span>${file.download }회 다운로드</span>
		                        	</p>
		                       	 </c:forEach>
		                        </td>
		                    </tr>	
	                    
                    </c:if>
                   
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly>${article.contents }</textarea>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="#" class="btnDelete" data-articleNo="${article.no}">삭제</a>
                    <a href="#" class="btnModify" data-articleNo="${article.no }">수정</a>
                    <a href="/jboard/article/list.do?pg=${pg }" class="btnList">목록</a>
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    
                    	<c:forEach var="comment" items="${comments }">
                    		<article class="comment">
		                   		 <span>
		                            <span>${comment.nick }</span>
		                            <span>${comment.date }</span>
		                        </span>
		                        <textarea name="comment" readonly>${comment.content }</textarea>
	                        <c:if test="${sessUser.uid eq comment.writer}">
		                        <div>
									<!--thml 사용자 정의 속성을 이용한 삭제/수정-->	
		                            <a href="#" class="commentRemove" data-no="${comment.no }">삭제</a>
		                            <a href="#" class="commentModify" data-no="${comment.no }">수정</a>
		                            <a href="#" class="commentUpdate" data-no="${comment.no }" style="display:none;">수정완료</a>
		                        </div>
	                        </c:if>
                   			</article>
                    	</c:forEach>
                    
                    <c:if test="${empty comments}">
                    	<p class="empty">
                       	 등록된 댓글이 없습니다.
                    	</p>
                    </c:if>
                   
                </section>
    
                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form name="commentForm">
                        <textarea name="comment"></textarea>
                        <input type="hidden" name="parent" value="${article.no }"/>
                        <input type="hidden" name="writer" value="${sessUser.uid }"/><!--해당 세션의 유저 아이디가 댓글의 writer이다. -->
                        
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>
    
            </section>
        </main>
      <%@ include file="./_footer.jsp" %> 

    </div>
</body>
</html>