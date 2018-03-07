<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function deleteBoard() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	var boardIdx = "${dto.boardIdx}";
	var page = "${page}";
	var query = "boardIdx="+boardIdx+"&page="+page;
	var url = "<%=cp%>/customer/newsBoard/delete?" + query;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateBoard() {
<c:if test="${sessionScope.member.userId==dto.userId}">
	var boardIdx = "${dto.boardIdx}";
	var page = "${page}";
	var query = "boardIdx="+boardIdx+"&page="+page;
	var url = "<%=cp%>/customer/newsboard/update?" + query;

	location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>

<script type="text/javascript">
//로그인 화면
function login() {
	location.href="<%=cp%>/member/login";	
}

$(function(){
	$(".btnSendBoardLike").click(function(){
		if(! confirm("게시물에 공감 하십니까 ? "))
			return;
		
		var url="<%=cp%>/customer/newsBoard/insertBoardLike";
		var query="boardIdx=${dto.boardIdx}";
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					var count = data.boardLikeCount;
					$("#boardLikeCount").text(count);
				} else if(state=="false") {
					alert("게시물의 공감은 한번만 가능합니다.");
				}
			}
		    ,beforeSend:function(jqXHR) {
		    	jqXHR.setRequestHeader("AJAX", true);
		    } //
		    ,error:function(jqXHR) {
		    	if(jqXHR.status==401) {
		    		console.log(jqXHR);
		    	} else if(jqXHR.status==403) {
		    		// login();
		    		location.href="<%=cp%>/member/noAuthorized";
		    	} else {
		    		console.log(jqXHR.responseText);
		    	}
		    }
		});
		
	});
});

$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/customer/newsBoard/listReply";
	var query="pageNo="+page+"&boardIdx=${dto.boardIdx}";
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#listReply").html(data);
		}
	    ,beforeSend:function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==401) {
	    		console.log(jqXHR);
	    	} else if(jqXHR.status==403) {
	    		// login();
	    		location.href="<%=cp%>/member/noAuthorized";
	    	} else {
	    		console.log(jqXHR.responseText);
	    	}
	    }
	});
	
}

$(function(){
	$(".btnSendReply").click(function(){
		var content=encodeURIComponent($("#replyContent").val().trim());
		// var $t = $(this).closest("table");
		// var content = $t.find("textarea").val().trim();
		// content=encodeURIComponent(content);
		if(! content) {
			$("#replyContent").focus();
			return;
		}

		var url="<%=cp%>/customer/newsBoard/insertReply";
		var query="boardIdx=${dto.boardIdx}&content="+content+"&answer=0";
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					$("#replyContent").val("");
					
					listPage(1);
					
				} else if(state=="false") {
					alert("댓글을 추가 하지 못했습니다.");
				}
			}
		    ,beforeSend:function(jqXHR) {
		    	jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	alert(jqXHR.status);		    	
		    	if(jqXHR.status==401) {
		    		console.log(jqXHR);
		    	} else if(jqXHR.status==403) {
		    		location.href="<%=cp%>/member/noAuthorized";
		    	} else {
		    		console.log(jqXHR.responseText);
		    	}
		    }
		});
		
	});
});

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).parent().parent().next();
		// var $answerList = $trReplyAnswer.children().children().eq(0);
		
		var isVisible = $trReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			replyAnswerCount(replyNum);
		}
	});
});

// 댓글의 답글 리스트
function listReplyAnswer(replyNum) {
	var listId = "#listReplyAnswer"+replyNum;
	
	var url="<%=cp%>/customer/newsBoard/listReplyAnswer";
	var query="replyNum=replyNum";
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$(listId).html(data);
		}
	    ,beforeSend:function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==401) {
	    		console.log(jqXHR);
	    	} else if(jqXHR.status==403) {
	    		// login();
	    		location.href="<%=cp%>/member/noAuthorized";
	    	} else {
	    		console.log(jqXHR.responseText);
	    	}
	    }
	});
	
}

// 댓글의 답글 개수
function replyAnswerCount(replyNum) {
	var url="<%=cp%>/customer/newsBoard/replyAnswerCount";
	var query="replyNum=replyNum";
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var count=data.answerCount;
			$("#answerCount"+replyNum).text(count);
		}
	    ,beforeSend:function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==401) {
	    		console.log(jqXHR);
	    	} else if(jqXHR.status==403) {
	    		// login();
	    		location.href="<%=cp%>/member/noAuthorized";
	    	} else {
	    		console.log(jqXHR.responseText);
	    	}
	    }
	});
	
}

