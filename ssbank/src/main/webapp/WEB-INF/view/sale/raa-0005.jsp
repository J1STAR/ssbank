<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<h1>매물올리기</h1>
	<div class="table-wrap">
	
	<form name="saleForm" method="post">
		<table class="table-verti salesTable">
			<caption>매물올리기</caption>
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: *;" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">매물유형&ast;</th>
					<td scope="col">
						<div class="item-radio">
							<input type="radio" id="raa0001-01" name="categoryIdx" value="1"
								checked="checked"> <label for="raa0001-01">아파트</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="raa0001-02" name="categoryIdx" value="2">
							<label for="raa0001-02">단독/다가구</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="raa0001-03" name="categoryIdx" value="3">
							<label for="raa0001-03">오피스텔</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>거래형태&ast;</th>
					<td>
						<div class="item-radio">
							<input type="radio" id="raa0001-05" name="typeIdx" value="1"
								checked="checked"> <label for="raa0001-05">매매</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="raa0001-06" name="typeIdx" value="2"> <label
								for="raa0001-06">전세</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="raa0001-07" name="typeIdx" value="3"> <label
								for="raa0001-07">월세</label>
						</div>
					</td>
				</tr>

				<tr>
					<th>지역&ast;</th>
					<td><input type="text" id="zip" name="zipCode" class=""
						style="width: 80px;" maxlength="5" readonly> <a href="#"
						id="btnPostCode" class="btn-type-gray medium"
						onclick="daumPostcode();">주소찾기</a><br> <input type="text"
						id="addr1" name="addr1" class=""
						style="width: 100%; margin-top: 8px;"> <input type="text"
						id="addr2" name="addr2" class=""
						style="width: 100%; margin-top: 8px;"></td>
				</tr>
				<tr id="djarea">
					<th>대지면적</th>
					<td><input type="text" class="calc_ed" name="area">&nbsp;평&nbsp;/&nbsp;<input
						type="text" class="calc_ed" name="va2" readonly>&nbsp;m&sup2;&nbsp;<br>
						<span><em>&ofcir;면적은 단지선택 후 자동 입력됩니다.</em></span></td>
				</tr>
				<tr>
					<th>연면적</th>
					<td><input type="text" class="calc_ed" name="totalArea">&nbsp;평&nbsp;/&nbsp;<input
						type="text" class="calc_ed" name="va1" readonly>&nbsp;m&sup2;&nbsp;<br>
						<span><em>&ofcir;면적은 단지선택 후 자동 입력됩니다.</em></span></td>
				</tr>
				<tr>
					<th>해당 동/호수&ast;</th>
					<td><input type="text" class="calc_ed" name="dong">&nbsp;동&nbsp;/&nbsp;<input
						type="text" class="calc_ed" name="ho">&nbsp;호&nbsp;<br>
					</td>
				</tr>
				<tr>
					<th>해당 층/총층&ast;</th>
					<td><input type="text" class="calc_ed" name="layer">&nbsp;층&nbsp;/&nbsp;<input
						type="text" class="calc_ed" name="tLayer">&nbsp;층&nbsp;<br>
					</td>
				</tr>
				<tr>
					<th>희망 매매가&ast;</th>
					<td><input type="text" name="minAmount" placeholder="최소">&nbsp;만원&nbsp;/&nbsp;<input
						type="text" class="calc_ed" name="maxAmount" placeholder="최대">&nbsp;만원&nbsp;<br>
					</td>
				</tr>
				<tr id="categoryTr">
					<th scope="col">유형&ast;</th>
					<td scope="col">
						<div class="item-radio">
							<input type="radio" id="8" name="type" checked="checked" value="거주용">
							<label for="8">거주용</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="9" name="type" value="업무용"> <label for="9">업무용</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="10" name="type" value="거주/업무겸용"> <label
								for="10">거주/업무겸용</label>
						</div>
					</td>
				</tr>
				<tr id="category2Tr">
					<th scope="col">유형&ast;</th>
					<td scope="col">
						<div class="item-radio">
							<input type="radio" id="11" name="type" checked="checked" value="단독">
							<label for="11">단독</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="12" name="type" value="다가구"> <label for="12">다가구</label>
						</div>
					</td>
				</tr>
				<tr id="roomTr">
					<th>방수&ast;</th>
					<td><input type="text" name="room">&nbsp;개</td>
				</tr>
				<tr>
					<th>물건특징</th>
					<td>
						<div class="item-select">
							<select name="status" id="">
								<option value="선택해주세요">선택해주세요</option>
								<option value="교육환경 좋은아파트">교육환경 좋은아파트</option>
								<option value="로얄동,로얄층 아파트">로얄동,로얄층 아파트</option>
								<option value="조망권 좋은 아파트">조망권 좋은 아파트</option>
								<option value="시세보다 저렴한 아파트">시세보다 저렴한 아파트</option>
								<option value="깨끗하게 수리된 아파트">깨끗하게 수리된 아파트</option>
								<option value="입주3년 미만 아파트">입주3년 미만 아파트</option>
								<option value="전세끼고 살 수 있는 아파트">전세끼고 살 수 있는 아파트</option>
								<option value="지하철역과 가까운 아파트">지하철역과 가까운 아파트</option>
								<option value="브랜드 좋은 아파트">브랜드 좋은 아파트</option>
								<option value="교통이 편리한 아파트">교통이 편리한 아파트</option>
								<option value="기타사유">기타사유</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>거래희망일&ast;</th>
					<td><input type="text" class="" id="date" name="tradeDate"><br>
						<div class="item-checkbox saledate2">
							<input type="checkbox" id="raa-0008"> <label
								for="mbj0002-03" class="saledate">빠르면 빠를수록 좋음</label>
						</div></td>
				</tr>
			</tbody>
		</table>
