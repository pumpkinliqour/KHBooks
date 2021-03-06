<%@page import="java.net.CookieStore"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.book.model.vo.Book, com.kh.search.model.vo.GenreCount, java.util.*" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	List<Book> books = (List<Book>)request.getAttribute("bookList"); 
	List<Book> recents = (List<Book>)request.getAttribute("recentList");
	String pageBar = (String)request.getAttribute("pageBar");
	int cPage = (int)request.getAttribute("cPage"); 
	String order = (String)request.getAttribute("order");
	String category =(String)request.getAttribute("category");
	
	System.out.println(books);
%>
<script>
        $(function () {
            var currentPosition = parseInt($("#cart").css("top"));
            //$('#cart').css('height', $(window).height()-100);
            $(window).scroll(function () {
                var width = $(window).width();
                if (width >= 992) {
                    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
                    
                    $("#cart").stop().animate({
                        "top": position + currentPosition + "px"
                    }, 500);
                }
            });
        });
    </script>
</head>

<body>
    <section>
        <div class="container">
        
        	<!-- 좌측 카테고리 -->
            <div id='category' class="col-xs-12 col-md-3">
            
            	<h3 class="category_title">카테고리</h3>
                <ul class="list-group">
              <%//전체 카테고리
                for(String g: genres){
                	if(g.equals(category)){
                %>
                	<li class="list-group-item disabled"><%=g %></li>    
                	<%}else{ %>
            		<li class="list-group-item "><a href="<%=request.getContextPath()%>/search/category?category=<%=g%> "><%=g %></a></li>    
          				<%}
                	}%> 
                </ul>
                    
            </div>
            <!-- 중앙 검색 결과 -->
            <div id='search' class="col-xs-12 col-md-8">
     			                
                <!-- 책 검색 결과 -->
                <div id="book" class="col-xs-12 col-md-12">
                    <h3>책 검색</h3>
                    <!-- 검색 결과가 있을 경우 -->
                    <%if(!books.isEmpty()) {%>
                    <div id='order' class="row">
                        <ul class="order-buttons list-inline col-xs-12 col-md-12">
                            <!-- 정렬 버튼 -->
                            <%
                            String [] orderTitle ={"검색 결과순", "인기순", "최신순", "평점순", "리뷰 많은순", "낮은 가격 순"}; 
                            String [] orderValue ={"popularity", "recent", "grade", "review", "price"};  
                            for(int i=0;i<orderTitle.length;i++){
                            	if(order != null && i!=0 && order.equals(orderValue[i-1])){%>
                            		<li><span><strong><%=orderTitle[i] %></strong></span></li>	
                            <%	}else if(order.equals("default") && i==0){
                            %>	
                            	<li><span><strong><%=orderTitle[0] %></strong></span></li>	
                            <%	}else{
                            %>
                            <li><a href="<%=request.getContextPath()%>/search/category?category=<%=category %>&cPage=1<%=i==0?"":"&order="+orderValue[i-1]%>"><%=orderTitle[i] %></a></li>
                            <%}
                            } %>
                        </ul>
                    </div>
                    <div>
                    	<%for(Book b : books){%>
                    	<div class='book-result row'>
                    		<!-- 책 이미지 -->
                            <div class='result-image col-xs-4 col-sm-3 col-md-3 col-lg-3'>
                                <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail">
                                    <img src="<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>"
                                        alt="책 이미지">
                                </a>
                            </div>
                            <div class='result-image col-xs-8 col-sm-9 col-md-9 col-lg-9'>
                            	<!-- 책 정보 -->
                                <h4 class='book_info'>
                                    <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
                                        <span><strong><%=b.getBookName() %></strong></span>
                                    </a>
                                </h4>
                                <p class="book_info">
                                	<span class="book_info"><a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>"><%=b.getGrade() %> 점</a>|</span>
                                	<span class="book_info"><a href="<%=request.getContextPath()%>/author/authorInfo?author=<%=b.getAuthor().getauthorNum()%>"><%=b.getAuthor().getAuthorName() %></a>|</span>
                                	<span class="book_info"><a href="#"><%=b.getPublisher() %></a></span>
                                </p>
                            	<!-- 책 줄거리 -->
                            	<p class="book_info book_content">
                            		<a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>">
                            		<%
                            			/* 줄거리 내용이 너무 길 경우 자르고 ... 을 추가함 */
                            			String content = b.getBookInfo();
                            			if(content == null){
                            				content = "책 소개가 없습니다.";
                            			}
                            			if(content != null && content.length() > 188){
                            				content = content.substring(0, 188)+"...";
                            			}
                            		%>
                            		
                            		<%=content %></a>
                            	</p>
                            	<!-- 책 가격 -->
	                            <p class="book_info book_price" >가격</p> <p class="book_info book_price" id="book_price"><strong><%=b.getPrice() %>원</strong></p>
                            </div>
                        </div>
                    
                    		
                   		<%}%>
		                <!--페이지네이션-->
		                <div class="paging col-xs-12" style="text-align: center">
		                    <ul class="pagination pagination-lg">
		                        <%=pageBar %>
		                    </ul>
		
		                </div>
                    </div>
                    <%}else{%>
                    	<h3 id="empty"><%=category %> 카테고리에 책이 없습니다.</h3>
                    <%} %>
                </div>
            </div>

			
			<!-- 최근 본 목록 -->
            <div id='cart' class="col-xs-12 col-md-1">

			<%if(!recents.isEmpty()){ %>

                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <p class="text-center">최근 본 목록</p>
                    </div>
                </div>
                <div class='row cart-row'>
                	<div class="col-xs-1 col-md-0"></div>
				<%for(Book b: recents){ %>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="<%=request.getContextPath() %>/inforconpare_hwang/infoView?bookId=<%=b.getBookId()%>" class="thumbnail">
                            <img src="<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>" alt="도서 이미지">
                        </a> 
                    </div>
				<%}%>
                </div>
				<%}%>
                
            </div>

        </div>
    </section>

<%@include file="/views/common/footer.jsp"%>