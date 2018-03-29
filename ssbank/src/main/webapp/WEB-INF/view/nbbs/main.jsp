<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<style type="text/css">
.board-container{
	width: 700px;
	margin:30px auto;
}

.board-container .title {
    font-weight: bold;
    font-size:15px;
    margin-bottom:10px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

<script type="text/javascript">
// 전연 변수
var pageNo=1;
var searchKey="subject";
var searchValue="";

$(function(){
	listPage(1);	
});

function listPage(page) {
	pageNo=page;
	
	var url="<%=cp%>/nbbs/list";
	var query="pageNo="+page;
	if(searchValue!="")
		query+="&searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#board-body").html(data);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

function reloadBoard() {
	// $("#searchKey").val("subject");
	// $("#searchValue").val("");
	
	searchKey="subject";
	searchValue="";
	
	listPage(1);
}

function searchList() {
	searchKey=$("#searchKey").val();
	searchValue=$("#searchValue").val();
	
	listPage(1);
}

// 글쓰기 폼
function insertBoard() {
	var url="<%=cp%>/nbbs/created";
/*	
	$.get(url, {temp:new Date().getTime()}, function(data){
		$("#board-body").html(data);
	});
*/

	$("#board-body").load(url);
}

// 글등록 및 수정 완료
function sendBoard(mode) {
	var f=document.boardForm;
	if(! f.subject.value) {
		alert('제목을 입력 하세요. ');
		f.subject.focus();
		return;
	}

	if(! f.name.value) {
		alert('이름을 입력 하세요. ');
		f.name.focus();
		return;
	}

	if(! f.content.value) {
		alert('내용을 입력 하세요. ');
		f.content.focus();
		return;
	}

	if(! f.pwd.value) {
		alert('패스워드를 입력 하세요. ');
		f.pwd.focus();
		return;
	}
	
	if(mode=="created") {
		pageNo=1;
		searchKey="subject";
		searchValue="";
	}
	
	var url="<%=cp%>/nbbs/"+mode;
	
	// var query=$("form[name=boardForm]").serialize();  // 파일 첨부 불가
	var query = new FormData(f); // IE 10 이상

	$.ajax({
		type:"post"
		,url:url
		,processData: false // file 전송시 필수(데이터를 쿼리문자열로 변환할지여부, 기본:true->application/x-www-form-urlencoded 로 변환)
		,contentType: false // file 전송시 필수(기본:application/x-www-form-urlencoded)
		,data:query
		,dataType:"json"
		,success:function(data) {
			// var s=data.state;
			
			listPage(pageNo);
		}
		,error:function(e) {
		  	console.log(e.responseText);
		}
	});
}

function articleBoard(num) {
	var url="<%=cp%>/nbbs/article";
	var query="num="+num+"&pageNo="+pageNo
	if(searchValue!="")
		query+="&searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#board-body").html(data);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});	
}

// 수정 폼
function updateBoard(num) {
	  	var url="<%=cp%>/nbbs/update";

		var query="num="+num+"&pageNo="+pageNo
		if(searchValue!="")
			query+="&searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
		
		$.ajax({
			type:"get"
			,url:url
			,data:query
			,success:function(data) {
				$("#board-body").html(data);
			}
			,error:function(e) {
				console.log(e.responseText);
			}
		});	
}

// 삭제
function deleteBoard(num, saveFilename) {
    	if(!confirm("게시물을 삭제 하시겠습니까 ?"))
    		return;

       var url="<%=cp%>/nbbs/delete";
	   var query="num="+num+"&saveFilename="+saveFilename;
	   $.ajax({
		  type:"post"
		 ,url:url
		 ,data:query
		 ,dataType:"json"
		 ,success:function(data) {
				var state=data.state;
				if(state=="fail")
					alert("게시물을 삭제 할 수 없습니다. !!!");
			
		        listPage(pageNo);
		  }
	     ,error:function(e) {
			console.log(e.responseText);
		 }
	  });
}
</script>

</head>

<body>
<div class="board-container">
	<div id="board-header">
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td align="left" class="title">
					<h3><span>|</span> 게시판</h3>
				</td>
			</tr>
		</table>
	</div>
	<div id="board-body"></div>
 </div>
</body>

</html>