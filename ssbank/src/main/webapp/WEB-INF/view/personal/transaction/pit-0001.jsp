<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>당행 / 타행이체</h1>
	
	<h2>출금 정보</h2>
	<div class="table-wrap">
		<form name="transactionTable" method="POST">
		    <table class="table-verti">
		        <caption>출금 정보</caption>
		        <colgroup>
		            <col style="width:20%;"/>
		            <col style="width:*;"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="col">출금계좌번호</th>
		                <td scope="col">
							<div class="item-select accNo">
		                        <select name="accountNo" id="">
		                            <option>선택</option>
		                        </select>
		                    </div>
		                    <span id="currBalance">
		                    
		                    </span>
		                    <input type="hidden" name="balance" value="">
						</td>
						
		            </tr>
		            <tr>
		                <th>계좌비밀번호</th>
		                <td>
			                <input type="password" name="accountPwd" class="">
		                </td>
		                
		            </tr>
		        </tbody>
		    </table>
		    
		    <h2>입금정보</h2>
		    <table class="table-verti">
		        <caption>입금 정보</caption>
		        <colgroup>
		            <col style="width:20%;"/>
		            <col style="width:*;"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="col">입금은행</th>
		                <td scope="col">
							<div class="item-select">
		                        <select name="branch" id="branch">
		                            <option value="1">쌍용</option>
		                        </select>
		                    </div>
						</td>
		            </tr>
		            <tr>
		                <th>입금계좌번호</th>
		                <td><input type="text" name="accountNo2" class=""></td>
		            </tr>
		            <tr>
		                <th>이체금액</th>
		                <td><input type="text" name="amount" class=""></td>
		            </tr>
		            <tr>
		                <th>내통장 메모</th>
		                <td><input type="text" name="content" class=""></td>
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
	$(function(){
		
		/* 이체 페이지 초기화 */
		transactionInit();
		
		/* 이체 */
		$("#transactionConfirm").click(function(event){
			event.preventDefault();
			
			transactionSubmit();
			
		});
		
		/* 잔액 */
		$("select[name=accountNo]").on("change", function(){
			var element = $(this).find('option:selected'); 
	        var balanceTag = element.attr("data-balance"); 
	
	        $("input[name=balance]").val(balanceTag);
	        $("#currBalance").html("출금 가능액 : " + numberWithCommas(balanceTag));
		});
		
	});
	
	function transactionInit(){
		
		$("input[name=accountPwd]").val("");
		$("input[name=accountNo2]").val("");
		$("input[name=amount]").val("");
		$("input[name=content]").val("");
		
		var url = "<%=cp%>/personal/lookupAccount";
		var data = "memberIdx=${sessionScope.member.memberIdx}&productIdx=1";
		
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
						
						var $opt = $("<option data-balance="+Math.floor(account.BALANCE)+">");	
						
						$opt.val(account.ACCOUNTNO);
						$opt.html(account.ACCOUNTNO);
						
						selAcc.append($opt);
						
					});
					
					var $tgAcc = $("select[name=accountNo]")
					if( ${accountNo == null} ){
						$tgAcc.find('option:eq(0)').attr("selected", "selected");
					} else {
						$tgAcc.find('option[value=${accountNo}]').attr("selected", "selected");
					}
					$("#currBalance").html("출금 가능액 : " + numberWithCommas($tgAcc.find("option:selected").attr("data-balance")));
					$("input[name=balance]").val($tgAcc.find("option:selected").attr("data-balance"));
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

	function pwdCheck() {
		var url = "<%= cp%>/personal/pwdCheck";
		var data = $("form[name=transactionTable]").serialize();
		
		var result;
		$.ajax({
			url		: url,
			type		: "POST",
			data		: data,
			dataType	: "json",
			async: false,
			success	: function(data){
				if(data.result == 0){
					result = false;
				} else {
					result = true;
				}
			},
			error	: function(e){
				console.log("err");
			}
		});

		return result;
	}
	
	function transactionSubmit(){
		allInputTrim();
		
		var url = "<%=cp%>/transaction/transactionSubmit";
		var trQuery = $("form[name=transactionTable]").serialize();

		if(pwdCheck() == true){
			$.ajax({
				url		: url,
				type		: "POST",
				data		: trQuery,
				dataType	: "json",
				async	: false,
				success	: function(data){
					
					transactionResult(data.result);
					
				},
				error	: function(e){
					console.log("err");
				}
			});
			
		} else {
			transactionResult(0);
		}
		
	}
	
	function transactionResult(result){
		
		var f = document.transactionTable;
		f.action = "<%=cp%>/personal/transaction-"+ result;
		f.submit();
	}
</script>