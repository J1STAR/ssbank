<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

<script type="text/javascript">
$(function(){
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage(1);
	});
});

// 글리스트 및 페이징 처리
function listPage(pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/list";
	
	var query="pageNo="+pageNo;
	if($('form[name=customerSearchForm]') != undefined) {
		var search=$('form[name=customerSearchForm]').serialize();
		query=query+"&"+search;
	}
	ajaxHTML(url, "get", query);
}

// 글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
			$("#tab-main-content").html(data);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	  	,error : function(jqXHR) {
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	            // location.href="<%=cp%>/member/login";
	        	location.href="<%=cp%>/member/noAuthorized";
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
}

// 검색
function searchList() {
	var f=document.customerSearchForm;
	f.searchKey.value=$("#searchKey").val();
	f.searchValue.value=$.trim($("#searchValue").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f = document.customerSearchForm;
	f.searchKey.value="subject";
	f.searchValue.value="";
	
	listPage(1);
}

// 글쓰기폼
function insertForm() {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/created";

	var query="tmp="+new Date().getTime();
	ajaxHTML(url, "get", query);
}

// 글등록, 수정등록, 답변등록
function sendOk(mode, pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
    var f = document.boardForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
    if(tab=="inquiry" && mode=="created") {
    	if(f.emailRecv.checked && ! f.email.value) {
    		alert("이메일을 입력하세요. ");
            f.email.focus();
            return;
    	}
    	
    	if(f.phoneRecv.checked && ! f.phone.value) {
    		alert("전화번호를 입력하세요. ");
            f.phone.focus();
            return;
    	}
    }
	
    var url="<%=cp%>/customerCounsel/"+tab+"/"+mode;
    var query = new FormData(f); // IE는 10이상에서만 가능
    
	$.ajax({
        type:"post"
        ,url:url
        ,processData: false  // file 전송시 필수
        ,contentType: false  // file 전송시 필수
        ,data: query
        ,dataType:"json"
        ,success:function(data) {
            var state=data.state;
            if(state=="false")
                alert("게시물을 추가(수정)하지 못했습니다. !!!");

        	if(pageNo==undefined || pageNo=="")
        		pageNo="1";
        	
        	listPage(pageNo);
        	
        }
        ,beforeSend : function(jqXHR) {
            jqXHR.setRequestHeader("AJAX", true);
        }
        ,error : function(jqXHR) {
            if (jqXHR.status == 401) {
               console.log(jqXHR);
            } else if (jqXHR.status == 403) {
                // location.href="<%=cp%>/member/login";
            	location.href="<%=cp%>/member/noAuthorized";
            } else {
                console.log(jqXHR.responseText);
            }
        }
	});
}

// 글쓰기 취소, 수정 취소, 답변 취소
function sendCancel(pageNo) {
	if(pageNo==undefined || pageNo=="")
		pageNo="1";
	
	listPage(pageNo);
}

// 게시글 보기
function articleBoard(boardIdx, pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/article";
	
	var query;
	if(tab=="customerManageService")
		query="boardIdx="+boardIdx;
	else
		query="boardIdx="+boardIdx;
	
	var search=$('form[name=customerSearchForm]').serialize();
	query=query+"&pageNo="+pageNo+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글 수정폼
function updateForm(boardIdx, pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/update";
	
	var query;
	if(tab=="customerManageService")
		query="boardIdx="+boardIdx;
	else
		query="boardIdx="+boardIdx;
	
	query=query+"&pageNo="+pageNo
	
	ajaxHTML(url, "get", query);
}

//글 답변폼
function replyForm(boardIdx, pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/reply";
	
	var query;
	if(tab=="customerManageService")
		query="boardIdx="+boardIdx;
	else
		query="boardIdx="+boardIdx;
	query=query+"&pageNo="+pageNo
	
	ajaxHTML(url, "get", query);
}

// 글 삭제
function deleteBoard(boardIdx, pageNo) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customerCounsel/"+tab+"/delete";
	
	var query;
	if(tab=="customerManageService") {
		query="boardIdx="+boardIdx;
	} else { 
		query="boardIdx="+boardIdx;
	}
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? "))
		  return;
	  
	$.ajax({
	        type:"post"
	        ,url:url
	        ,data: query
	        ,dataType:"json"
	        ,success:function(data) {
	            listPage(pageNo);
	        }
	        ,beforeSend : function(jqXHR) {
	            jqXHR.setRequestHeader("AJAX", true);
	        }
	        ,error : function(jqXHR) {
	            if (jqXHR.status == 401) {
	               console.log(jqXHR);
	            } else if (jqXHR.status == 403) {
	                // location.href="<%=cp%>/member/login";
	            	location.href="<%=cp%>/member/noAuthorized";
	            } else {
	                console.log(jqXHR.responseText);
	            }
	        }
	});
}

</script>

<div class="content">
	<div class="tab-wrap blue item4">
		    <ul class="tabs">
		        <li data-category="4" id="tab-customerManageService" class="counsel1" data-tab="customerManageService"><a href="#">자주하는 질문</a></li>
		        <li data-category="5" id="tab-customerVoice" class="counsel2" data-tab="customerVoice"><a href="#">고객의 소리</a></li>
		        <li data-category="6" id="tab-mailCounsel" class="counsel3" data-tab="mailCounsel"><a href="#">이메일 상담</a></li>
		        <li data-category="7" id="tab-liveCounsel" class="counsel4" data-tab="liveCounsel"><a href="#">실시간 상담</a></li>
		    </ul>
	</div>
	
	<div id="tab-main-content">
	
		<h1>고객센터 안내</h1>
			
		<h2></h2>
		
		<div class="tab-wrap blue item3">
    	<ul>
	        <li>고객상담 서비스</li>
	        <li>금융소비자 보호</li>
	        <li>편리한 서비스 안내</li>
    	</ul>
		</div>
		
        <div id="tab1" class="tab_content">
	            <div class="tab-area">
	                &nbsp;
	                <hr>
	                <div>
	                <div class='customer'>
		                <div class="col-md-6" style="width: 33%; float:left; ">
			                <h2>고객센터 안내</h2> 
				                <div class="btn-type-blue1">개인</div> <br>
				                <br>
				                - 1588-3088 / 1577-3088 / 1566-3088 <br>
				                - 해외에서 전화시 82-2-3889-8380<br>
				                <br>
				                <div class="btn-type-blue1">기업</div> <br>
				                <br>
				                - 1588-3088 / 1577-3088 / 1566-3088 <br>
				                - 해외에서 전화시 82-2-3889-8380<br>
				                <br>
				                <div class="btn-type-blue1">외국어</div> <br>
				                <br>
				                - 1577-3388 <br>
				                - 해외에서 전화시 82-2-3889-8380 <br>
				                <br>
				                <div class="btn-type-blue1">수화상담</div> <br>
				                <br>
				                - 070-7848-8000 / 070-7848-8001 <br>
				                - 평일 9:00 ~ 17:50(은행 휴무일 제외)<br>
				                - 사고신고 365일 24시간
		                </div>
		                
		                <div class="col-md-6" style="width: 33%; float:left;">
			     	  		<h2>금융소비자보호</h2>
				     	  		<div class="btn-type-blue1">고객 의견 접수</div> <br>
				                <br>
				                - 건의, 칭찬, 불만 등 고객님의 소중한 <br>
				                  	의견을 들려주세요.<br>
				                <br>
				                <div class="btn-type-blue1">전자 민원</div> <br>
				                <br>
				                - 은행업무와 관련, 부당한 업무처리 및  <br>
				             		금융분쟁을 신고하실 수 있습니다.<br>
				                <br>
				                <div class="btn-type-blue1">사고 신고</div> <br>
				                <br>
				                - 분실/사고,ARS나 인터넷으로 신고하세요. <br>
				              		* 인터넷신고는 뱅킨 가입자에 한함 <br>
				                <br>
				                <div class="btn-type-blue1">소비자 정보</div> <br>
				                <br>
				                - 소비자 보호 우수사례 <br>
				                - 금융소비자 보호 체계<br>
				                - 금융 생활정보
			    	 	</div>
			    	 	
			    	 	<div class="col-md-6" style="width: 33%;float:left;">
			     	  		<h2>편리한 서비스 안내</h2>
				     	  		<div class="btn-type-blue1">회원서비스</div> <br>
				                <br>
				                - 회원가입(개인/기업) <br>
				                - 이용자 ID/비밀번호 찾기<br>
				                - 회원정보 변경<br>
				                <br>
				                <div class="btn-type-blue1">쌍용 자산 클럽</div> <br>
				                <br>
				                - 쌍용 자산 관리  <br>
				                - 쌍용 가계부<br>
				                - 부동산<br>
				                - 금융상품<br>
				                <br>
				                <div class="btn-type-blue1">보안서비스</div> <br>
				                <br>
				                - 암호화 및 강력한 고객인증을 통한  <br>
				        			인터넷뱅킹의 안전을 보장해 드립니다. <br>
				                <br>
				                <div class="btn-type-blue1">자료실</div> <br>
				                <br>
				                - 자료실<br>
			    	 	</div>	
	               </div>
	               </div>
	            </div>
  			</div>

	</div>
	

</div>




