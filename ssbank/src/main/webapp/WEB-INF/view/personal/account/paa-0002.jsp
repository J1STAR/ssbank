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
		                		<div><p>시작일 </p><input type="text" class="hasDatePicker" name="startDate" value="" placeholder=""></div>
		                		<div><p>&nbsp;</p></div>
		                		<div><p>종료일 </p><input type="text" class="hasDatePicker" name="endDate" value="" placeholder=""></div>
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
		    
		    <div id="trTable-Container">
			    	
		    </div>
		</form>
	</div>
</div>

<script>
	
	$(document).on('click', '.page-nav a',function(e){

		e.preventDefault();
	
		var urlArr = $(this).attr("href").split("page=");
		loadTrDetail(urlArr[1]);
		
		return false;

	});
	
	$(window).load(function(){
		
		var startDate = new Date();
		startDate.setDate(startDate.getDate()-30);
		var endDate = new Date();
		$("input[name=startDate]").val(startDate.getCurrentDate(1));
		$("input[name=endDate]").val(endDate.getCurrentDate(1));
		
		accDetailInit(${accountNo});
		
		$("#lookupDetailConfirm").on("click",function(event){
			event.preventDefault();
			
			accDetailInit($("select[name=accountNo]").val());

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
						if(account.STATUS == 0){
							$opt.html("[만기 계좌]" + account.ACCOUNTNO);
							$opt.css("color", "red");
						} else {
							$opt.html(account.ACCOUNTNO);
						}
							
						
						
						if(account.ACCOUNTNO == selAcNo){
							loadAccDetail(account);
						}
						
						selAcc.append($opt);
						
					});
					
					var $tgAcc = $("select[name=accountNo]")
					if( selAcNo == "" ){
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
	
	function loadTrDetail(page){
		
		var url = "<%=cp%>/transaction/transactionList";
		var query = $("form[name=acInfoTable]").serialize();
		
		if(page != null){
			query += "&page="+page;
		}
		
		$.ajax({
			url		: url,
			type		: "POST",
			data		: query,
			success	: function(data){
				
				$("#trTable-Container").html(data);
				
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