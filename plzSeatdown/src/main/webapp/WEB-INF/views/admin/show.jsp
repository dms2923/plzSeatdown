<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 게시판</title>
    <style>
        #logoutBtn{
            color : white; 
            background-color: #7460ee;
        }
        #searchBtn{
            background-color: #917EC6;
        }
        #searchTitle {
			width: 110px;
			display: inline-block;
		}
		
		#searchInput {
			width: 25%;
			display: inline-block;
		}
		
		#searchBtn {
			width: 100px;
			background-color: #917EC6;
			border: #917EC6;
			display: inline-block;
		}
        .card img{
        	width: 100%;
        	max-height: 100%;
        }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">

        <!-- header -->
        <jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

        <!-- nav -->
        <jsp:include page="/WEB-INF/views/admin/common/nav.jsp"/>


        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h3 class="page-title mt-3 ml-3 mb-3">공연 관리</h3>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row mb-4">    
                    <div class="col-md-12 text-right">
                        <button type="button" class="btn btn-default" id="tmp2" onclick="location.href='${contextPath}/API/showAPI'">
                            	공연 추가(API 임시)
                        </button>
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
                    				<div class="col-md-2">
	                    				<div class="card">
		                                    <img class="card-img-top" src="${show.posterPath }" style=" height:320px;" />
		                                    <div class="card-block mt-3 ml-3 mr-3">
		                                        <h5 class="card-title">
		                                           	${show.showTitle }
		                                        </h5>
		                                        <!-- <p class="text-right">
		                                            <a class="btn btn-primary" href="#">수정</a> 
		                                            <a class="btn btn-secondary" href="#">삭제</a>
		                                        </p> -->
		                                    </div>
	                                	</div>
	                    			</div>
                    			</c:forEach>
                    		</div>
                    	</c:if>
                    	
                    </div>
                </div>
                
                
                <!---------------------------------- 페이징 바 ---------------------------------->
				<div style="col-md-12 d-flex justify-content-center">
					<ul class="pagination pagination-info" style="justify-content: center;">
						<c:if test="${pInf.currentPage > 1}">
							<li class="page-item">
								<!-- 맨 처음으로(<<) --> <!-- 
                                   c:url 태그에 var 속성이 존재하지 않으면
                                  	 변수처럼 사용되는 것이 아닌, 작성된 자리에 바로 URL 형식으로 표기됨
                               --> <a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchShow }">
                                           <c:param name="searchShow" value="${param.searchShow}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="1"/>
                                   </c:url>
                               ">
									&lt;&lt; </a>
							</li>

							<li class="page-item">
								<!-- 이전으로(<) --> <a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchShow }">
                                           <c:param name="searchShow" value="${param.searchShow}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.currentPage-1}"/>
                                   </c:url>
                               ">
									&lt; </a>
							</li>
						</c:if>

						<!-- 10개의 페이지 목록 -->
						<c:forEach var="p" begin="${pInf.startPage}"
							end="${pInf.endPage}">


							<c:if test="${p == pInf.currentPage}">
								<li class="active page-item"><a class="page-link">${p}</a></li>
							</c:if>

							<c:if test="${p != pInf.currentPage}">
								<li class="page-item"><a class="page-link"
									href=" 
                                       <c:url value="list">
                                           <c:if test="${!empty param.searchShow }">
                                           	<c:param name="searchShow" value="${param.searchShow}"/>
                                      		</c:if>
                                           <c:param name="currentPage" value="${p}"/>
                                       </c:url>
                                   ">
										${p} </a></li>
							</c:if>

						</c:forEach>

						<!-- 다음 페이지로(>) -->
						<c:if test="${pInf.currentPage < pInf.maxPage }">
							<li class="page-item"><a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchShow }">
                                           <c:param name="searchShow" value="${param.searchShow}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.currentPage+1}"/>
                                   </c:url>
                               ">
									&gt; </a></li>

							<!-- 맨 끝으로(>>) -->
							<li class="page-item"><a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchShow }">
                                           <c:param name="searchShow" value="${param.searchShow}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.maxPage}"/>
                                   </c:url>
                               ">
									&gt;&gt; </a></li>

						</c:if>
					</ul>
				</div>
                
                <!-- 검색창 -->
                <div class="row" style="justify-content: center;">
                	<form>
	                	<div class="input-group">
	                        <input type="text" class="form-control" id="searchInput" name="searchShow" placeholder="공연명을 입력하세요">
	                        <button id="searchBtn" class="btn btn-default" type="button">검색</button>
	                    </div>
                	</form>
                </div>
                
                <!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
                <script>
                	$(function(){
                		var searchShow = "${param.searchShow}";
                		
                		if(searchShow != "null"){
                			$("input[name=searchShow]").val(searchShow);
                		}
                	});
                </script>
                
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->

            <!-- footer -->
            <%-- <jsp:include page="/WEB-INF/views/admin/common/nav.jsp"/> --%>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
</body>

</html>