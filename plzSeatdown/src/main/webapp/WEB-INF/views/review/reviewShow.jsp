<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/review_show.css" />
	
	</head>
	<body class="homepage is-preload">
	
		<div class="overlay"></div>
			
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
		
		<div id="page-wrapper" class="wrapper">
			
			<!-- sidebar -->
			<div id="wrap">
				<div class="sidebar">
					<div class="showInfo" id="showInfo">
						<div class="poster">
							<img id="showPoster" src="">
						</div>
						<div class="showContent pl-3 pr-10">
							<div id="cont">
								<div id="showTitle" class="text-center"></div>
								<div id="showDate" class="text-center"><span id="startDt"></span> ~ <span id="endDt"></span></div>
								<div id="theaterNm" class="text-center"></div>
							</div>
							<div class="move text-center">
								<button class="btn btn-default seatPage" type="button" >
									좌석 리뷰 페이지로 이동
								</button>
							</div>
						</div>
					</div>
					<div class="introImg">
						<div class="img1">
							<img id="img1" src="">
						</div>
						<div class="img2">
							<img id="img2" src="">
						</div>
						<div class="img3">
							<img id="img3" src="">
						</div>
						<div class="img4">
							<img id="img4" src="">
						</div>
					</div>
				</div>
				
			</div>
			

			<div class="container container-fluid my-5">
			
				<div class="row">
				
					<jsp:include page="/WEB-INF/views/review/reviewSideMenu.jsp"/>	
					
					<div class="col-md-10">
					
						<div class="row mb-5">
							<div class="col-md-6">
								<div class="status">
									<a id="all" class="activeShow" href="<c:url value="show"/>">전체</a>&nbsp;|&nbsp;
									<a id="end" href="<c:url value="show"><c:param name="showStatus" value="공연완료"/></c:url>">공연완료</a>&nbsp;|&nbsp;
									<a id="now" href="<c:url value="show"><c:param name="showStatus" value="공연중"/></c:url>">공연중</a>&nbsp;|&nbsp;
									<a id="due" href="<c:url value="show"><c:param name="showStatus" value="공연예정"/></c:url>">공연예정</a>
								</div>
							</div>
			                <div class="col-md-6 text-right">
		                    	<form>
									<div class="input-group">
										<input type="text" class="form-control" name="searchShow" placeholder="공연명을 입력하세요">
										<c:if test="${!empty param.showStatus }">
											<input type="hidden" name="showStatus" value="${param.showStatus}"/>
										</c:if>
										<span class="input-group-btn">
											<button class="btn btn-default" style="background-color: #917EC6; color: white;"><i class="fas fa-search"></i></button>
										</span>
									</div>
		                		</form>
			            	</div>
		                </div>
		                
		                <div class="row">
							<div class="col-md-12">
							
								<c:if test="${empty list }">
		                    		<div class="row" style="justify-content: center;">
		                    			<h5>등록된 공연이 없습니다.</h5>
		                    		</div>
		                    	</c:if>
		                    	
		                    	<c:if test="${!empty list }">
		                    		<div class="row">
		                    			<c:forEach var="show" items="${list}" varStatus="vs">
			                    			<div class="col-md-3 mt-3 show" id="${show.showCode}">
												<img src="${show.posterPath}" style="width: 180px; height: 250px;">
												<h6 class="mt-2">${show.showTitle}</h6>
											</div>
		                    			</c:forEach>
		                    		</div>
		                    	</c:if>
		                    	
							</div>
						</div>
						
						
						<!-- 페이징바 -->
			            <div class="row d-flex justify-content-center mt-5">
			                <ul class="pagination pagination-info">
			                	<c:if test="${pInf.currentPage > 1}">
				                	<li class="page-item">
						                    <a class="page-link" 
						                    	href=" 
						                    	<c:url value="show">
						                    		<c:if test="${param.showStatus }">
										        		<c:param name="showStatus" value="${param.showStatus}"/>
										        	</c:if>
										        	
										        	<c:if test="${!empty param.searchShow }">
										        		<c:param name="searchShow" value="${param.searchShow}"/>
										        	</c:if>
						                    		<c:param name="currentPage" value="1"/>
						                    	</c:url>
					                    	">
							                    &lt;&lt;
							                </a>
						            </li>
				                    <li class="page-item">
				                    	<!-- 이전으로 -->
				                    	<a class="page-link" href=" 
					                    	<c:url value="show">
					                    		<c:if test="${param.showStatus }">
									        		<c:param name="showStatus" value="${param.showStatus}"/>
									        	</c:if>
									        	
									        	<c:if test="${!empty param.searchShow }">
									        		<c:param name="searchShow" value="${param.searchShow}"/>
									        	</c:if>
					                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
					                    	</c:url>
				                    	">PREV</a>
				                    </li>
			                    </c:if>
			                    
			                    <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
			                    
			                    	<c:if test="${p == pInf.currentPage}">
			                    		<li class="active page-item">
			                    			<a class="page-link">${p}</a>
			                    		</li>
			                    	</c:if>
			                    	
			                    	<c:if test="${p != pInf.currentPage}">
			                    		<li class="page-item">
			                    			<a class="page-link"
			                    				href="
			                    				<c:url value="show">
			                    					<c:if test="${ param.showStatus }">
									        			<c:param name="showStatus" value="${param.showStatus}"/>
										        	</c:if>
										        	
										        	<c:if test="${!empty param.searchShow }">
										        		<c:param name="searchShow" value="${param.searchShow}"/>
										        	</c:if>
			                    					<c:param name="currentPage" value="${p}"/>
			                    				</c:url>
			                    				">${p}
			                    			</a>
			                    		</li>
			                    	</c:if>
				                    
			                    </c:forEach>
			                    
			                    <!-- 다음 -->
			                    <c:if test="${pInf.currentPage < pInf.maxPage}">
			                    	<li class="page-item">
			                    		<a class="page-link"
			                    			href="
			                    			<c:url value="show">
			                    				<c:if test="${ param.showStatus }">
									        		<c:param name="showStatus" value="${param.showStatus}"/>
									        	</c:if>
									        	
									        	<c:if test="${!empty param.searchShow }">
									        		<c:param name="searchShow" value="${param.searchShow}"/>
									        	</c:if>
					                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
			                    			</c:url>
			                    			">NEXT</a>
			                    	</li>
			                    	
			                    	<!-- 맨 끝으로(>>) -->
					                <li class="page-item">
					                    <a class="page-link" 
					                    	href=" 
					                    	<c:url value="show">
					                    		<c:if test="${ param.showStatus }">
									        		<c:param name="showStatus" value="${param.showStatus}"/>
									        	</c:if>
									        	
									        	<c:if test="${!empty param.searchShow }">
									        		<c:param name="searchShow" value="${param.searchShow}"/>
									        	</c:if>
					                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
					                    	</c:url>
				                    	">
						                    &gt;&gt;
						                </a>
					                </li>
			                    </c:if>
			                </ul>
			            </div>
						
		                
					</div>
				</div>
				
			</div>
			
			<!-- 사이드 메뉴 이름 변경 -->
			<script>
				$(function(){
					$("#sideMenu #clickedPage").attr("href","show").html("공연 검색");
				});
			</script>
			
			<!-- 선택된 공연 상태에 스타일 추가하는 script -->
			<script>
				$(function(){
					
					var showStatus = "${param.showStatus}";
					
					if(showStatus == ""){
						
						$("#all").addClass("activeShow");
						$("#end").removeClass("activeShow");
						$("#now").removeClass("activeShow");
						$("#due").removeClass("activeShow");
						
					}else if(showStatus == "공연중"){
						
						$("#all").removeClass("activeShow");
						$("#end").removeClass("activeShow");
						$("#now").addClass("activeShow");
						$("#due").removeClass("activeShow");
						
					}else if(showStatus == "공연완료"){
						
						$("#all").removeClass("activeShow");
						$("#end").addClass("activeShow");
						$("#now").removeClass("activeShow");
						$("#due").removeClass("activeShow");
						
					}else if(showStatus == "공연예정"){
						
						$("#all").removeClass("activeShow");
						$("#end").removeClass("activeShow");
						$("#now").removeClass("activeShow");
						$("#due").addClass("activeShow");
						
					}
				});
			</script>
			
		    <!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
			<script>
				$(function(){
					var searchShow = "${param.searchShow}";
					
					if(searchShow != "null"){
						$("input[name=searchShow]").val(searchShow);
					}
					
				});
			</script>


			<!-- 사이드바 -->
			<script>
				$(function(){
					
					$(".show").on({
						click : function(){
							showCode = $(this).prop("id");
							
							$("#showPoster").prop("src", "");
							$("#showTitle").html("");
							$("#startDt").html("");
							$("#endDt").html("");
							$("#theaterNm").html("");
							$("#img1").prop("src", "");
							$("#img2").prop("src", "");
							$("#img3").prop("src", "");
							$("#img4").prop("src", "");
							
							$.ajax({
								url : "selectShowDetail",
								type : "GET",
								data : {"selectShowCode" : showCode},
								success : function(show){
									$("#showPoster").prop("src", show.posterPath);
									$("#showTitle").html(show.showTitle);
									$("#startDt").html(show.startDt);
									$("#endDt").html(show.endDt);
									$("#theaterNm").html(show.theaterFullNm);
									$("#img1").prop("src", show.showImg1);
									$("#img2").prop("src", show.showImg2);
									$("#img3").prop("src", show.showImg3);
									$("#img4").prop("src", show.showImg4);
									
									$(".seatPage").on("click", function(){
										location.href="seats?thCode=" + show.thCode ;
									});
								}
							});
							
							$(".sidebar").addClass("active").scrollTop(0);
							$("body").addClass("scrollHidden").on("scroll touchmove mousewheel", function(e){
								e.preventDefault();
							}); // 스크롤 불가능
							$(".overlay").fadeIn();
						}
					});
					$(".overlay").on({
						click : function(){
							$(".sidebar").removeClass("active");
							$("body").removeClass("scrollHidden").off("scroll touchmove mousewheel");
							$(".overlay").fadeOut();
						}
					});
				});
			</script>

		</div>
		
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	</body>
</html>