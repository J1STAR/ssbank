<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<form name="form" id="form" method="post">
		표시건수: <input type="text" id="strSZ" name="strSZ" value="20" /> 
		페이지: <input type="text" id="strPAGE" name="strPAGE" value="1" /> 
		공고명: <input type="text" id="strTITLE" name="strTITLE" value="" /> 
		공고유형: <input type="text" id="strAISTPCD" name="strAISTPCD" value="" /> 
		지역: <input type="text" id="strAREA" name="strAREA" value="" /> 
		공고상태: <input type="text" id="strSTAT" name="strSTAT" value="" /> 
			<input type="button" onClick="getTest();" value="ㄴㅁㄹㅇㅇㅁㄴㄻ" />
		<div id="list"></div>
	</form>

</div>


<script type="text/javascript">
	function getTest() {
		var strURL;
		strURL = "http://apply.lh.or.kr/RCMC_LCC_SIL_SILSNOT_L0001.jsp?";
		var strURLAP;
		strURLAP = "";
		var apiKey;
		apiKey = "ACu5ei6AqqFYchqyzwcCCYR6hVEkIJ8oMBooyzJ0mFE";
		var strSZ = document.getElementById("strSZ").value;
		var strPAGE = document.getElementById("strPAGE").value;
		var strTITLE = document.getElementById("strTITLE").value;
		var strAREA = document.getElementById("strAREA").value;
		var strSTAT = document.getElementById("strSTAT").value;
		var strAISTPCD = document.getElementById("strAISTPCD").value;
		//strURLAP = strURLAP + "apiKey=" + apiKey;
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
					console.log(data)
					if (errCode == "L")
					{
						alert("유효하지 않은 키값입니다.");
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
				alert("");
			}
		})
	}
	function makeListJson(data) {
		var htmlStr = "";
		htmlStr += "<table>";
		htmlStr += "<tr><td> 전체건수 : " + data[1].dsList[0].ALL_CNT + "</tr>";
		htmlStr += "<tr>";
		htmlStr += "<td>순번</<td>";
		htmlStr += "<td>공고유형</<td>";
		htmlStr += "<td>공고세부유형</<td>";
		htmlStr += "<td>공고명</<td>";
		htmlStr += "<td>지역</<td>";
		htmlStr += "<td>공고게시일</<td>";
		htmlStr += "<td>공고마감일</<td>";
		htmlStr += "<td>현재공고상태</<td>";
		htmlStr += "<td>공고상세URL</<td>";
		htmlStr += "</tr>";
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
			htmlStr += "<td>" + this.DTL_URL + "</td>";
			htmlStr += "</tr>";
		});
		htmlStr += "</table>";
		$("#list").html(htmlStr);
	}
</script>