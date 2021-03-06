
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<script language="javascript">
	$(window).load(function() {
		getAddr();
	});
	function getAddr() {
		var strURL;
		strURL = "http://apply.lh.or.kr/RCMC_LCC_SIL_SILSNOT_L0001.jsp?";
		var strURLAP;
		strURLAP = "";
		var apiKey;
		apiKey = "kDnZ59QNhIlu73YMLMLuOHUk7lYUTdOoRVH7UPl1n4"; //인증받은키
		var strSZ = document.getElementById("strSZ").value;
		var strPAGE = document.getElementById("strPAGE").value;
		var strTITLE = document.getElementById("strTITLE").value;
		var strAREA = document.getElementById("strAREA").value;
		var strSTAT = document.getElementById("strSTAT").value;
		var strAISTPCD = document.getElementById("strAISTPCD").value;
		//키값설정
		strURLAP = strURLAP + "apiKey=" + apiKey;
		if (strSZ != "") {
			strURLAP = strURLAP + "&PG_SZ=" + strSZ;
		}
		if (strPAGE != "") {
			strURLAP = strURLAP + "&PAGE=" + strPAGE;
		}
		if (strTITLE != "") {
			strURLAP = strURLAP + "&PAN_NM=" + encodeURI(strTITLE);
		}
		if (strAISTPCD != "") {
			strURLAP = strURLAP + "&UPP_AIS_TP_CD=" + strAISTPCD;
		}
		if (strAREA != "") {
			strURLAP = strURLAP + "&CNP_CD=" + strAREA;
		}
		if (strSTAT != "") {
			strURLAP = strURLAP + "&PAN_SS=" + encodeURI(strSTAT);
		}
		$.ajax({
			url : strURL + strURLAP,
			contentType : "application/json; charset=UTF-8",
			type : "post",
			dataType : "jsonp",
			jsonpCallback : "callBack",
			crossDomain : true,
			success : function(data) {
				$("#list").html("");
				var errCode = data[1].resHeader[0].SS_CODE;
				if (errCode != "Y") {
					if (errCode == "L") {
						alert("유효하지 않은 키값입니다. 키값을 확인하시기 바랍니다.");
					} else {
						alert("서비스 호출에 실패하였습니다.");
					}
				} else {
					if (data != null) {
						makeListJson(data);
					}
				}
			},
			error : function(xhr, status, error) {
				alert(xhr);
				alert(status);
				alert(error);
				alert("에러발생");
			}
		})
	}
	function makeListJson(data) {
		var htmlStr = "";
		var data1 = "";
		data1 = "전체건수 :" + data[1].dsList[0].ALL_CNT;
		$("#data1").html(data1);

		$(data[1].dsList).each(function() {
			htmlStr += "<tr>";
			htmlStr += "<td>" + this.RNUM + "</td>";
			htmlStr += "<td>" + this.UPP_AIS_TP_NM + "</td>";
			htmlStr += "<td>" + this.AIS_TP_CD_NM + "</td>";
			htmlStr += "<td>" + this.PAN_NM + "</td>";
			htmlStr += "<td>" + this.CNP_CD_NM + "</td>";
			htmlStr += "<td>" + this.PAN_NT_ST_DT + "</td>";
			htmlStr += "<td>" + this.CLSG_DT + "</td>";
			htmlStr += "<td>" + this.PAN_SS + "</td>";
			htmlStr += "<td><a href="+this.DTL_URL+">" +this.DTL_URL + "</a></td>";
			htmlStr += "</tr>";
		});

		$("#list").html(htmlStr);

	}
</script>




<div class="content">
<h1>청약 공고 일정</h1>
	<div class="table-num" id="data1"></div>
	<div class="table-wrap">
		<table class="table-hori board cyTable">
			<caption>게시판</caption>
			<colgroup>
				<col style="width: 5%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: auto%" />
			</colgroup>
			<thead>
				<th scope="col">순번</th>
				<th scope="col">공고유형</th>
				<th scope="col">공고세부유형</th>
				<th scope="col">공고명</th>
				<th scope="col">지역</th>
				<th scope="col">공고게시일</th>
				<th scope="col">공고마감일</th>
				<th scope="col">현재공고상태</th>
				<th scope="col">공고상세URL</th>
			</thead>
			<tbody id=list>
			</tbody>
		</table>
	</div>
	<div class="search-wrap mt40">
	<form name="form" id="form" method="post">
		표시건수 : <input type="text" id="strSZ" name="strSZ" value="5" style="width:100px;" /> &nbsp;
		페이지    : <input type="text" id="strPAGE" name="strPAGE" value="1"  style="width:100px;" />&nbsp; 공고명 : 
		<input type="text" id="strTITLE" name="strTITLE" value=""  style="width:100px;"/>&nbsp; 공고유형 : 
			<input type="text" id="strAISTPCD" name="strAISTPCD" value="" style="width:200px;"/><br> 지역 : 
			<input type="text" id="strAREA" name="strAREA" value="" />&nbsp;공고상태 : 
			<input type="text" id="strSTAT" name="strSTAT" value="" /> 
			<input type="button" onClick="getAddr();" value="검색" />
	</form>
</div>
</div>





