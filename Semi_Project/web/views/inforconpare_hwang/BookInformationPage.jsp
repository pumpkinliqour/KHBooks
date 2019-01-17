<%@ page language='java' contentType='text/html; charset=UTF-8'
import='java.util.*, com.kh.book.model.vo.Book, com.kh.review.model.vo.Review, com.kh.member.model.vo.Member,
com.kh.author.model.vo.Author'
	pageEncoding='UTF-8'%>
	
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%
	Book b=(Book)request.getAttribute("book");
	Author a=(Author)request.getAttribute("author");
	List<Review> list=(List<Review>)request.getAttribute("reviewList");
	int reviewsize=(int)request.getAttribute("reviewsize");
	
%>
<%@ include file='/views/common/header.jsp'%>


<style>
div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
div#pageBar span.cPage{color: #0066ff;}
html, body
{
	width:100%; height:100%;
}

body {
/* 	margin-top:40px; */
	background-color: silver;
}

.container {
	border: 1px solid darkgray;
	background-color: white;
}

.booktitle {
	font-size: 20px;
	font-family: '돋움체 보통';
	font-weight: bold;
	color: black;
	position: relative;
	margin-top: 30px;
}

.booktitle small {
	font-family: 'Courier New', Courier, monospace;
	font-weight: bold;
	color: rgb(59, 56, 56);
}

.writer {
	font-size: 12px;
}

.cover {
	margin-top: 35px;
}

.bookcover {
	size: 100px;
	width: 175px;
	height: 250px;
}

.sell_price strong {
	font-size: 25px;
	color: red;
}

.nom_point strong {
	font-size: 18px;
	color: red;
}

li {
	list-style: none;
}

.priceinfor {
	font-size: 12px;
}

.listprice {
	padding: 0;
}

.bookpicture {
	width: 175px;
	height: 250px;
}

.all {
	margin-left: 40px;
}

.pluslate {
	position: relative;
	top: 10px;
	width: 175px;
}

.pluslate .plus {
	margin-left: 25px;
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
	text-align: center;
}

.pluslate .late {
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
}

.choiceTab {
	position: relative;
	left: 215px;
	color: white;
	text-shadow: 0;
	font-size: 20px;
}

.jangba {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}

.buy {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}

.date {
	position: relative;
	top: 5px;
}

.lating {
	position: relative;
	top: 10px;
}

