<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
<div class="tab-wrap blue item4">
    <ul>
        <li data-category="4" class="counsel1 active"><a href="">맞춤형 적금 상담</a></li>
        <li data-category="5" class="counsel2"><a href="#">맞춤형 예금 상담</a></li>
        <li data-category="6" class="counsel3"><a href="#">맞춤형 펀드 상담</a></li>
        <li data-category="7" class="counsel4"><a href="#">맞춤형 대출 상담</a></li>
    </ul>
</div>

<div>
<div id="board-body"></div>
</div>
</div>
<script>
//전연 변수
var pageNo=1;
var searchKey="subject";
var searchValue="";
var categoryIdx=4;

//디폴트 화면
$(function(){
	counselList(4,1);
	
	//리스트 가져오기
	$("li[class^=counsel]").click(function(){
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		var category = $(this).attr("data-category");
		counselList(category,1);
	});
	
})
//목록 가져오기
function counselList(category,page){
	categoryIdx=category; //게시판 카테고리번호 
	pageNo=page; //페이지
	
	var url ="<%=cp%>/counsel/list";
	var q ="categoryIdx="+category+"&pageNo="+page;
	if(searchValue!=""){
		q+="&searchKey="+searchKey+"&searchValue="+encodURIComponent(searchValue);
	}
	
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
	if(searchValue!="")
		q+="&searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
	
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

function reloadBoard() {

	searchKey="subject";
	searchValue="";
	
	counselList(4,1);
}
function searchList() {
	searchKey=$("#searchKey").val();
	searchValue=$("#searchValue").val();
	
	var category = $(this).attr("data-category");
	counselList(category,1);
}

//글쓰기 폼 
function insertBoard(categoryIdx){
	var url = "<%=cp%>/counsel/created";
	var q= "categoryIdx="+categoryIdx;
	alert(categoryIdx);
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

	if(! f.boardPwd.value) {
		alert('패스워드를 입력 하세요. ');
		f.boardPwd.focus();
		return;
	}
	
	if(mode=="created") {
		pageNo=1;
		searchKey="subject";
		searchValue="";
	}
	
	var url="<%=cp%>/counsel/"+mode;
	var query = $("form[name=counselForm]").serialize(); 
	alert(query);
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

</script>