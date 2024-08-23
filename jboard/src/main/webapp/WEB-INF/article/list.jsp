<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글목록</title>
    <link rel="stylesheet" href="/jboard/css/style.css">   
</head>
<body>
    <div id="container">
    	<%@ include file="./_header.jsp" %> 
        <main>
            <section class="list">
                <h3>글목록</h3>
                <article>
                    <table border="0">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
                    <c:set var="index" value="${startIndex }"></c:set>
                    <c:forEach var="article" items="${articles }">
                    	  <tr>
                            <td>${index }</td>
                            <td><a href="/jboard/article/view.do?no=${article.no }&pg=${currentPage}">${article.title }</a>&nbsp;[${article.comment }]</td>
                            <td>${article.nick }</td>
                            <td>${article.rdate }</td>
                            <td>${article.hit }</td>
                        </tr>
                        <c:set var="index" value="${index-1 }"></c:set>
                    </c:forEach>
                      
                    </table>
                </article>

                <!-- 페이지 네비게이션 -->
                <div class="paging">
               	
               			
           			<c:if test="${pagegroup.start > 1 }">
           			<a href="/jboard/article/list.do?pg=${pagegroup.start -1}" class="prev">이전</a>
           			</c:if>
               			
                	<c:choose>
                		<c:when test="${pagegroup.end >= lastPageNum }">
                			<c:forEach var="i" begin="${pagegroup.start }" end="${lastPageNum }">
                				<a href="/jboard/article/list.do?pg=${i }" class="num ${i==currentPage? 'current':'off' }">${i }</a>
	                   		</c:forEach>
                		</c:when>
           
                		<c:when test="${pagegroup.end < lastPageNum }">
                			<c:forEach var="i" begin="${pagegroup.start }" end="${pagegroup.end }">
                    			<a href="/jboard/article/list.do?pg=${i }" class="num ${i==currentPage? 'current':'off' }">${i }</a>           
	                   		</c:forEach>
                		</c:when>
                	</c:choose>
         
                     <c:if test="${pagegroup.end+1 < lastPageNum}">
	               		<a href="/jboard/article/list.do?pg=${pagegroup.end +1}" class="next">다음</a>
	                </c:if>
                </div>

                <!-- 글쓰기 버튼 -->
                <a href="/jboard/article/write.do" class="btnWrite">글쓰기</a>
            </section>
        </main>
      <%@ include file="./_footer.jsp" %> 
    </div>
</body>
</html>