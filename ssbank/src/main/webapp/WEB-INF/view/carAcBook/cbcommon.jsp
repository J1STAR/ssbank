<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

$(function(){
	funcRecord(); // 처음 기록 출력
	$("#accountBookMenu ul li").click(function(){
		$("#accountBookMenu ul li").each(function(){
			$(this).removeClass("active");
		});
		
		$(this).addClass("active");
		
		var type=$(this).attr("data-productType");
		
		if(type=="1") {
			// 기록
			funcRecord();
		} else if(type=="2") {
			// 통계
			funcStat();
		} else if(type=="3") {
			// 내 차 점검
			funcCheck();
		} else if(type=="4") {
			// 정비 목록
			funcReList();
		}
	});
	
});

<%-- 
//내 차 등록
//등록 대화상자 출력
$(function(){
	$(".").click(function(){
		// 폼 reset
		$("form[name=]").each(function(){
			this.reset();
		});
		
		var date=$(this).attr("data-date");
		date=date.substr(0,4)+"-"+date.substr(4,2)+"-"+date.substr(6,2);

		$("form[name=scheduleForm] input[name=sday]").val(date);
		$("form[name=scheduleForm] input[name=eday]").val(date);
		
		$("#form-sday").datepicker({showMonthAfterYear:true});
		$("#form-eday").datepicker({showMonthAfterYear:true});
		
		$("#form-sday").datepicker("option", "defaultDate", date);
		$("#form-eday").datepicker("option", "defaultDate", date);
		
		$('#schedule-dialog').dialog({
			  modal: true,
			  height: 650,
			  width: 600,
			  title: '스케쥴 등록',
			  close: function(event, ui) {
			  }
		});

	});
});

$(function(){
	$("#form-allDay").click(function(){
		if(this.checked==true) {
			$("#form-stime").val("").hide();
			$("#form-etime").val("").hide();
		} else if(this.checked==false && $("#form-repeat").val()==0){
			$("#form-stime").val("00:00").show();
			$("#form-etime").val("00:00").show();
		}
	});

	$("#form-sday").change(function(){
		$("#form-eday").val($("#form-sday").val());
	});
	
	$("#form-repeat").change(function(){
		if($(this).val()=="0") {
			$("#form-repeat_cycle").val("0").hide();
			
			$("#form-allDay").prop("checked", true);
			$("#form-allDay").removeAttr("disabled");
			
			$("#form-eday").val($("#form-sday").val()).show();

		} else {
			$("#form-repeat_cycle").show();
			
			$("#form-allDay").prop("checked", true);
			$("#form-allDay").attr("disabled","disabled");

			$("#form-eday").val("").hide();
			$("#form-stime").val("").hide();
			$("#form-etime").val("").hide();
		}
	});
	
});

//등록
$(function(){
	$("#btnScheduleSendOk").click(function(){
		if($("#form-repeat_cycle").val()=="")
			$("#form-repeat_cycle").val("0");
		
		var query=$("form[name=scheduleForm]").serialize();
		var url="<%=cp%>/schedule/insert";
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="loginFail") {
					location.href="<%=cp%>/member/login";
				} else if(state=="true") {
					var dd=$("#form-sday").val().split("-");
					var y=dd[0];
					var m=dd[1];
					if(m.substr(0,1)=="0") 	m=m.substr(1,1);
					location.href="<%=cp%>/schedule/month?year="+y+"&month="+m;
				}
			}
		    ,beforeSend:check
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
		
	});
});

//등록 대화상자 닫기
$(function(){
	$("#btnScheduleSendCancel").click(function(){
		$('#schedule-dialog').dialog("close");
	});
});

