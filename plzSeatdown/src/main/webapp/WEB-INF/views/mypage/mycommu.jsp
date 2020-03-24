<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_mycommu.css"/>

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mycommu">내 커뮤</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<li><a href="changePwd">비밀번호 변경</a></li>
								<li><a href="secession">회원 탈퇴</a></li>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="mycommu">내 커뮤</a></li>
								<li><a href="ask">문의 내역</a></li>
							</ul>
						</div>
						
						
						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<table  id="list-table" class="table" style="margin-left:20px;">
								<thead style="   padding : 0.5em; font-weight: bold; color:rgb(163, 99, 189); border-color: rgb(198, 180, 205); border-bottom: 0px;
								
								">
								  <tr>
								  	<th scope="col" style="border-bottom:0px;">글번호</th>
									<th scope="col" style="border-bottom:0px;">제목</th>
									<th scope="col" style="border-bottom:0px;">내용</th>
									<th scope="col" style="border-bottom:0px;">작성자</th>
									<th scope="col" style="border-bottom:0px;">날짜</th>
									<th scope="col" style="border-bottom:0px;"></th>
								  </tr>
								</thead>
								<tbody>
								<c:if test="${empty clist}">
										<tr>
											<td colspan="6">존재하는 커뮤니티 내역이 없습니다.</td>
										</tr>
								</c:if>
								<c:if test="${!empty clist}">
									<c:forEach var="community" items="${clist}" varStatus="vs">
										<tr>
											<td style="border-top:0px; padding-top:17px;">${community.communityNo}</td>
											<td style="border-top:0px; padding-top:17px;">${community.communityTitle}</td>
											<td class="contentwrap" style="border-top:0px;  height:40px; padding-top:17px;">${community.communityContent}</td>
											<td style="border-top:0px; padding-top:17px;">${community.communityWriter}</td>
											<td style="border-top:0px; padding-top:17px;">${community.communityCreateDate}</td>
											<td style="border-top:0px; padding-top:17px;">
											  <button id="moveBoard" class="btn btn-outline-secondary m-3">해당 글 이동</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							  </table>


							   <!-- 페이징바 -->
							  <div class="form-group col-9">
	         				   <ul class="pagination">
	            				<c:if test="${pInf.currentPage > 1}">
	                			<li>
	                				<!-- 맨 처음으로(<<) -->
	                    			<a class="page-link" href="
	                    			<c:url value="list"> 
	                    				<c:param name="currentPage" value="1"/>
	                    			</c:url>
	                    			">&lt;&lt;</a>
	                			</li>
	                
	                			<li>
	                				<!-- 이전으로(<) -->
                   					<a class="page-link" href="
                   					<c:url value="list">
                   					<c:param name="currentPage" value="${pInf.currentPage-1}"/>
                   					</c:url>
                   					">&lt;</a>
	                			</li>
	                			</c:if>
	                
	              			  <!-- 10개의 페이지 목록 -->
	               			 	 <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                				<c:if test="${p == pInf.currentPage}">
		              			  		<li>
		               			   	  		<a class="page-link">${p}</a>
		               					 </li>
	                				</c:if>
	                				<c:if test="${p != pInf.currentPage}">
                						<li>
	                    					<a class="page-link" href="
	                    					<c:url value="list">
	                    						<c:param name="currentPage" value="${p}"/>
	                    					</c:url>
	                    					">${p}</a>
	                					</li>
	                					</c:if>
	            			  	 </c:forEach>
	                			<!-- 다음 페이지로(>) -->
	                			<c:if test="${pInf.currentPage < pInf.maxPage }">
	                			<li>
	                			    <a class="page-link" href="
	                			    	<c:url value="list">
	                			    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
	                			    	</c:url>
	                			    ">&gt;</a>
	                			</li>
	                
	               			 <!-- 맨 끝으로(>>) -->
	              			  <li>
	                   			 <a class="page-link" href="
	                   			 	<c:url value="list">
	                   			 		<c:param name="currentPage" value="${pInf.maxPage}"/>
	                   			 	</c:url>
	                   			 ">&gt;&gt;</a>
	               			 </li>
	               			 </c:if>
	        			    </ul>
							  </div>
							  
						</div>

					</div>
				</div>
			</div>
			
			
			
		<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		$(function(){
			$("#moveBoard").click(function(){
				var communityNo = $(this).parent().children().eq(0).text();
				// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
				<c:url var="detailUrl" value="detail"> // 주소창의 detail
                 	<c:param name="currentPage" value="${pInf.currentPage}"/>
               	</c:url>
				location.href="${detailUrl}&no="+communityNo;
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			});
		});
		
		
		
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>