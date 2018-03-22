<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>계좌 조회</h1>

	<div class="box-blue-area">
	    <dl>    
	        <dd>
	            <ul id="account-info">
	                <li>출금계좌번호</li>
	                <li>최종거래일시</li>
	                <li>최종접속일자&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.member.lastLogin }</li>
	            </ul>
	        </dd>
	    </dl>
	</div>
	
	<div class="tab-wrap blue item3 mt20">
		<ul>
			<li data-productType="1" class="productTab1 active"><a href="#">예금계좌</a></li>
			<li data-productType="2" class="productTab2"><a href="#">적금계좌</a></li>
			<li data-productType="3" class="productTab3"><a href="#">대출계좌</a></li>
		</ul>
		<div class="tab_container mt20">
			<div id="tab1" class="tab_content">
				
				<div class="table-wrap">
				    <table class="table-hori">
				        <caption>입/출금계좌</caption>
				        <colgroup>
				            <col style="width:auto"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:155px;"/>
				        </colgroup>
				        <thead>
				            <th scope="col">계좌명</th>
				            <th scope="col">계좌번호</th>
				            <th scope="col">신규일</th>
				            <th scope="col">최근거래일</th>
				            <th scope="col">잔액(원)</th>
				            <th scope="col">업무</th>
				        </thead>
				        <tbody>
				            
				        </tbody>
				        <tfoot>
				            <th colspan="4">입/출금계좌 총잔액</th>
				            <td id="totalBalance" colspan="2"></td>
				        </tfoot>
				        
				    </table>
				</div>
			</div>
			<div id="tab2" class="tab_content">
				
			</div>
			<div id="tab3" class="tab_content">
				
			</div>
		</div>
	</div>
</div>

<script>
	$(window).load(function(){
		
		lookupAccount(1);
		
		$("li[class^=productTab]").click(function(){
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
			
			lookupAccount($(this).data("producttype"));
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
	function lookupAccount(productIdx){

		$("tbody").empty();
		$("#totalBalance").empty();
		
		var url = "<%=cp %>/personal/lookupAccount";
		var query = {"memberIdx":"${sessionScope.member.memberIdx}", "productIdx":productIdx}; 
			/* "memberIdx=${sessionScope.member.memberIdx}&productIdx="+prIdx; */
		
		$.ajax({
			url		:	url,
			type		:	"POST",
			data		:	query,
			dataType	:	"json",
			success	:	function(data){
				
				if(data.listAccount == null){
					var $tr = $("<tr>");
					var $td = $("<td class='noAcInfo'>");

					$td.prop("colspan", "6").html("계좌가 존재하지 않습니다.");
					$tr.append($td);
					$("tbody").append($tr);
					$("#totalBalance").html("0 원");
				} else {
					var totalBalance = 0;
					$.each(data.listAccount, function(index, account){
						var $tr = $("<tr>");
						
						var $td = $("<td class='acInfo'>");
						$td.html(account.PRODUCTNAME);
						$tr.append($td);
						
						$td = $("<td class='acInfo'>");
						$td.html(account.ACCOUNTNO);
						$tr.append($td);
						
						$td = $("<td class='acInfo'>");
						$td.html(account.CREATEDATE);
						$tr.append($td);
						
						$td = $("<td class='acInfo'>");
						$td.html(account.TRDATE);
						$tr.append($td);
						
						$td = $("<td class='acInfo'>");
						var balance = account.BALANCE;
						if(balance == null)
							balance = 0;
						totalBalance += balance;
						$td.html(numberWithCommas(Math.floor(balance)));
						$tr.append($td);
						
						$td = $("<td class='acInfo'>");
						$td.html("<a href='<%=cp%>/personal/lookupDetailAccount?accountNo=\""+account.ACCOUNTNO+"\"' class='btn-type-gray medium'>조회</a>"+
								"<a href='<%=cp%>/personal/transaction?accountNo=\""+account.ACCOUNTNO+"\"' class='btn-type-blue1 medium'>이체</a>");
						$tr.append($td);

						$("tbody").append($tr);
					});
					$("#totalBalance").html(numberWithCommas(Math.floor(totalBalance)) + " 원");
				}
			},
			error	: 	function(e){
				console.log(e.responseText);
			}
			
		});
	}
</script>