.lating .starlating {
	color: red;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewCount {
	color: black;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewWrite {
	color: black;
	border: 0;
	padding: 0;
	background-color: white;
}

.priceinfor {
	position: relative;
	top: -8px;
}

.wrline {
	display: inline-block;
	white-space: inherit;
}

.wrline1 {
	display: inline-block;
	white-space: inherit;
}

.biline {
	display: inline-block;
	white-space: inherit;
}

.bsline {
	display: inline-block;
	white-space: inherit;
}

.snline {
	display: inline-block;
	white-space: inherit;
}

.reviewpre {
	display: inline-block;
	width: 1030px;
	border: 1px solid gray;
	white-space: inherit;
}

.writereview {
	float: right;
}

.allreview {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	font-size: 5px;
}

.reviewWrite {
	margin-right:50px;
	float:right;
	-moz-box-shadow:inset 0px 0px 10px 1px #dcecfb;
	-webkit-box-shadow:inset 0px 0px 10px 1px #dcecfb;
	box-shadow:inset 0px 0px 10px 1px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #458dd6), color-stop(1, #3b84cc) );
	background:-moz-linear-gradient( center top, #458dd6 5%, #3b84cc 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#458dd6', endColorstr='#3b84cc');
	background-color:#458dd6;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0px;
	border:1px solid #ffffff;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:11px;
	font-weight:bold;
	font-style:normal;
	height:23px;
	line-height:23px;
	width:51px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 0px 0px #528ecc;
}
.reviewWrite:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3b84cc), color-stop(1, #458dd6) );
	background:-moz-linear-gradient( center top, #3b84cc 5%, #458dd6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3b84cc', endColorstr='#458dd6');
	background-color:#3b84cc;
}.reviewWrite:active {
	position:relative;
	top:1px;

.reviewtable {
	margin-bottom: 35px;
}

.sections {
	position: relative;
	margin-left: 10px;
}
</style>

<script language='javascript'>
function change1(obj) {
	obj.style.background = 'rgb(66, 66, 66)';
	obj.style.color = 'white';
}
function change2(obj) {
	obj.style.background = 'black';
	obj.style.color = 'white';
}
function showBigPic()
{
	window.open("<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>","이미지 크게보기","width=500,height=750,top=30,left=200");
}
</script>

<section>
	<div class='container'>
		<div class='row section'>
			<div class='sections'>
				<div class='bookpicture col-sm-4'>
					<!-- 대표이미지 -->
					<div class='cover'>
						<div class='bookcover'>
							<img src='<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>'
								width='175' height='250'
								onerror="javascript:noImage(this,'L','KOR');' alt="어린왕자'>
						</div>
						<div class='pluslate'>
							<button class='plus btn-link' onclick="showBigPic();"');">크게보기</button>
							<span>|</span>
							<button class='late btn-link' onclick="location.href='#'"">평점보기</button>
						</div>
					</div>
				</div>
				<div class='all col-sm-4'>
					<div class='alltitle'>
						<!--책제목,작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
						<h1 class='booktitle'>
							<!-- 책 제목 -->
							<strong><%=b.getBookName() %>
							</strong>
						</h1>
						<div class='writer'>
							<!-- 작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
							<span class='name'> <!-- 작가이름, 관심작가등록 --> <span
								class='popup_load'> <a href='#'><%=b.getAuthor().getAuthorName() %></a>
									<div class='tooltip' style='display: none;'>
										<a href='#'>작가상세정보</a> <span class='line'>|</span>
										<!-- 라인 -->
										<a href='#'>관심작가등록</a> <span class='arrow'></span>
									</div>
							</span>
							</span> 지음 <span class='line'>|</span>
							<!-- 라인 -->
							<%if(b.getEditor()!=null) {%>
							<span class='name'><%=b.getEditor() %></span>
							<!-- 옮긴이 -->
							옮김 <span class='line'>|</span>
							<%} else{%>
							옮긴이 없음<span class='line'> |</span>
							<%} %>
							<!-- 라인 -->
							<span class='name' title='출판사'> <!-- 출판사정보 --> <a href='#'>새움</a>
							</span> <br> <span class='date' title='출간일'> <!-- 출간일 -->
								<%=b.getBookDate() %> <span>출간</span>
							</span> <span class='lating'>
								<p>
									<button class='starlating btn-link' onclick="location.href='#'">
										★★★★★</button>
									<span class='line'>|</span>
									<button class='reviewCount btn-link'
										onclick="location.href='#'">
										리뷰 <span class='counting'><%=reviewsize %></span>개
									</button>
									<span class='line'>|</span>
									<button class='reviewgogo btn-link'
										onclick="location.href='#'">리뷰쓰러가기</button>
								</p>
							</span>
						</div>
					</div>
					<!--  -->
					<hr>
					<!--  -->
					<div class='priceinfor'>
						<!-- 가격정보 -->
						<ul class='listprice'>
						<%int oriPrice=b.getPrice()+2000; %>
							<li>정가 : <span class='org_price'><%=oriPrice %> 원 </span> <br>
								판매가 : <span class='sell_price' title='판매가'> <strong>
										<%=b.getPrice() %> </strong> 원
							</span>
							</li>
							<li>
								<!-- 포인트 -->
								<%double point1 = b.getPrice()*0.05;
								int point = (int)point1;%>
								<div class='inkpoint'>
									<span class='all_inkpoint'>통합포인트 : </span> <span
										class='nom_point'> [포인트적립] <strong><%=point %></strong>원 적립 [<strong>5</strong>%
										적립]
									</span> <br> <span class='earn_point'>[추가적립] 5만원 이상 구매 시
										2천원 추가적립</span> <br> <span class='earn_point'>[회원혜택] 우수회원
										5만원 이상 구매 시 2~3% 추가적립</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class='choiceTab'>
			<button class='jangba btn-lg' onmouseout='change2(this)'
				onmouseover='change1(this)' onclick="location.href='#'">
				<strong>장바구니 담기</strong>
			</button>
			<button class='buy btn-lg' onmouseout='change2(this)'
				onmouseover='change1(this)' onclick="location.href='#">
				<strong>구매하기</strong>
			</button>
		</div>
		<hr>
		<div class='col-sm-12'>
			<div class='inforstorywr'>
				<table>
					<thead class='writerinfor'>
						<strong>저자소개</strong>
					</thead>
					<br>
					<br>
					<ul>
					<pre class='wrline' style='width:96%;'>
					<small>
                    <pre class='wrline1' style='border: 1px solid gray; width:100%'>
					<small><strong>저자 : <%=b.getAuthor().getAuthorName() %></strong></small>
					</pre><br>
						<%=b.getAuthor().getAuthorInfo() %>
                	</small>
					</pre>
					</ul>
			<br>
			<br>
				</table>
			</div>

			<div class='inforstorybi'>
				<table>
					<thead class='bookinfor'>
						<strong>책소개</strong>
					</thead>
			<br>
			<br>
					<ul>
						<pre class='biline' style='width:96%;'>
							<small>
								<%=b.getBookInfo() %>
                			</small>
						</pre>
					</ul>
			<br>
			<br>
				</table>
			</div>

			<%if(b.getBookContent()!=null) {%>
				<div class='inforstorybs'>
				   <thead class='bookstroy'>
				      <strong>줄거리</strong>
				   </thead>
				<br>
				<br>
				   <ul>
				      <pre class='bsline' style='width:96%;'>
				        <small>
			                  <%=b.getAuthor().getAuthorInfo() %>
			             </small>
				      </pre>
				   </ul>
				<br>
				<br>
				</div>
				<%} %>
			
			<div class='inforstorysn'>
				<table>
					<thead class='storynum'>
						<strong>목차</strong>
					</thead>
					<br>
					<br>
					<ul>
					<%String msg="이 책은 목차가 없습니다."; %>
						<pre class='snline' style='width:20%; word-break:break-all;'>
							<small>
                    		<%if(b.getToc()!=null) {%>
<%=b.getToc() %>
	                          <%} else{%>
<%=msg %>
	                          <%} %>
                			</small>
						</pre>
					</ul>
					<br>
					<br>
				</table>
			</div>

			<div class='reviewtable'>
                 <div class='writereview'>
                     <button class='reviewWrite' onclick='#'>
				<strong>리뷰쓰기</strong>
					</button>
                 </div>
				<thead class='reviewth'>
					<strong>회원리뷰</strong>
				</thead>
				<br>
				<br>
				<ul>
					<pre class='reviewpre' style='width:96%'>
                    <br>
                    <%for(Review r : list) {%>
	                    
	                    <style>
	                    input[type='checkbox'] {
							display: none;
						}
						
						label {
							color: royalblue;
							margin-top: 10px;
							cursor: pointer;
							display: inline-block;
						}
						
						label:after {
							content: '펼쳐보기';
						}
						
						input:checked ~ label:after {
							content: '닫기';
						}
	                    .inner<%=r.getReviewNum()%> {
							max-height: 26px;
							overflow: hidden;
							transition: all .2s ease;
						}
						
						input:checked+.inner<%=r.getReviewNum()%> {
							max-height: 1000px;
						}
						
						.alt {
							float:right;
							-moz-box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							-webkit-box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #7396ff), color-stop(1, #5784ff) );
							background:-moz-linear-gradient( center top, #7396ff 5%, #5784ff 100% );
							filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7396ff', endColorstr='#5784ff');
							background-color:#7396ff;
							-webkit-border-top-left-radius:9px;
							-moz-border-radius-topleft:9px;
							border-top-left-radius:9px;
							-webkit-border-top-right-radius:9px;
							-moz-border-radius-topright:9px;
							border-top-right-radius:9px;
							-webkit-border-bottom-right-radius:9px;
							-moz-border-radius-bottomright:9px;
							border-bottom-right-radius:9px;
							-webkit-border-bottom-left-radius:9px;
							-moz-border-radius-bottomleft:9px;
							border-bottom-left-radius:9px;
							text-indent:0px;
							border:1px solid #ffffff;
							display:inline-block;
							color:#ffffff;
							font-family:Arial;
							font-size:11px;
							font-weight:bold;
							font-style:normal;
							height:23px;
							line-height:23px;
							width:40px;
							text-decoration:none;
							text-align:center;
							text-shadow:0px 0px 0px #3522c7;
						}
						.alt:hover {
							background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5784ff), color-stop(1, #7396ff) );
							background:-moz-linear-gradient( center top, #5784ff 5%, #7396ff 100% );
							filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5784ff', endColorstr='#7396ff');
							background-color:#5784ff;
						}.alt:active {
							position:relative;
							top:1px;
						}
						.del {
							float:right;
							-moz-box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							-webkit-box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							box-shadow:inset 0px 0px 7px 1px #9fbcf5;
							background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #7396ff), color-stop(1, #5784ff) );
							background:-moz-linear-gradient( center top, #7396ff 5%, #5784ff 100% );
							filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7396ff', endColorstr='#5784ff');
							background-color:#7396ff;
							-webkit-border-top-left-radius:9px;
							-moz-border-radius-topleft:9px;
							border-top-left-radius:9px;
							-webkit-border-top-right-radius:9px;
							-moz-border-radius-topright:9px;
							border-top-right-radius:9px;
							-webkit-border-bottom-right-radius:9px;
							-moz-border-radius-bottomright:9px;
							border-bottom-right-radius:9px;
							-webkit-border-bottom-left-radius:9px;
							-moz-border-radius-bottomleft:9px;
							border-bottom-left-radius:9px;
							text-indent:0px;
							border:1px solid #ffffff;
							display:inline-block;
							color:#ffffff;
							font-family:Arial;
							font-size:11px;
							font-weight:bold;
							font-style:normal;
							height:23px;
							line-height:23px;
							width:40px;
							text-decoration:none;
							text-align:center;
							text-shadow:0px 0px 0px #3522c7;
						}
						.del:hover {
							background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5784ff), color-stop(1, #7396ff) );
							background:-moz-linear-gradient( center top, #5784ff 5%, #7396ff 100% );
							filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5784ff', endColorstr='#7396ff');
							background-color:#5784ff;
						}.del:active {
							position:relative;
							top:1px;
						}
	                    </style>
	                    <div class='reviews'>
	                        <small>
	                        <span class='info'>hw**g3324</span>
	                        <span class='line'>|</span>
	                        <span class='reviewdate'><%=r.getWriteDate() %></span>
	                        <span class='line'>|</span>
	                        <img src='<%=request.getContextPath() %>/images/rating/star05.gif'>
	                        </small>
	                    </div>
	                    <div class='content'>
	                        <small>
	                            <input type='checkbox' id='readmore<%=r.getReviewNum()%>' /> 
	                            <div class='inner<%=r.getReviewNum() %>' style='width:100%;'>
	                            <pre style='border:none; white-space:pre-wrap; word-break:break-all; margin-bottom:0px; padding-bottom:0px;'><small><%=r.getReviewContext() %></small></pre>
	                            </div>
	                            <%if(logined!=null&&(logined.getMemberNum()==r.getMemberNum()||logined.getIsAdmin()==1)) {%>
	                            <div type=hidden class='delal'>
		                    		<button onclick="#" class='del'>삭제</button>
		                            <button onclick="#" class='alt'>수정</button>
		                    	</div>
		                    	<%}%>
	                            <label for='readmore<%=r.getReviewNum()%>'>
	                            </label>
	                        </small>
	                    </div>
	                    <hr style='border-top: 1px dotted black'>
                    <%} %>
                    </pre>
				</ul>
			</div>
		</div>
	</div>
</section>

<%@include file='/views/common/footer.jsp'%>