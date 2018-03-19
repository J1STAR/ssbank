<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>거래 내역 조회</h1>
	<div class="table-wrap">
		<form name="transactionTable" method="POST">
		    <table class="table-verti">
		        <caption>거래 내역 조회</caption>
		        <colgroup>
		            <col style="width:20%;"/>
		            <col style="width:*;"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="col">조회계좌번호</th>
		                <td scope="col">
							<div class="item-select">
		                        <select name="accountNo" id="">
		                            <option>선택</option>
		                        </select>
		                    </div>
						</td>
		            </tr>
		            <tr>
		                <th>조회기간</th>
		                <td><input type="text" class="" id="date"> ~ <input type="text" class="" id="date"></td>
		            </tr>
		            <tr>
		                <th>조회내용</th>
		                <td>
		                		<div class="item-radio">
		                        <input type="radio" id="tradeType01" name="tType" value="1" checked="checked">
		                        <label for="tradeType01">전체내역</label>
		                    </div>
		                    <div class="item-radio">
		                        <input type="radio" id="tradeType02" name="tType" value="2">
		                        <label for="tradeType02">입금내역</label>
		                    </div>
		                    <div class="item-radio">
		                        <input type="radio" id="tradeType03" name="tType" value="3">
		                        <label for="tradeType03">출금내역</label>
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <th>조회결과순서</th>
		                <td>
		                		<div class="item-radio">
		                        <input type="radio" id="dateOrder01" name="dOrder" value="1" checked="checked">
		                        <label for="dateOrder01">최근거래순</label>
		                    </div>
		                    <div class="item-radio">
		                        <input type="radio" id="dateOrder02" name="dOrder" value="2">
		                        <label for="dateOrder02">과거거래순</label>
		                    </div>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <h2>계좌 정보</h2>
		    <table class="table-verti">
		        <caption>계좌 정보</caption>
		        <colgroup>
		            <col style="width:20%;"/>
		            <col style="width:*;"/>
		        </colgroup>
		        <tbody>
					<tr>
						<th>계좌명</th>
						<td></td>
					</tr>
					<tr>
						<th>고객명</th>
						<td></td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td></td>
					</tr>
					<tr>
						<th>계좌잔액(원)</th>
						<td></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td></td>
					</tr>
					<tr>
						<th>최종거래일</th>
						<td></td>
					</tr>
		        </tbody>
		    </table>
	    </form>
	    <div class="btn-area">
		    <a href="<%=cp %>/" class="btn-type-gray1 big">취소</a>
		    <a href="#" id="transactionConfirm" class="btn-type-blue1 big">확인</a>
		</div>
	</div>
</div>

<script>
	$(window).load(function(){
		
		acDetailInit(1);
	});
	
	function acDetailInit(prIdx){
		var url = "<%=cp%>/personal/lookupAccount";
		var data = "memberIdx=${sessionScope.member.memberIdx}&productIdx="+prIdx;
		
		$.ajax({
			url		:	url,
			type		:	"POST",
			data		:	data,
			dataType	:	"json",
			success	:	function(data){
				if(data.listAccount == null || data.listAccount.length == 0){
					
				} else {
					
					var selAcc = $("select[name=accountNo]");
					selAcc.empty();
					$.each(data.listAccount, function(index, account){
						
						var $opt = $("<option>");
						$opt.val(account.ACCOUNTNO);
						$opt.html(account.ACCOUNTNO);
						
						selAcc.append($opt);
						
					});
					
					
				}
					
			},
			error	:	function(e){
				console.log(e.responseText);
			}
		})
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>