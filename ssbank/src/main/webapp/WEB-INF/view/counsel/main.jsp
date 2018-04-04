<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
<div class="tab-wrap blue item3">
    <ul>
        <li data-category="4" class="counsel1 active"><a href="#">맞춤형 적금 상담</a></li>
        <li data-category="5" class="counsel2"><a href="#">맞춤형 예금 상담</a></li>
        <li data-category="7" class="counsel4"><a href="#">맞춤형 대출 상담</a></li>
    </ul>
</div>


<div id="board-body"></div>



</div>
<script>
//전연 변수
var pageNo=1;
var categoryIdx=4;



//디폴트 화면
$(function(){
	
	if('${categoryP}'!=""){
		$("li[data-category=${categoryP}]").addClass("active");
		$("li[data-category=${categoryP}]").siblings().removeClass("active");
		counselList('${categoryP}',1);
	}else{
	counselList(4,1);
	}
	
	//리스트 가져오기
	 $("li[class^=counsel]").on('click',function(){
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		var category = $(this).attr("data-category");
		console.log(category)
		counselList(category,1);
	});
	 
	 
	/*  $("li.counsel1").on("click",function(){
		 alert("test");
	 }); */
})
//목록 가져오기
function counselList(category,page){
	categoryIdx=category; //게시판 카테고리번호 
	pageNo=page; //페이지
	
	var url ="<%=cp%>/counsel/list";
	var q ="categoryIdx="+category+"&pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:q
		,success:function(data){
			$("#board-body").html(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

//한 글 가져오기 
function articleBoard(boardIdx,categoryIdx){
	var url="<%=cp%>/counsel/article";
	var q="categoryIdx="+categoryIdx+"&boardIdx="+boardIdx+"&pageNo="+pageNo;
	
	$.ajax({
		type:"get"
		,url:url
		,data:q
		,success:function(data){
			$("#board-body").html(data);
			replyList(categoryIdx,pageNo,boardIdx);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
	
}

function reloadBoard() {

	counselList(4,1);
}


//글쓰기 폼 
function insertBoard(categoryIdx){
	var url = "<%=cp%>/counsel/created";
	var q= "categoryIdx="+categoryIdx;
	$.ajax({
		type:"get"
		,url:url
		,data:q
		,success:function(data){
			$("#board-body").html(data);
			
		}
		,error:function(e) {
		console.log(e.responseText);
		}
	});
	
}

function sendBoard(mode,categoryIdx){
	var f = document.counselForm;
	if(! f.subject.value) {
		alert('제목을 입력 하세요. ');
		f.subject.focus();
		return;
	}

	if(! f.content.value) {
		alert('내용을 입력 하세요. ');
		f.content.focus();
		return;
	}

	
	if(mode=="created") {
		pageNo=1;
		searchKey="subject";
		searchValue="";
	}
	
	var url="<%=cp%>/counsel/"+mode;
	var query = $("form[name=counselForm]").serialize(); 
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var s=data.state;
			alert(s);
			counselList(categoryIdx,1);
		}
		,error:function(e) {
	  	console.log(e.responseText);
		}
	});
}

function deleteBoard(categoryIdx,page,boardIdx){
	if(!confirm("게시글을 삭제하시겠습니까?..")) return;
	var url ="<%=cp%>/counsel/delete";
	var q = "boardIdx="+boardIdx;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var s = data.state;
			counselList(categoryIdx,1);
		}
	 	,error:function(e){
	 		console.log(e.responseText);
		 }
	});
	
	

}

function replyList(categoryIdx,page,boardIdx){
	var url="<%=cp%>/counsel/replyList";
	var q="categoryIdx="+categoryIdx+"&pageNo="+page+"&boardIdx="+boardIdx;
	
	$.ajax({
		type:"get"
		,url:url
		,data:q
		,success:function(data){
			$("#listReply").html(data);
		}
		,error:function	(e) {
	  		console.log(e.responseText);
		}
	});
}

function insertReply(categoryIdx,page,boardIdx){
	var f = document.replyForm;
	if(! f.content.value) {
		alert('내용을 입력 하세요. ');
		f.content.focus();
		return;
	}
	
	var url="<%=cp%>/counsel/insertReply";
	var q = $("form[name=replyForm]").serialize(); 
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state="true"){
				$("#replyContent").val();
				replyList(categoryIdx,page,boardIdx);
			}else if(state=="false"){
				alert("댓글을 추가 하지 못했습니다.")
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

function deleteReply(replyIdx,page,categoryIdx,boardIdx){
	if(!confirm("게시글을 삭제하시겠습니까?..")) return;
	
	var url ="<%=cp%>/counsel/deleteReply";
	var q = "replyIdx="+replyIdx+"&mode=reply";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			replyList(categoryIdx,page,boardIdx);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
	
	
}


</script>