$(function(){
	// 댓글의 답글 달기
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var replyNum = $(this).attr("data-replyNum");
		var $tr = $(this).closest("tr");
		var content = $tr.find("textarea").val();
		
		if(! content) {
			$tr.find("textarea").focus();
			return;
		}
		
		var url="<%=cp%>/customer/newsBoard/insertReply";
		var query="boardIdx=${dto.boardIdx}&content="+encodeURIComponent(content)+"&answer="+replyNum;
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					$tr.find("textarea").val("");
					
					listReplyAnswer(replyNum);
					replyAnswerCount(replyNum);
					
				} else if(state=="false") {
					alert("답글을 추가 하지 못했습니다.");
				}
			}
		    ,beforeSend:function(jqXHR) {
		    	jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status==401) {
		    		console.log(jqXHR);
		    	} else if(jqXHR.status==403) {
		    		// login();
		    		location.href="<%=cp%>/member/noAuthorized";
		    	} else {
		    		console.log(jqXHR.responseText);
		    	}
		    }
		});
		
	});
});

$(function(){
	// 댓글 좋아요
	$("body").on("click", ".btnReplySendLike", function(){
		var replyNum = $(this).attr("data-replyNum");
		sendReplyLike(replyNum, 1);
	});

	// 댓글 싫어요
	$("body").on("click", ".btnReplySendDisLike", function(){
		var replyNum = $(this).attr("data-replyNum");
		sendReplyLike(replyNum, 0);
	});
	
	function sendReplyLike(replyNum, replyLike) {
		var msg="게시물이 마음에 들지 않으십니까 ?";
		if(replyLike==1)
			msg="게시물에 공감하십니까 ?";
		
		if(! confirm(msg))
			return;
		
		var url="<%=cp%>/customer/newsBoard/insertReplyLike";
		var query="replyNum="+replyNum+"&replyLike="+replyLike;
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {
					var likeCount=data.likeCount;
					var disLikeCount=data.disLikeCount;
					
					$("#replyLikeCount"+replyNum).text(likeCount);
					$("#replyDisLikeCount"+replyNum).text(disLikeCount);
					
				} else if(state=="false") {
					alert("좋아요/싫어요는 한번만 가능합니다.");
				}
			}
		    ,beforeSend:function(jqXHR) {
		    	jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status==401) {
		    		console.log(jqXHR);
		    	} else if(jqXHR.status==403) {
		    		// login();
		    		location.href="<%=cp%>/member/noAuthorized";
		    	} else {
		    		console.log(jqXHR.responseText);
		    	}
		    }
		})	;
	}
	
});

// 댓글 삭제
function deleteReply(replyNum, page) {
	if(! confirm("게시글을 삭제하시겠습니까 ?"))
		return;
	
	var url="<%=cp%>/customer/newsBoard/deleteReply";
	var query="replyNum="+replyNum+"&mode=reply";
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			// var state=data.state;
			listPage(page);
		}
	    ,beforeSend:function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==401) {
	    		console.log(jqXHR);
	    	} else if(jqXHR.status==403) {
	    		// login();
	    		location.href="<%=cp%>/member/noAuthorized";
	    	} else {
	    		console.log(jqXHR.responseText);
	    	}
	    }
	});
	
}

function deleteReplyAnswer(replyNum, answer) {
	if(! confirm("게시글을 삭제하시겠습니까 ?"))
		return;
	
	var url="<%=cp%>/customer/newsBoard/deleteReply";
	var query="replyNum="+replyNum+"&mode=answer";
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			// var state=data.state;
			listReplyAnswer(answer);
			replyAnswerCount(answer);
		}
	    ,beforeSend:function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==401) {
	    		console.log(jqXHR);
	    	} else if(jqXHR.status==403) {
	    		// login();
	    		location.href="<%=cp%>/member/noAuthorized";
	    	} else {
	    		console.log(jqXHR.responseText);
	    	}
	    }
	});
	
}
</script>

<div class="content">
	
	<h1>News Board</h1>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.createDate} | 조회 ${dto.hitCount}
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			
			<%-- <tr style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" height="40" style="padding-bottom: 15px;" align="center">
					<button type="button" class="btn btnSendBoardLike"><span style="font-family: Wingdings;">C</span>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
				</td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/bbs/article?${query}&boardIdx=${preReadDto.boardIdx}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/bbs/article?${query}&boardIdx=${nextReadDto.boardIdx}">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr> --%>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
				<tr height="45">
				    <td width="300" align="left">
				       <c:if test="${sessionScope.member.userId==dto.userId}">				    
				          <button type="button" class="btn" onclick="updateBoard();">수정</button>
				       </c:if>
				       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
				          <button type="button" class="btn-type-gray1 big" onclick="deleteBoard();">삭제</button>
				       </c:if>
				    </td>
				
				    <td align="right">
				        <button type="button" class="btn-type-blue big" onclick="javascript:location.href='<%=cp%>/customer/newsBoard/nib?${query}';">리스트</button>
				    </td>
				</tr>
			</table>
    </div>
    
    <div>
		<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'> 
				 <td align='left' >
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding:5px 5px 0px;'>
					<textarea class='boxTA' style='width:99%; height: 70px;' id="replyContent"></textarea>
			    </td>
			</tr>
			<tr>
			   <td align='right'>
			        <button type='button' class='btn-type-blue1 big' data-boardIdx='10' style='padding:10px 20px;'>댓글 등록</button>
			    </td>
			 </tr>
		</table>
		     
		<div id="listReply"></div>
    
    </div>
    
</div>
