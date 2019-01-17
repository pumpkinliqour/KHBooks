<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.kh.absence.model.vo.*" %>
<%
	Absence ab = (Absence)request.getAttribute("ab");
%>

<%@ include file="/views/common/noticeHeader.jsp"%> 



<style>

 hr {
    border: 0;
    height: 2px;
    background: #ccc;
  }



.control-label{
	font-size: 1.2em;
	position: relative;
	top: 5px;

}


.form-control{
	position: relative;
	top: -1.5px;
	
}

 h3{
	text-font: 1em;
}

#map{
width: 50px;
}



</style>


<script>
function fn_enroll_validate(){
	
	var isbn=$("#isbn");
	if(isbn.val().length!=13){
		alert("잘못 입력하셨습니다. 13 숫자를 입력하세요.");
		isbn.focus();
		return false;
	}return true;
};



</script>


		<title>희망도서신청 -KH북스</title>
			<section id='enroll-container'>
				<div class="container col-md-offset-4 col-md-5">
					<div class="row">
						<h1>희망 도서 신청</h1>
						<hr/>
						<h3>도서검색</h3></br>
						<p> &nbsp; 한 항목만 입력하셔도 됩니다. </br>
						두 항목 이상 입력하시면 두 항목을 동시에 만족하는 상품을 찾습니다. </br>
						복합명사는 띄어쓰기를 하면 더 많은 검색 결과를 얻으실 수 있습니다.</p>
		            </div>
		         	<div class="row" >
						<form name="appendBookFrm" class="form-horizontal" action="<%=request.getContextPath()%>/notice/noticeabsence" method="post" >
							<table>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bookName" maxlength="20" placeholder="* 도서명" name="bookName" required="required">
									</div>
								</div>
								<div class="form-group">								
									<div class="col-sm-10">
										<input type="text" class="form-control" id="authorName" placeholder="* 저자" name="authorName"  maxlength="15" required="required">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="publisher" placeholder="출판사" name="publisher">
									</div>
								</div>
								<div class="form-group">							
									<div class="col-sm-10">								
										<select class="form-control" id="bookDate" name="bookDate">
											  <option selected>발행년도 선택</option>
											  <%for(int i=2019; i>=1900; i--){ %>
											  <option value="<%=i%>"><%=i+"년" %></option>
											  <%} %>													
										</select>													
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="isbn" placeholder="* ISBN 13자리 숫자만 입력하세요." name="isbn" maxlength="13" required="required">
									   <!--  <button type="submit" class="btn btn-default" onclick="return validate();">검색</button> -->
									</div>
								</div>
								
								</br>
								<div class="form-group">
								
									<div class="bBtn col-sm-offset-2 col-sm-10" >
										<button type="submit" class="btn btn-default" onclick="validate();">신청</button>
										<button type="reset" class="btn btn-default" onclick="cancel();">취소</button>
									</div>
								</div>
							</table>
						</form>					
			    	</div>
				</div>
			</section>
		</div>


<script>
		/* 숫자만 입력받게 하는 함수 */

		$('.tel').on('keyup', function() { 
		    if (/\D/.test(this.value)) { 
		        this.value = this.value.replace(/\D/g, '') 
		        alert('숫자만 입력가능합니다.'); 
		        
		    } 
		});
		
function cancel(){
	if(!confirm('정말로 삭제하시겠습니까?'))
	{
		return;	
	}
	ab.setAppCancel(true);
	location.href="<%=request.getContextPath()%>/"
	
}

		

 function validate() {

		var content = $('[name=content]').val();
		if (content.trim().length == 0) {
			alert("내용을 입력하세요!");
		}else{
			
			location.href="<%=request.getContextPath()%>/notice/noticeabsence?no=<%=logined.getMemberNum()%>";
		}
		
	} 
</script> 

<%@ include file="/views/common/footer.jsp"%>>