<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
		$(function(){
			
			$(".ui-datepicker-trigger").css({
				position:"absolute", width:"30px", height:"60px"
			});
			
		});
	</script>
<div class="content">


			<!-- jsp body 영역 -->
			<div class="page-con">
				<h1>금융계산기</h1>
				<div class="cal-cont-wrap">
					<div class="tab-wrap blue item5">
						<ul>
							<li class=""><a href="<%=cp%>/calc/saving">적금</a></li>
							<li class=""><a href="<%=cp%>/calc/depositl">예금</a></li>
							<li class=""><a href="<%=cp%>/calc/loan">대출</a></li>
							<li class="active"><a href="<%=cp%>/calc/exchange">환율</a></li>
						</ul>
					</div>
					<h2>환율</h2>
					<span class="sub-text">원화를 외국화폐로 또는 외국화폐를 원화로 환산한 금액이 계산됩니다.</span>
					<div class="cal-cont-area">
						<div class="cal-box box date-box">
							<div id="datepicker">
								<iframe src="http://fx.kebhana.com/fxportal/jsp/RS/DEPLOY_EXRATE/fxrate_B_v2.html"></iframe>					
							</div>
							<div class="table-wrap">
								<table class="table-verti">
									<caption>환율계산</caption>
									<colgroup>
										<col style="width:20%;"/>
										<col style="width:30%;"/>
										<col style="width:15%;"/>
										<col style="width:*;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">구입/판매</th>
											<td scope="col" colspan="3">
												<div class="item-radio">
													<input type="radio" id="cal-51" name="calcu-05" checked>
													<label for="cal-51">외화 사실때</label>
												</div>
												<div class="item-radio">
													<input type="radio" id="cal-52" name="calcu-05">
													<label for="cal-52">외화 파실때</label>
												</div>
											</td>
										</tr>
										<tr>
											<th>구입통화</th>
											<td>
												<div class="item-select">
													<select title="보유통화 선택목록" name="nation">
														<option value="1">미국 USD</option>
														<option value="2" selected>일본 JPY</option>
														<option value="3">유럽공동체 EUR</option>
														<option value="4">영국 GBP</option>
														<option value="5">캐나다 CAD</option>
														<option value="6">스위스 CHF</option>
														<option value="7">홍콩 HKD</option>
														<option value="8">스웨덴 SEK</option>
														<option value="9">오스트레일 AUD</option>
														<option value="10">덴마크 DKK</option>
														<option value="11">노르웨이 NOK</option>
														<option value="12">사우디아라 SAR</option>
														<option value="13">쿠웨이트 KWD</option>
														<option value="14">바레인 BHD</option>
														<option value="15">아랍에미레 AED</option>
														<option value="16">싱가포르 SGD</option>
														<option value="17">말레이지아 MYR</option>
														<option value="18">뉴질랜드 NZD</option>
														<option value="19">중국 CNY</option>
														<option value="20">인도네시아 IDR</option>
														<option value="21">태국 THB</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>구입금액</th>
											<td>
												<input type="text" id="change" class="" placeholder="0"> 
											</td>
										</tr>
										<tr>
											<th><a class="btn-type-blue1 medium" id="btnCal-04">계산하기</a></th>
											<td class="point" id="exMon"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>