//등록내용 유효성 검사
function check() {
	if(! $("#form-subject").val()) {
		$("#form-subject").focus();
		return false;
	}

	if(! $("#form-sday").val()) {
		$("#form-sday").focus();
		return false;
	}

	if($("#form-eday").val()) {
		var s1=$("#form-sday").val().replace("-", "");
		var s2=$("#form-eday").val().replace("-", "");
		if(s1>s2) {
			$("#form-sday").focus();
			return false;
		}
	}
	
	if($("#form-stime").val()!="" && !isValidTime($("#form-stime").val())) {
		$("#form-stime").focus();
		return false;
	}

	if($("#form-etime").val()!="" && !isValidTime($("#form-etime").val())) {
		$("#form-etime").focus();
		return false;
	}
	
	if($("#form-etime").val()) {
		var s1=$("#form-stime").val().replace(":", "");
		var s2=$("#form-etime").val().replace(":", "");
		if(s1>s2) {
			$("#form-stime").focus();
			return false;
		}
	}	
	
	if($("#form-repeat").val()!="0" && ! /^(\d){1,2}$/g.test($("#form-repeat_cycle").val())) {
		$("#form-repeat_cycle").focus();
		return false;
	}
	
	if($("#form-repeat").val()!="0" && $("#form-repeat_cycle").val()<1) {
		$("#form-repeat_cycle").focus();
		return false;
	}
	
	return true;
}
--%>



//기록
function funcRecord() {
	var startDate=$("#resultDate").attr("data-start");
	var endDate=$("#resultDate").attr("data-end");
	
	var url="<%=cp%>/acBookNcarBook/record";
	var query="startDate="+startDate+"&endDate="+endDate;
	
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

//통계
function funcStat() {
	var startDate=$("#resultDate").attr("data-start");
	var endDate=$("#resultDate").attr("data-end");
	
	var url="<%=cp%>/acBookNcarBook/stat";
	var query="startDate="+startDate+"&endDate="+endDate;
	
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

//내 차 점검
function funcCheck() {
	var startDate=$("#resultDate").attr("data-start");
	var endDate=$("#resultDate").attr("data-end");
	
	var url="<%=cp%>/acBookNcarBook/check";
	var query="startDate="+startDate+"&endDate="+endDate;
	
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

//정비 목록
function funcReList() {
	var startDate=$("#resultDate").attr("data-start");
	var endDate=$("#resultDate").attr("data-end");
	
	var url="<%=cp%>/acBookNcarBook/relist";
	var query="startDate="+startDate+"&endDate="+endDate;
	
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
<%-- 
//날짜 선택 달력보기
function datepickerView() {
	$("td:nth-child(2) .ACBtext").datepicker({
		showOn:"button"
		,buttonImage:"<%=cp%>/resource/images/ico_calendar.png"
		,buttonImageOnly:true
	});

	$(".ui-datepicker-trigger").css({
			position:"absolute", width:"30px", height:"30px"
	});
	
	$("td:nth-child(2) .ACBtext").css("border", "none");
}
 --%>
 
$(document).ready(function(){
	  $("#spreadBtn").click(function(){
	      if($("#hiddenContent").is(":visible")){
	          $("#hiddenContent").css("display", "none");
	      }else{
	          $("#hiddenContent").css("display", "block");
	      }
	  });
});


</script>

<div class="content">
	<!-- jsp body 영역 -->
	<div class="table-wrap">
		<!-- jsp body 영역 -->
		<div class="page-con">
			<h1>차계부</h1>
			
			<h2>차계부 요약</h2>
			<div class="account-area mb30">
				<div class="item-select">
				<h4>내 차 목록</h4>
        			<select name="" id="">
            			<option>나의 보유차량</option>
            			<c:forEach var="dto" items="${myCarList}" varStatus="status">
						<option value="${dto.myCarIdx}" ${dto.myCarIdx == myCarIdx ? 'selected="selected"' : '' }>${dto.modelName}</option>
						</c:forEach>
					</select>
    			</div>
				<div class="account-view">
					<ul>
						<li class="income-area">
							<div class="view-tit">평균 연비</div>
							<div class="view-total">0000 km/L</div>
						</li>
						<li class="spend-area">
							<div class="view-tit">누적주행거리</div>
							<div class="view-total">1500 km</div>
						</li>
					</ul>
				</div>
			</div>
			<div id="accountBookMenu" class="tab-wrap blue item4">
				<ul>
					<li data-productType="1" class="acBookWrite active"><a href="#">기록</a></li>
					<li data-productType="2" class="acBookWrite"><a href="#">통계</a></li>
					<li data-productType="3" class="acBookWrite"><a href="#">내 차 점검</a></li>
					<li data-productType="4" class="acBookWrite"><a href="#">정비목록</a></li>
				</ul>
			</div>

			<div id="accountBookContent"></div>

		</div>

	</div>
</div>