</form>		
		
	</div>
</div>
<div class="btn-area">
	<a href="javascript:history.back()" class="btn-type-gray1 big">취소</a> 
	<a href="#" class="btn-type-blue1 big" onclick=saleupload();>올리기</a>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>



/* DatePicker를 통한 날짜 입력 */
$(function(){
	
	$("#date").datepicker({
		showOn:"button"
		,buttonImage:"<%=cp %>/resource/images/ico_calendar.png"
		,buttonImageOnly:true
	});
	
	$(".ui-datepicker-trigger").css({
		position:"absolute", width:"32px", height:"32px"
	});
	
});

/* 다음 주소 api */
function daumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
						: '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('addr1').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('addr2').focus();
		}
	}).open();
}

$(function(){
	changeCategory();
	
	$("input[name=categoryIdx]").change(function(){
		changeCategory();
	});
	
	
	function changeCategory() {
		var category = $("input[name=categoryIdx]:checked").val();
		if (category == 1){
			$("#categoryTr").addClass("hide");
			$("#category2Tr").addClass("hide");
			$("#djarea").addClass("hide");
		} else if (category == 2){
			$("#category2Tr").removeClass("hide");
			$("#categoryTr").addClass("hide");
			$("#djarea").removeClass("hide");
			
			
		} else if (category == 3){
			$("#djarea").addClass("hide");
			$("#categoryTr").removeClass("hide");
			$("#category2Tr").addClass("hide");
			
			
		}
	}
});

$('input:text[name=totalArea]').keyup(function() {
    var vp1 = parseInt($(this).val());
    if(vp1 > 0) {
        var va1 = Math.round(vp1 * 3.3058);
        $('input:text[name=va1]').attr('value', va1);
    }
});

$('input:text[name=area]').keyup(function() {
    var vp2 = parseInt($(this).val());
    if(vp2 > 0) {
        var va2 = Math.round(vp2 * 3.3058);
        $('input:text[name=va2]').attr('value', va2);
    }
});

function saleupload() {
	var f=document.saleForm;
	var category = $("input[name=categoryIdx]:checked").val();

	var str=f.categoryIdx.value;
	if(!str){
		alert("거래유형을 선택하세요");
		f.categoryIdx.focus();
		return;
	}
/* 	var str= $("input[name=minAmount]").val();
	if(!str){
		alert("거래유형을 선택하세요");
		$("input[name=minAmount]").focus();
		return;
	} */
	var str=f.addr1.value;
	if(!str){
		alert("기본주소를 선택하세요");
		f.addr1.focus();
		return;
	}
	var str=f.addr2.value;
	if(!str){
		alert("상세주소를 입력하세요");
		f.addr2.focus();
		return;
	}
	var str=f.dong.value;
	if(!str){
		alert("동을 입력하세요");
		f.dong.focus();
		return;
	}
	var str=f.ho.value;	
	if(!str){
		alert("호를 입력하세요");
		f.ho.focus();
		return;
	}
	var str=f.layer.value;	
	if(!str){
		alert("층을 입력하세요");
		f.layer.focus();
		return;
	}
	var str=f.tLayer.value;	
	if(!str){
		alert("총층을 입력하세요");
		f.tLayer.focus();
		return;
	}
	var str=f.minAmount.value;	
	if(!str){
		alert("최소금액 입력하세요");
		f.tLayer.focus();
		return;
	}
	var str=f.maxAmount.value;	
	if(!str){
		alert("최대금액 입력하세요");
		f.tLayer.focus();
		return;
	}
	var str=f.room.value;	
	if(!str){
		alert("방수를 입력하세요");
		f.room.focus();
		return;
	}
	if (category == 1){

	} else if(category == 2 || category ==3){
		var str=f.area.value;
		if(!str){
			alert("대지면적을 입력하세요");
			f.area.focus();
			return;
		}
	}
	f.action="<%=cp%>/sale/created";
	f.submit();
}

</script>