<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">


			<!-- jsp body 영역 -->
			<div class="page-con">
				<h1>금융계산기</h1>
				<div class="cal-cont-wrap">
					<div class="tab-wrap blue item5">
						<ul>
							<li class=""><a href="<%=cp%>/calc/saving">적금</a></li>
							<li class=""><a href="<%=cp%>/calc/deposit">예금</a></li>
							<li class="active"><a href="<%=cp%>/calc/loan">대출</a></li>
							<li class=""><a href="<%=cp%>/calc/exchange">환율</a></li>
						</ul>
					</div>
					<h2>대출</h2>
					<span class="sub-text">대출을 받기 전에 매월 납입 금액(이자와 원금상환액)은 얼마나 되고 총 납입이자금액은 얼마인지 등을 알아볼 수 있는 계산기 입니다. </span>
					<div class="cal-cont-area">
						<div class="cal-box box">
							<h3>계산정보</h3>
							<div class="table-wrap">
								<table class="table-verti">
									<caption>예금계산</caption>
									<colgroup>
										<col style="width:20%;"/>
										<col style="width:*;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">대출금액</th>
											<td scope="col"><input type="text" id="money" class="" placeholder="0"> <span class="bold">만원</span> <span class="sub">(1만원 이상 ~ 100,000만원 이하)</span><span class="input-num">일백만원</span></td>
										</tr>
										<tr>
											<th>대출기간</th>
											<td><input type="text"  id="period" class="" placeholder="0"> <span class="bold">개월</span> <span class="sub">(12개월 이상 ~ 420개월 이하)</span></td>
										</tr>
										<tr>
											<th>대출금리</th>
											<td><input type="text" id="rate" class="" placeholder="0"> <span class="bold">%</span> <span class="sub">(최대 25.0%)</span></td>
										</tr>
										<tr>
											<th>거치기간</th>
											<td><input type="text" id="period2" class="" placeholder="0"> <span class="bold">%</span> <span class="sub">(0개월 이상 ~ 36개월 이하)</span></td>
										</tr>
										<tr>
											<th>상환방법</th>
											<td>
											<div class="item-select">
													<select name="rateType" id="rateType">
														<option value="1">일시 만기 상환</option>
														<option value="2">원리금 균등분할 상환</option>
														<option value="3">원금 균등분할 상환</option>
													</select>
											</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-area">
								<a href="#" class="btn-type-gray1 medium" id="btnReset">다시하기</a>
								<a href="#" class="btn-type-blue1 medium" id="btnCal-03">계산하기</a>
							</div>
						</div>
						<div class="result-box box">
							<h3>계산결과</h3>
								<p id="method" class="mj">-<p>
								<span class="sub-text" id="content">-</span>
							<div class="table-wrap">
								<table class="table-verti">
									<caption>대출계산결과</caption>
									<colgroup>
										<col style="width: 20%;"/>
										<col style="width: 30%;"/>
										<col style="width: 20%;"/>
										<col style="width: 30%;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">대출금액</th>
											<td scope="col" id="r1">-</td>
											<th scope="col">대출이자합계</th>
											<td scope="col" id="r2">-</td>
										</tr>
										<tr>
											<th id="r3">-</th>
											<td id="r4">-</td>
											<th id="r5">-</th>
											<td id="r6">-</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="calcurator-wrap">
					<div class="table-wrap">
						<table class="calcurator">
							<caption>계산기</caption>
							<colgroup>
								<col style="width:25%"/>
								<col style="width:25%"/>
								<col style="width:25%"/>
								<col style="width:25%;"/>
							</colgroup>
							<thead>
								<tr>
									<td colspan="4">
										<span class="show-all"></span>
										<input type="text" placeholder="0" id="cal-input">
										<input type="hidden" id="cal-hidden">
										<input type="hidden" id="oper-hidden">
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="col" class="clear"><button type="button" value="AC" class="clear">AC</button></td>
									<td scope="col"><button type="button" value="" class="plusMinus">±</button></td>
									<td scope="col"><button type="button" value="%" class="percent">%</button></td>
									<th scope="col"><button type="button" value="/" class="oper">÷</button></th>
								</tr>
								<tr>
									<td><button type="button" value="7">7</button></td>
									<td><button type="button" value="8">8</button></td>
									<td><button type="button" value="9">9</button></td>
									<th><button type="button" value="*" class="oper">×</button></th>
								</tr>
								<tr>
									<td><button type="button" value="4">4</button></td>
									<td><button type="button" value="5">5</button></td>
									<td><button type="button" value="6">6</button></td>
									<th><button type="button" value="-" class="oper">−</button></th>
								</tr>
								<tr>
									<td><button type="button" value="1">1</button></td>
									<td><button type="button" value="2">2</button></td>
									<td><button type="button" value="3">3</button></td>
									<th><button type="button" value="+" class="oper">+</button></th>
								</tr>
								<tr>
									<td colspan="2" class="zero"><button type="button" value="0">0</button></td>
									<td><button type="button" value="." class="period">.</button></td>
									<th><button type="button" value="=" class="return">=</button></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- //jsp body 영역 -->


		</div>