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
<<<<<<< HEAD
							<li class="active"><a href="<%=cp%>/calc/saving">적금</a></li>
							<li class=""><a href="<%=cp%>/calc/deposit">예금</a></li>
							<li class=""><a href="<%=cp%>/calc/loan">대출</a></li>
							<li class=""><a href="<%=cp%>/calc/exchange">환율</a></li>
						</ul>
					</div>
					<h2>적금 / 목돈모으기</h2>
					<span class="sub-text">기간과 월적립액, 이자율을 입력하시면 만기지급액이 계산됩니다.</span>
					<div class="cal-cont-area">
						<div class="cal-box box">
							<h3>계산정보</h3>
							<div class="table-wrap">
								<table class="table-verti">
									<caption>적금계산</caption>
									<colgroup>
										<col style="width:20%;"/>
										<col style="width:*;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">월적립액</th>
											<td scope="col"><input type="text" id="amountInput" placeholder="0"> <span class="bold">만원</span> <span class="sub">(1만원 이상 ~ 1,000만원 이하)</span><span class="input-num">일백만원</span></td>
										</tr>
										<tr>
											<th>적립기간</th>
											<td><input type="text" id="termInput" placeholder="0"> <span class="bold">개월</span> <span class="sub">(12개월 이상 ~ 360개월 이하)</span></td>
										</tr>
										<tr>
											<th>이자율</th>
											<td><input type="text" id="rateInput" placeholder="0"> <span class="bold">%</span> <span class="sub">(최대 10.0%)</span></td>
										</tr>
										<tr>
											<th>이자계산법</th>
											<td>
												<div class="item-radio">
													<input type="radio" id="calcu-01-1" name="radioInput" value="1" checked>
													<label for="calcu-01-1">일반</label>
												</div>
												<div class="item-select">
													<select name="rateType" id="rateType">
														<option value="1">단리</option>
=======
							<li class="active"><a href="cal-0001.html">적금</a></li>
							<li class=""><a href="cal-0002.html">예금</a></li>
							<li class=""><a href="cal-0003.html">대출</a></li>
							<li class=""><a href="cal-0004.html">환율</a></li>
							<li class=""><a href="cal-0005.html">날짜</a></li>
						</ul>
					</div>
					<h2>적금 / 목돈모으기</h2>
					<span class="sub-text">기간과 월적립액, 이자율을 입력하시면 만기지급액이 계산됩니다.</span>
					<div class="cal-cont-area">
						<div class="cal-box box">
							<h3>계산정보</h3>
							<div class="table-wrap">
								<table class="table-verti">
									<caption>적금계산</caption>
									<colgroup>
										<col style="width:20%;"/>
										<col style="width:*;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">월적립액</th>
											<td scope="col"><input type="text" id="amountInput" placeholder="0"> <span class="bold">만원</span> <span class="sub">(1만원 이상 ~ 1,000만원 이하)</span><span class="input-num">일백만원</span></td>
										</tr>
										<tr>
											<th>적립기간</th>
											<td><input type="text" id="termInput" placeholder="0"> <span class="bold">개월</span> <span class="sub">(12개월 이상 ~ 360개월 이하)</span></td>
										</tr>
										<tr>
											<th>이자율</th>
											<td><input type="text" id="rateInput" placeholder="0"> <span class="bold">%</span> <span class="sub">(최대 10.0%)</span></td>
										</tr>
										<tr>
											<th>이자계산법</th>
											<td>
												<div class="item-radio">
													<input type="radio" id="calcu-01-1" name="radioInput" value="1" checked>
													<label for="calcu-01-1">일반</label>
												</div>
												<div class="item-radio">
													<input type="radio" id="calcu-01-2" name="radioInput" value="2">
													<label for="calcu-01-2">법인</label>
												</div>
												<div class="item-radio">
													<input type="radio" id="calcu-01-3" name="radioInput" value="3">
													<label for="calcu-01-3">비과세</label>
												</div>
												<div class="item-select">
													<select name="rateType" id="rateType">
														<option value="1">단리</option>
														<option value="2">월복리</option>
>>>>>>> branch 'master' of https://github.com/J1STAR/ssbank.git
													</select>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-area">
								<a href="#" class="btn-type-gray1 medium" id="btnReset">다시하기</a>
								<a href="#" class="btn-type-blue1 medium" id="btnCal-01">계산하기</a>
							</div>
						</div>
						<div class="result-box box">
							<h3>계산결과</h3>
							<div class="table-wrap">
								<table class="table-hori">
									<caption>적금계산결과</caption>
									<colgroup>
										<col style="width: 20%;"/>
										<col style="width: 15%;"/>
										<col style="width: 10%;"/>
										<col style="width: auto;"/>
										<col style="width: 20%;"/>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">월적립액</th>
											<th scope="col">계약기간</th>
											<th scope="col">이율</th>
											<th scope="col">만기지급액</th>
											<th scope="col">세후이자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="resultAmount">-</td>
											<td class="resultTerm">-</td>
											<td class="resultRate">-</td>
											<td class="resultTotal point">-</td>
											<td class="resultRateAmount">-</td>
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