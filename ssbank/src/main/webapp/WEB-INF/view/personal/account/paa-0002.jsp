<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>거래 내역 조회</h1>
	<div class="table-wrap" style="margin-bottom: 50px;">
		<form name="acInfoTable" method="POST">
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
		                <td>
		                		<span><input type="text" class="" id="date" name="startDate" value="" placeholder=""> ~ </span>
		                		<span><input type="text" class="" id="date" name="endDate" value="" placeholder=""></span>
		                </td>
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
		    <div class="btn-area">
			    <a href="#" id="lookupDetailConfirm" class="btn-type-blue1 big">조회</a>
			</div>
		
		
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
					<td id="productName">productName</td>
				</tr>
				<tr>
					<th>고객명</th>
					<td id="userName">${sessionScope.member.userName }</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td id="accountNo"></td>
				</tr>
				<tr>
					<th>계좌잔액(원)</th>
					<td id="balance"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td id="createDate"></td>
				</tr>
				<tr>
					<th>최종거래일</th>
					<td id="trDate"></td>
				</tr>
	        </tbody>
	    </table>
	    
	    <h2>거래내역</h2>
	    <c:if test="${dataCount!=0 }">
			<div class="page-nav">
				<ul>
					<li class="prev-page"><a href="#"></a></li>
					<li class="prev"><a href="#"></a></li>
					${paging}
					<li class="next"><a href="#"></a></li>
					<li class="next-page"><a href="#"></a></li>
				</ul>
			</div>
		</c:if>
	    <div class="table-wrap">
		    <table name="transactionList" class="table-hori">
		        <caption>거래내역</caption>
		        <colgroup>
		            <col style="width:auto"/>
		            <col style="width:15%"/>
		            <col style="width:15%"/>
		            <col style="width:15%"/>
		            <col style="width:15%"/>
		            <col style="width:155px;"/>
		        </colgroup>
		        <thead>
		            <th scope="col">거래일자</th>
		            <th scope="col">적요</th>
		            <th scope="col">출금(원)</th>
		            <th scope="col">입금(원)</th>
		            <th scope="col">잔액</th>
		            <th scope="col">내용</th>
		        </thead>
		        <tbody>

		        </tbody>
		        <tfoot>
		        
		        </tfoot>
		    </table>
		</div>
		<c:if test="${dataCount!=0 }">
			<div class="page-nav">
				<ul>
					<li class="prev-page"><a href="#"></a></li>
					<li class="prev"><a href="#"></a></li>
					${paging}
					<li class="next"><a href="#"></a></li>
					<li class="next-page"><a href="#"></a></li>
				</ul>
			</div>
		</c:if>
		</form>
	</div>
</div>

<script>

	$(function(){
		
		$("input[name=startDate]").val(new Date().getCurrentDate(1));
		$("input[name=endDate]").val(new Date().getCurrentDate(1));
		
		accDetailInit(${accountNo});
		
		$("#lookupDetailConfirm").on("click",function(event){
			event.preventDefault;
			
			console.log($("select[name=accountNo]").val());
			accDetailInit($("select[name=accountNo]").val());
			
			return false;
		});
	});

	function accDetailInit(selAcNo){
		
		var url = "<%=cp%>/personal/lookupAccount";
		var data = "memberIdx=${sessionScope.member.memberIdx}";
		
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
						
						if(account.ACCOUNTNO == selAcNo){
							loadAccDetail(account);
						}
						
						selAcc.append($opt);
						
					});
					
					var $tgAcc = $("select[name=accountNo]")
					if( ${accountNo == ""} ){
						$tgAcc.find('option:eq(0)').attr("selected", "selected");
					} else {
						$tgAcc.find('option[value='+selAcNo+']').attr("selected", "selected");
					}
					loadTrDetail();
				}
					
			},
			error	:	function(e){
				console.log(e.responseText);
			}
		})
	}
	
	function loadAccDetail(account){
		$("#productName").html(account.PRODUCTNAME);
		$("#accountNo").html(account.ACCOUNTNO);
		$("#balance").html(numberWithCommas(Math.floor(account.BALANCE)));
		$("#createDate").html(account.CREATEDATE);
		$("#trDate").html(account.TRDATE);	
	}
	
	function loadTrDetail(){
		
		var trTable = $("table[name=transactionList]");
		trTable.find("tbody").empty();
		
		var url = "<%=cp%>/transaction/transactionList";
		var query = $("form[name=acInfoTable]").serialize();
		
		$.ajax({
			url		: url,
			type		: "POST",
			data		: query,
			dataType	: "json",
			success	: function(data){
				if(data.transactionList == null || data.transactionList.length == 0){
					trTable.append("<tr><td colspan=6>거래 내역이 존재하지 않습니다.</td></tr>")
				} else {
					$.each(data.transactionList, function(index, item){
						var $tr = $("<tr>");
						
						$.each(item, function(key, value){
							
							var $td = $("<td>");
							if(key == "AMOUNT"){
								if(parseInt(value) < 0){
									$td = $("<td class='negative'>");
									$td.html(value);
									$tr.append($td);
									$td = $("<td>");
									$td.html("&nbsp;");
									$tr.append($td);
								} else if(parseInt(value) >= 0) {
									$td = $("<td>");
									$td.html("&nbsp;");
									$tr.append($td);
									$td = $("<td class='positive'>");
									$td.html(value);
									$tr.append($td);
								}
							} else {
								$td.html(value);
								$tr.append($td);
							}				
							
						});
						
						trTable.append($tr);
					});
				}
			},
			error	: function(e){
				console.log(e.responseText);
			}
		})
	};
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	};
	
	Date.prototype.getCurrentDate = function(mode) {
		var mm = this.getMonth() + 1; // getMonth() is zero-based
		var dd = this.getDate();
		
		var result;
		if(mode == 1)
			result = [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd].join('-');
		else if(mode == 2)
			result = [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd].join('-') +" "+
						[this.getHours(), this.getMinutes(), this.getSeconds()].join(':');
		return result;
	};
	
	
	
	

</script>