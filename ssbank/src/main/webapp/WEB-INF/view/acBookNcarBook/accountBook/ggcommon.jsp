<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	funcExpense(); // 처음 지출 출력
	$("#accountBookMenu ul li").click(function(){
		$("#accountBookMenu ul li").each(function(){
			$(this).removeClass("active");
		});
		
		$(this).addClass("active");
		
		var type=$(this).attr("data-productType");
		
		if(type=="1") {
			// 지출
			funcExpense();
		} else if(type=="2") {
			// 수입
			funcIncome();
		} else if(type=="3") {
			// 달력
		}
	});
	
});


  

function funcExpense() {
	// 지출
	var url="<%=cp%>/acBookNcarBook/expense";
	var query="t="+new Date().getTime();
	
	$.ajax({
		type:"GET"
		,url:url
		,data:query
		,async:false
		,success:function(data){
			$("#accountBookContent").html(data);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});	
}

function funcIncome() {
	// 수입
	var url="<%=cp%>/acBookNcarBook/income";
	var query="t="+new Date().getTime();
	
	$.ajax({
		type:"GET"
		,url:url
		,data:query
		,success:function(data){
			$("#accountBookContent").html(data);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});	
}


$(function(){
    //체크박스 전체선택 해제
    $("body").on('change', "#sltAll", function(){
        //클릭되었으면
        if($("#sltAll").prop("checked")){
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[id=sltThis]").prop("checked",true);
            //클릭이 안되었으면
        }else{
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[id=sltThis]").prop("checked",false);
        }
    });
    
   
    //행추가
	$("body").on('click', "#addRowBtn", function(){
    	
    		var my_tbody = document.getElementById('my-tbody');
    	   //var row = my_tbody.insertRow(0); // 상단에 추가
    	   var row = my_tbody.insertRow( my_tbody.rows.length-1 ); // 하단에 추가
    	   var cell1 = row.insertCell(0); //체크박스
    	   var cell2 = row.insertCell(1); //날짜
    	   var cell3 = row.insertCell(2); //내역
    	   var cell4 = row.insertCell(3); //현금
    	   var cell5 = row.insertCell(4); //카드
    	   var cell6 = row.insertCell(5); //카테고리
    	   var cell7 = row.insertCell(6); //입력및 수정
    	  
    	   var s= "<div class='item-select' name='sltCat' value=''>";
    		s+= "<select class='slt'>";
    	   s+= "<option>카테고리</option>";
    	   s+= "<option>식비</option>";
    	   s+= "<option>주거/통신</option>";
    	   s+= "<option>생활용품</option>";
    	   s+= "<option>의복/미용</option>";
    	   s+= "<option>건강/문화</option>";
    	   s+= "<option>교육/육아</option>";
    	   s+= "<option>교통/차량</option>";
    	   s+= "<option>경조사/회비</option>";
    	   s+= "<option>세금/이자</option>";
    	   s+= "<option>용돈/기타</option>";
    	   s+= "<option>미분류</option>";
    	   s+= "</select>";
    	   s+= "</div>";
    	   
    	   cell1.innerHTML = '<div class="item-checkbox"><input type="checkbox" id="sltThis" value=""><label for="sltThis"></label></div>';
    	   cell2.innerHTML = '<input type="text" class="ACBtext" size="10" value="${dto.accountBookDate}" style="width=100%">';
    	   cell3.innerHTML = '<input type="text" class="ACBtext" size="10" value="${dto.content}" style="width=100%">';
    	   cell4.innerHTML = '<input type="text" class="ACBtext" size="10"  style="width=100%">';
    	   cell5.innerHTML = '<input type="text" class="ACBtext" size="10" value="${dto.amount}" style="width=100%">';
    	   cell6.innerHTML = s;
    	   cell7.innerHTML = '<a href="#" class="btn-type-blue1 medium">입력</a>';
    	
    });
    
    
});

$(function(){
	
	$("tr td:nth-child(2) .ACBtext").datepicker({
		showOn:"button"
		,buttonImage:"<%=cp %>/resource/images/ico_calendar.png"
		,buttonImageOnly:true
	});
	
	$(".ui-datepicker-trigger").css({
		position:"absolute", width:"30px", height:"30px"
	});
	
});

 $(window).load(function(){
	
	$("li[class^=acBookWrite]").click(function(){
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
	});
	
	
});
 
//셀렉트박스 기본값

 
</script>

<div class="content">
	<!-- jsp body 영역 -->
	<div class="table-wrap">
		<!-- jsp body 영역 -->
			<div class="page-con">
				<h1>가계부 쓰기</h1>
				<div class="date-wrap">
					<a href="#" class="btn arrow-left"></a>
					<span>2018.03.01 ~ 2018.03.31</span>
					<a href="#" class="btn arrow-right"></a>
				</div>
				<h2>가계부 요약</h2>
				<div class="account-area mb30">
					<div class="graph-area">그래프이미지영역</div>
					<div class="account-view">
						<ul>
							<li class="income-area">
								<div class="view-tit">수입</div>
								<div class="view-sub">
									<dl>
										<dd>${inTot}</dd>
										<dt>주수입</dt>
									</dl>
									<dl>
										<dd>0</dd>
										<dt>부수입</dt>
									</dl>
								</div>
								<div class="view-total">${inTot}</div>
							</li>
							<li class="spend-area">
								<div class="view-tit">지출</div>
								<div class="view-sub">
									<dl>
										<dd>${exTot}</dd>
										<dt>현금</dt>
									</dl>
									<dl>
										<dd>0</dd>
										<dt>카드</dt>
									</dl>
								</div>
								<div class="view-total">${exTot}</div>
							</li>
							<li>
								<span class="ico-sum"></span>
								<span class="account-total">${total}</span>
							</li>
						</ul>
					</div>
				</div>
				<div id="accountBookMenu" class="tab-wrap blue item3">
					<ul>
						<li data-productType="1" class="acBookWrite active"><a href="#">지출</a></li>
						<li data-productType="2" class="acBookWrite"><a href="#">수입</a></li>
						<li data-productType="3" class="acBookWrite"><a href="#">달력</a></li>
					</ul>
				</div>
				
				<div id="accountBookContent"></div>

			</div>
			
        	</div>
        </div>


<!--자바스크립트-->
<script type="text/javascript">


</script>