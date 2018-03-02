<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>개인회원가입</h1>
	<div class="page-con">
		<div class="step-area">
			<ol>
				<li class="active">
					<span class="step-num">1</span>
					<span class="step-name">이용약관동의</span>
				</li>
				<li>
					<span class="step-num">2</span>
					<span class="step-name">정보입력</span>
				</li>
				<li>
					<span class="step-num">3</span>
					<span class="step-name">가입완료</span>
				</li>
			</ol>
		</div>
		<div class="info-area">
			<span class="info-area-tit">쌍용은행 홈페이지 회원 서비스 이용약관</span>
			<a id="memberServiceTerms" href="#" class="btn-type-gray medium fr">보기</a>
			<div class="box-agree">
				<ul>
					<li>
						<span class="box-agree-tit">홈페이지 회원 서비스 이용약관에 동의하십니까?</span>
						<div class="item-checkbox">
							<input type="checkbox" id="mbj0001-01">
							<label for="mbj0001-01">예, 동의합니다</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="info-area">
			<span class="info-area-tit">[필수] 개인정보 수집·이용 동의서</span>
			<a id="collectMemberInfoTerms" href="#" class="btn-type-gray medium fr">보기</a>
			<p class="info-area-sub">개인정보 수집·이용동의서를 확인하시고 개인정보 및 고유식별정보 수집·이용에 동의하셔야 합니다.</p>
			<div class="box-agree">
				<ul>
					<li>
						<span class="box-agree-tit">쌍용은행이 본인의 개인정보를 수집·이용하는 것에 동의합니다.</span>
						<div class="item-radio">
							<input type="radio" id="mbj0001-02" name="join01" value="false" checked>
							<label for="mbj0001-02">동의하지않음</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="mbj0001-03" name="join01" value="true">
							<label for="mbj0001-03">동의함</label>
						</div>
					</li>
					<li>
						<span class="box-agree-tit">쌍용은행이 본인의 고유식별정보를 수집·이용하는 것에 동의합니다.</span>
						<div class="item-radio">
							<input type="radio" id="mbj0001-04" name="join02" value="false" checked>
							<label for="mbj0001-04">동의하지않음</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="mbj0001-05" name="join02" value="true">
							<label for="mbj0001-05">동의함</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="btn-area">
			<a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			<a id="nextJoinPage" href="#" class="btn-type-blue1 big">확인</a>
		</div>
		<div class="box-gray-area">
			<dl>
				<dt>알아두세요</dt>
				<dd>
					<ul>
						<li>만 14세 미만의 고객은 회원가입시 ‘정보통신망 이용촉진 및 정보등에 관한 법률’ 및 “개인정보취급방침”에 따라 법정대리인의 정보활용 동의가 필요합니다.</li>
						<li>당행 영업점을 통한 보호자분의 홈페이지 회원 법정대리인 등록이 완료된 고객에 한하여 회원등록이 가능하므로 홈페이지 회원 정대리인 등록이 안된 고객님의 보호자분께서는 먼저 가까운 영업점을 방문해 주시기 바랍니다.</li>
						<li><em>구비서류 : 보호자(법정대리인) 실명확인 증표, 본인과 법정대리인의 관계입증 서류 (주민등록등본 혹은 가족관계증명서)</em></li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
	<!-- //jsp body 영역 -->

	

	<!-- 약관 동의 dialog -->
	<div id="dialog-termsConfirm" title="약관 동의" style="width: 50%; display: none;">
		<p>
			<span class="ui-icon ui-icon-circle-check"
				style="float: left; margin: 0 7px 50px 0;"></span> 모든 약관에 동의해야만 다음 페이지로 이동 가능합니다.
		</p>
	</div>
	
	<!-- 회원 서비스 이용약관 -->
	<div id="dialog-memberServiceTerms" title="회원 서비스 이용약관" style="display: none;">
		<p>
			<section class="terms">
				<h1>쌍용 온라인서비스 이용약관</h1>
				<article>
					<h2>제 1 조 적용범위</h2>
					<p class="sub_txt">이 약관은 주식회사 쌍용은행(이하 “은행”이라 한다)과 은행이 제공하는
						“쌍용온라인서비스”(이하 “서비스”라 한다)를 이용하는 이용자(이하 “이용자”라 한다) 사이의 서비스 이용에 관한
						모든사항을 정함을 목적으로 한다.</p>
					<h2>제 2 조 용어의 정의</h2>
					<p class="sub_txt">이 약관에서 사용하는 용어의 의미는 다음 각호와 같다.</p>
					<ul>
						<li class="dep1">1.“이체비밀번호”란 계좌이체시 이용자의 의사확인을 위해 이용되는 비밀번호이며,
							서비스 이용시 이용자가 직접 등록하는 비밀번호를 말한다.</li>
						<li class="dep1">2.“보안매체”란 은행이 서비스 계약시에 이용자에게 제공하는 거래안전을 위한
							장치로서, “전자금융거래기본 약관”에서 정한 접근매체 중에서 서비스 이용시 이용자 본인확인을 위해 사용되는 보안카드
							또는 OTP카드 (1회용비밀번호생성기) 등을 말한다.</li>
						<li class="dep1">3.“공인인증서”란 본인확인을 위해 공인인증기관으로부터 발급받는 전자적 정보를
							말한다.</li>
						<li class="dep1">4. “스마트기기”란 스마트폰, 태블릿 PC 등과 같이 유무선네트워크, 통신망
							등을 통해 은행이 제공하는 서비스를 접속하여 이용할 수 있는 기기를 말한다.</li>
						<li class="dep1">5.“이용자ID 및 이용자비밀번호”란 서비스 접속을 위한 이용자 식별 정보로서
							서비스 계약시 이용자가 신청 한다.</li>
						<li class="dep1">6. 기타 이 약관에서 사용하는 용어의 정의는 “전자금융거래기본약관”이 정하는
							바에 의한다.</li>
					</ul>
					<h2>제 3 조 전자적 장치</h2>
					<ul>
						<li class="dep1">① 이용자는 다음의 전자적 장치를 통하여 서비스를 이용할 수 있다.
							<ul>
								<li class="dep2">가.인터넷뱅킹 : 개인용컴퓨터(PC), 휴대폰, TV, 스마트기기 등</li>
								<li class="dep2">나.폰뱅킹 : 전화, 휴대폰 등</li>
							</ul>
						</li>
						<li class="dep1">② 이용자는 서비스 신청시 전자적 장치를 선택할 수 있으며, 서비스를 통해
							변경할 수 있다.</li>
					</ul>
					<h2>제 4 조 서비스 종류</h2>
					<p class="sub_txt">은행이 제공하는 서비스는 인터넷뱅킹, 폰뱅킹 등을 통한 각종조회, 자금이체,
						계좌신규 및 해지, 대출, 외환, 사고신고, 공과금납부 등의 서비스이며, 구체적인 서비스 내용은 전자적 장치를 통해
						게시한다.</p>
					<h2>제 5 조 계약의 성립</h2>
					<ul>
						<li class="dep1">① 계약은 이용자가 은행이 정한 “쌍용 전자금융서비스신청서”(이하 “신청서”라
							한다)를 작성하여 제출하고 은행이 이를 접수하여 승인함으로써 성립한다. 다만, 이용자가 인터넷뱅킹으로 공인인증서를
							이용하여 신청하는 경우 에는 다른 전자적 장치의 서비스를 가입할 수 있다</li>
						<li class="dep1">② 인터넷뱅킹 및 폰뱅킹의 각종 조회, 사고신고, 자동이체, 공과금납부 및
							이용자 연락처정보 등록은 제1항의 신청절차없이 이용 가능하다.</li>
					</ul>
					<h2>제 6 조 이용자 확인방법</h2>
					<ul>
						<li class="dep1">① 이용자가 제5조 제2항의 ‘신청절차없이 이용할 수 있는 서비스’는
							관련계좌번호 (또는 카드번호)와 계좌비밀번호(또는 카드비밀번호)만으로 본인여부를 확인할 수 있다</li>
						<li class="dep1">② 이용자가 제5조 제1항 신청절차에 의하여 이용할 수 있는 서비스는 다음
							각호와 같이 서비스 종류별로 은행이 요구하는 해당 항목을 이용자가 입력했을 때 동 내용이 은행에 등록된 자료와 일치할
							경우 이용자를 정당한 권리를 가지는 본인으로 간주하고 요청한 서비스를 제공한다.
							<ul>
								<li class="dep2">1. 폰뱅킹 : 주민등록번호 앞 6자리(이하“생년월일”), 계좌번호,
									계좌비밀번호, 이체비밀번호, 보안매체 비밀번호</li>
								<li class="dep2">2. 인터넷뱅킹 : 이용자ID, 이용자비밀번호, 공인인증서, 생년월일,
									계좌번호, 계좌비밀번호, 이체비밀번호, 보안매체 비밀번호</li>
							</ul>
						</li>
					</ul>
					<h2>제 7 조 계좌이체 한도</h2>
					<ul>
						<li class="dep1">① 이용자의 통합이체한도는 1일 5억원 1회 1억원 이내에서 설정하여야 하며,
							폰뱅킹 이체한도는 1일 2억5천만원 1회 5천만원 이내에서 설정하여야 한다. 단, 기타 세부사항은 은행이 정하는 바에
							따른다.</li>
						<li class="dep1">② 이용자는 제1항에서 지정된 통합이체한도내에서 거래할 수 있다. 단,
							예금신규가입, 대출상환, 예금의 해지, 은행의 이자지급 등 은행에서 지정한 일부 서비스는 거래한도에 포함되지 않는다.</li>
						<li class="dep1">③ 폰뱅킹 이체한도는 통합이체한도 범위 이내에서 별도 운영한다.</li>
						<li class="dep1">④ 이체한도의 감액은 전자적 장치를 통하여 할 수 있으나, 이체한도의 증액은
							영업점을 방문하여 신청하여야 한다</li>
					</ul>
					<h2>제 8 조 계좌이체 이용계좌</h2>
					<ul>
						<li class="dep1">① 이용자는 계좌이체에 이용할 출금계좌를 사전에 은행에 서면으로 신청하여야
							한다. 단, 인터넷뱅킹 서비스를 이용할 경우 출금계좌 추가등록서비스를 영업점에서 신청한 경우에는 인터넷뱅킹에서
							출금계좌를 추가할 수 있다.</li>
						<li class="dep1">② 이용자는 계좌이체의 입금대상계좌를 은행에 서면으로 지정할 수 있으며 지정하지
							않을 경우에는 불특정 계좌에 입금할 수 있다.</li>
					</ul>
					<h2>제 9 조 거래지시의 처리기준</h2>
					<p class="sub_txt">이용자의 이체지시는 다음과 같은 처리기준에 의하여 처리한다.</p>
					<ul>
						<li class="dep1">1. 예약이체의 경우 필요한 자금은 이체지정일의 은행에서 정한 이체처리 시간 중
							이용자가 신청한 시간 전에 지급계좌에 입금되어야 하며, 이체실행은 1회의 실행으로 하고 이체불능건에 대한 재처리를
							하지 않는다.</li>
						<li class="dep1">2. 이체지정일에 복수의 예약이체 의뢰가 있을 때에는 은행이 접수받은 순서에
							따라 처리한다.</li>
						<li class="dep1">3. 폰뱅킹의 경우 상담사에게 이체지시를 할 수 있다.</li>
						<li class="dep1">4. 출금계좌에서의 출금한도는 이체시점까지 현금화된 예금잔액(대출한도 포함)으로
							한다.</li>
						<li class="dep1">5. 예약이체 지정일은 6개월 이내에서 등록하여야 한다.</li>
					</ul>
					<h2>제 10 조 예금 및 신탁계좌신규 및 해지</h2>
					<ul>
						<li class="dep1">① 이용자가 서비스를 통해 본인명의의 예금(이하 “근거계좌”라 한다)에서 자금을
							출금하여 예금 및 신탁계좌(이하 “연결계좌”라 한다)를 신규할 수 있다.</li>
						<li class="dep1">② 연결계좌는 만기일에 자동으로 해지되어 근거계좌로 입금된다. 단, 담보제공되어
							있거나 납입지연 등으로 자동해지시 이용자에게 불이익이 발생되는 경우에는 자동해지 되지 않을 수 있다.</li>
						<li class="dep1">③ 연결계좌의 중도해지는 예금주가 직접 서비스를 통하여 해지하여야 한다.</li>
						<li class="dep1">④ 연결계좌의 적립금 납입 및 이자지급은 자동이체 처리함을 원칙으로 하되, 별도
							서면 또는 전자적 장치로 자동이체를 해제할 수 있다.</li>
						<li class="dep1">⑤ 서비스를 통해 신규한 연결계좌는 인감 또는 서명신고를 생략하고 통장발급을
							하지 않으며, 통장발급을 원할 경우는 영업점을 방문하여 본인확인절차를 마친 후 발급할 수 있다.<br>단,
							영업점을 통해 통장을 발행한 경우에는 서비스를 통한 중도해지와 만기시 자동해지는 처리되지 않는다.
						</li>
						<li class="dep1">⑥ 실명확인된 계좌를 보유한 이용자가 전자적 장치를 이용한 서비스에 가입한 경우
							이용자의 예금계약을 해지하고자 할 때에는 통장 대신 전자적 장치를 이용하여 해지도 가능하다. 이때, 해지된 금액은
							본인의 실명확인된 계좌로 입금하여야 한다.</li>
					</ul>
					<h2>제 11 조 대출</h2>
					<ul>
						<li class="dep1">① 이용자가 서비스를 통해 대출을 받고자 할 경우에는 별도의 약정을 체결한 후
							할 수 있다.</li>
						<li class="dep1">② 제1항의 약정은 서류없이 서비스를 통해 할 수 있다.</li>
						<li class="dep1">③ 이용자가 서비스를 통해 대출을 신청하는 경우 제6조의 이용자확인방법을 통하여
							동일성 여부를 확인하여 거래지시의 내용으로 처리한 경우에는 그 처리한 내용대로 약정이 체결되는 것으로 본다.</li>
					</ul>
					<h2>제 12 조 거래의 제한</h2>
					<ul>
						<li class="dep1">① 다음 각호에 해당하는 경우에는 서비스의 전부 또는 일부를 제한할 수 있다.
							<ul>
								<li class="dep2">1. 이용자비밀번호, 이체비밀번호, 보안카드 비밀번호, 계좌비밀번호가 각
									5회 이상 연속하여 틀렸을 경우, 또는 OTP를 보안매체로 사용하는 고객이 OTP에서 생성되는 비밀번호를 전
									금융기관을 통합하여 10회 이상 연속하여 틀렸을 경우</li>
								<li class="dep2">2. 서비스를 통하여 12개월 이상 계좌이체 이용실적이 없을 때</li>
								<li class="dep2">3. 은행 영업시간 종료 후 및 비영업일</li>
								<li class="dep2">4. 사고신고 접수된 서비스. 단, 사고신고되지 않은 서비스는 이용 가능함</li>
							</ul>
						</li>
						<li class="dep1">② 서비스가 제한된 이용자는 은행을 방문하여 실명확인절차를 거친 후 서비스
							재개를 신청할 수 있다. 단, 전항 1호 이용자비밀번호 또는 2호의 인터넷 장기 미사용 이용정지 고객은 인터넷뱅킹에서
							비밀번호 확인 및 전자서명 등의 절차에 의하여 서비스 재개할 수 있으며 폰뱅킹 장기미사용 이용정지 고객은 은행 방문
							및 고객센터를 통하여 이용정지 해제 절차를 거쳐 서비스를 재개할 수 있다.</li>
					</ul>
					<h2>제 13 조 수수료</h2>
					<p class="sub_txt">수수료는 [별표1]과 같으며, 각종 서비스 종료와 동시에 이용자의 인출계좌에서
						자동 출금하기로 한다.단, 은행에서 지정한 일부 서비스는 매월 일정한 날에 이용자가 지정한 계좌에서 자동출금하기로
						한다.</p>
					<h2>제 14 조 비밀번호 등의 관리</h2>
					<ul>
						<li class="dep1">① 이용자는 서비스 신청시 이체비밀번호 및 이용자 비밀번호를 등록하여야 한다.
							단, 이용자가 해외에서 해외영업점을 통하여 서비스를 계약하는 경우 전자적 장치로 이체비밀번호 및 이용자비밀번호를
							등록하여야 하며, 이체비밀번호는 계약일 포함 1개월 이내에 등록해야 한다.</li>
						<li class="dep1">② 비밀번호의 조회나 확인은 할 수 없으며, 연속으로 누적하여 제12조 ①항
							1호에서 정한 횟수 이상 오류 입력시에는 은행에 비밀번호 오류횟수 초기화 또는 비밀번호 재등록을 위한 서면신청을 한
							후 다시 등록한다. 단, 이용자비밀번호는 인터넷뱅킹에서 비밀번호 확인 및 전자서명 등의 절차에 의해 다시 등록할 수
							있다.</li>
					</ul>
					<h2>제 15 조 거래내용의 확인</h2>
					<p class="sub_txt">이용자는 거래지시와 처리결과가 일치하는지 여부를 확인하여야 하며, 통신장애 등의
						사유로 인하여 처리결과를 확인하지 못한 경우에는 재접속을 하여 정상처리 여부를 확인하여야 한다.</p>
					<h2>제 16 조 서비스 정지, 해지, 변경, 사고신고</h2>
					<ul>
						<li class="dep1">① 서비스 이용수수료를 은행에서 정한 기한 내에 납부하지 않을 경우 은행은
							서비스를 정지할 수 있다.</li>
						<li class="dep1">② 이용자는 서비스 또는 영업점을 통해 서비스 계약을 해지할 수 있다.</li>
						<li class="dep1">③ 이용자가 이용자비밀번호, 이체비밀번호, 계좌비밀번호 등 비밀번호를 변경하고자
							하는 경우에는 전자적 장치를 이용하여 변경할 수 있다.</li>
						<li class="dep1">④ 보안매체의 분실, 도난 및 각종 비밀번호 누설 등 사고발생시에는 즉시 거래
							영업점에 서면 또는 전자적 장치를 통하여 신고하여야 한다. 그러나 긴급하거나 부득이한 경우에는 전화 등으로 신고할 수
							있으며 이 경우 다음영업일 중 서면으로 신고하여야 한다.</li>
					</ul>
					<h2>제 17 조 합의관할</h2>
					<p class="sub_txt">서비스 이용과 관련하여 은행과 이용자 사이에 소송의 필요가 있는 경우의
						관할법원은 법이 정하는 관할법원과 은행 또는 이용자의 소재지 관할법원으로 한다</p>
					<h2>제 18 조 준용 규정 및 약관변경</h2>
					<ul>
						<li class="dep1">① 이 약관에서 정하지 아니한 사항은 전자금융거래기본약관,
							yessign서비스이용약관 및 기타 해당업무의 개별 약관을 따르기로 한다.</li>
					</ul>
					<h2>[별표1] 이체수수료</h2>
					<p class="sub_txt">이체수수료 구분 당행이체 타행이체 비고</p>
					<ul class="etc_box">
						<li class="dep1_bu">쌍용은행으로 보낼때
							<ul>
								<li class="dep2_bu">폰뱅킹
									<ul>
										<li class="dep3">- ARS : 무료, - 상담사 : 무료</li>
										<li class="dep_sp1">※ 5억원초과시 5억원당</li>
									</ul>
								</li>
								<li class="dep2_bu">인터넷뱅킹(모바일뱅킹 포함) : 무료
									<ul>
										<li class="dep_sp1">※ 5억원초과시 5억원당</li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="dep1_bu">다른은행으로 보낼 때
							<ul>
								<li class="dep2_bu">폰뱅킹
									<ul>
										<li class="dep3">- ARS : 500원, - 상담사 : 500원</li>
										<li class="dep_sp1">※ 5억원초과시 5억원당</li>
									</ul>
								</li>
								<li class="dep2_bu">인터넷뱅킹(모바일뱅킹 포함) : 500원
									<ul>
										<li class="dep_sp1">※ 5억원초과시 5억원당</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
					<p class="dep_sp1">※ 기타 세부기준은 은행이 정하는 바에 따른다.</p>
				</article>
			</section>
		</p>
	</div>
	
	<!-- 개인정보 수집 이용약관 -->
	<div id="dialog-collectMemberInfoTerms" title="개인정보 수집 이용약관" style="display: none;">
		<p>
			<section id="container">
				<div id="contentsWrap">
					<!-- contents -->
					<div class="contents">
						<h3 class="blind" id="cont_title_h3">본문 상세</h3>

						<!-- 내용 시작 -->
						<div class="termsInfoWrap">
							<h4 class="termsTitLV0" style="text-decoration: underline">
								[비여신 用]<br>[공통필수] 개인정보 수집ㆍ이용 동의서
							</h4>
							<p class="mt12">[ 주식회사 쌍용은행 ] 귀하</p>
							<p class="mt12">
								[귀 행]과의 비여신 (금융)거래와 관련하여 [귀 행]이 본인의 개인정보를 수집ㆍ이용하고자 하는 경우에는 <span
									class="colorTyOrg">「신용정보의 이용 및 보호에 관한 법률」 제15조 제2항, 제32조
									제1항, 제33조, 제34조 및</span>「개인정보 보호법」 제15조 제1항 제1호, 제24조 제1항 제1호, <span
									class="colorTyOrg">제24조의2</span>에 따라 본인의 동의가 필요합니다.
							</p>
							<p class="starTxt mt6">
								* 본 동의서는 비여신(금융)거래(외국환, 전자금융, 현금카드, 신탁, 퇴직연금, 펀드, 방카슈랑스, 파생상품,
								대여금고, 보호예수, 각종 대행업무 등)와 관련하여 본인의 개인정보를 수집ㆍ이용하기 위하여 1회만 작성하는
								동의서로, 본 동의 이후 비여신(금융)거래 시 <span class="colorTyOrg">별도의
									동의가 필요하지 않습니다.</span>
							</p>
							<p class="starTxt f15 b">* 필수사항에 대한 동의만으로 계약 체결이 가능합니다.</p>
							<h5 class="termsTitLV1 mt22">수집ㆍ이용 목적</h5>
							<ul class="listTyDotR">
								<li>(금융)거래관계의 설정 여부 판단</li>
								<li>(금융)거래관계의 설정ㆍ유지ㆍ이행ㆍ관리</li>
								<li>금융사고 조사, 분쟁 해결, 민원 처리</li>
								<li>법령상 의무이행</li>
							</ul>
							<h5 class="termsTitLV1 mt22">수집ㆍ이용할 항목</h5>
							<strong class="titArrow mt12">[필수 정보]</strong>
							<div class="titArrowSec">
								<ul class="listTyDotR">
									<li>공통정보
										<p class="dashTxt">
											- 성명, <span class="f15 b">고유식별정보</span>, <span
												class="colorTyOrg">국내거소신고번호</span>, 주소, 연락처, 직업군, 국적
										</p>
									</li>
									<li class="mt5">(금융)거래정보
										<p class="dashTxt">- 상품종류, 거래조건(이자율, 만기 등), 거래일시, 금액 등 거래
											설정․내역 정보 및 (금융)거래의 설정ㆍ유지ㆍ이행ㆍ관리를 위한 상담을 통해 생성되는 정보</p>
									</li>
									<li class="mt5">고객 ID, 접속일시, IP주소, 이용 전화번호 등 전자금융거래법에 따른
										수집 정보 <br> [전자금융거래에 한함]
									</li>
								</ul>
							</div>
							<p class="warningTxt mt5">
								※ 본 동의 이전에 발생한 개인<span class="colorTyOrg">(신용)</span>정보도 포함됩니다.
							</p>

							<h5 class="termsTitLV1 mt22">보유ㆍ이용 기간</h5>
							<p class="mt12 f15 b">
								위 개인<span class="colorTyOrg b">(신용)</span>정보는 (금융)거래 종료일로부터 5년까지
								보유ㆍ이용됩니다. (금융)거래 종료일 후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행을 위하여만
								보유ㆍ이용됩니다.
							</p>
							<p class="starTxt colorTyOrg">* (금융)거래 종료일이란 당행과 거래중인 모든
								계약(여ㆍ수신, 내ㆍ외국환, 카드 및 제3자 담보제공 등)해지 및 서비스(대여금고, 보호예수, 외국환거래지정,
								인터넷뱅킹 포함 전자금융거래 등)가 종료한 날을 뜻합니다.</p>
							<h5 class="termsTitLV1 mt22">동의를 거부할 권리 및 동의를 거부할 경우의 불이익</h5>
							<p class="mt12">
								위 개인<span class="colorTyOrg">(신용)</span>정보 수집ㆍ이용에 관한 동의는 계약의 체결
								및 이행을 위하여 필수적 이므로, 위 사항에 동의하셔야만 (금융)거래관계의 설정 및 유지가 가능합니다.
							</p>
							<h5 class="termsTitLV1 mt22">개인정보 수집ㆍ이용 동의여부</h5>
							<div class="boxTyGray mt12">
								<div class="inner">
									[귀 행]이 위와 같이 본인의 개인<span class="colorTyOrg">(신용)</span>정보를
									수집ㆍ이용하는 것에 동의합니다.
									<div class="ar mt5">(동의하지 않음 □ 동의함 □)</div>
								</div>
							</div>
							<h5 class="termsTitLV1 mt22">고유식별정보 수집ㆍ이용 동의여부</h5>
							<div class="boxTyGray mt12">
								<div class="inner">
									[귀 행]이 위 목적으로 본인의 <span class="f15 b">고유식별정보</span>를 수집ㆍ이용하는 것에
									동의합니다.
									<div class="ar mt5">(동의하지 않음 □ 동의함 □)</div>
								</div>
							</div>

							<p class="starTxt mt5">
								* <span class="b">고유식별정보</span>는 개인정보보호법 제24조에 규정된<span
									class="f15 b"> [주민등록번호, 여권번호, 운전면허번호, 외국인등록번호]</span>를 의미합니다.
							</p>
							<p class="starTxt mt5 colorTyOrg">* 은행의 고의 또는 과실 등 귀책사유로 인한
								개인(신용)정보 유출로 고객님에게 발생한 손해에 대해 관계 법령 등에 따라 보상받으실 수 있습니다</p>
							<div class="ar mt12">
								<p>
									년 <span class="ml30"></span>월 <span class="ml30"></span> 일
								</p>
								<p class="mt2">
									성명 : <span class="lineBtm"></span>서명 또는 (인)
								</p>
								<p class="mt15">(2017. 09. 15 개정)</p>
							</div>

							<hr class="dividingLine mt22">
							<h4 class="termsTitLV0 mt22">개인(신용)정보 수집ㆍ이용 및 제공 관련 고객 권리
								안내문</h4>
							<h5 class="termsTitLV1 mt12">1. 금융서비스 이용 범위</h5>
							<p class="mt12">고객의 개인(신용)정보는 고객이 동의한 목적을 위하여만 수집ㆍ이용 및 제공됩니다.
								필수적 정보에 대한 수집ㆍ이용 및 제공은 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만
								(금융)거래 관계의 설정 및 유지가 가능합니다. 반면 선택적 정보에 대한 수집ㆍ이용 및 제공에 대하여는 거부하실 수
								있으며, 다만 동의하지 않으실 경우 (금융)거래 조건 등에 불이익을 받으실 수 있습니다.</p>
							<h5 class="termsTitLV1 mt12">2. 고객 개인(신용)정보의 제공 및 마케팅 활용 중단
								신청</h5>
							<ul class="listTyHangul mt6">
								<li>가. 고객은 가입신청시 동의한 본인 개인(신용)정보의 제3자 제공 또는 귀사의 [금융상품
									(서비스)] 소개 등 영업목적의 사용 사용에 대하여 전체 또는 사안별로 [당행]에 제공ㆍ활용을 중단시킬 수
									있습니다.(개인정보 보호법 제37조 , 신용정보의 이용 및 보호에 관한 법률 제37조). 다만,
									<ul class="listTyCircle mt6">
										<li>① 법률에 특별한 규정*이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우,</li>
										<li>② 다른 사람의 생명ㆍ신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게
											침해할 우려가 있는 경우,</li>
										<li>③ 개인(신용)정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의
											이행이 곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게 밝히지 아니한 경우에는 제공ㆍ활용 중단
											신청이 거절될 수 있습니다.</li>
									</ul>
									<p class="starTxt">* 신용조회회사 또는 신용정보집중기관에 제공하여 개인의 신용도를 평가하기
										위한 목적으로 행한 신용정보의 제공 동의는 철회할 수 없습니다.(신용정보의 이용 및 보호에 관한 법률 제37조
										제1항 단서)</p>
								</li>
								<li>나. 본인 개인(신용)정보의 제공ㆍ활용 중단을 원하시는 고객은 아래의 매체를 통하여 신청하여 주시기
									바랍니다.
									<p class="dashTxt">- 신청방법: 인터넷접수 : www.ssbank.com</p>
									<p class="dashTxt">- 전화접수 : 1544-8000</p>
									<p class="dashTxt">- 서면접수 : 당행 전 영업점</p>
								</li>
								<li>다. 위의 신청과 관련하여 불편함을 느끼시거나 애로가 있으신 경우 아래 연락처를 통하여 연락하여
									주시기 바랍니다.
									<p class="dashTxt">- [당 행] 고객 정보관리ㆍ보호인/개인정보 보호책임자 연락처:
										[1544-8000]</p>
									<p class="dashTxt">- 전국은행연합회 민원상담실 : 1544-1040, 서울시 중구
										명동11길 19(명동 1가)</p>
									<p class="dashTxt">- 금융감독원 금융민원실 : 1332, 서울시 영등포구 여의대로 38</p>
								</li>
							</ul>
							<h5 class="termsTitLV1 mt12">3. 고객 개인(신용)정보의 자기정보결정권</h5>
							<ul class="listTyHangul mt6">
								<li>가. 고객은 신용정보의 이용 및 보호에 관한 법률, 개인정보 보호법 및 신용정보업감독규정 등에 따라
									아래의 권리가 부여 되어 있습니다. 동 권리의 세부내용에 대해서는 [당 행]
									홈페이지([www.ssbank.com]) 또는 금융감독원 홈페이지(www.fss.or.kr)에 게시되어
									있습니다. 동 권리를 행사하고자 하는 고객은 연락중지청권의 경우 두낫콜
									홈페이지(www.donotcall.or.kr)에서, 그 밖의 권리는 [당행 각 영업점 앞]으로 신청하여 주시기
									바랍니다.
									<p class="dashTxt">- 개인신용정보 이용 및 제공 사실 조회 요청권(신용정보의 이용 및
										보호에 관한 법률 제35조) : 금융회사가 내부경영 관리의 목적으로 이용하거나 반복적인 업무위탁을 위해 제공하는
										경우 등을 제외하고 개인신용정보를 이용하거나 제공 중인 현황을 확인할 수 있는 권리</p>
									<p class="dashTxt">- 연락중지 청구권(신용정보의 이용 및 보호에 관한 법률 제37조
										제2항) : 원치 않는 마케팅 목적의 연락(휴대폰 전화 또는 문자메세지)을 거부할 수 있는 권리</p>
									<p class="dashTxt">- 개인(신용)정보 열람 및 오류 개인(신용)정보의 정정ㆍ삭제
										요구권(개인정보 보호법 제35조ㆍ제36조, 신용정보의 이용 및 보호에 관한 법률 제38조) : [당 행]에
										본인의 개인(신용)정보에 대한 열람을 요구할 수 있는 권리 및 자신의 개인(신용)정보를 열람한 후 사실과
										다르거나 확인할 수 없는 개인(신용)정보에 대하여 정정/삭제를 요구할 수 있는 권리</p>
									<p class="dashTxt">- 개인신용정보 이용ㆍ제공 사실 통보 요구권(신용정보의 이용 및 보호에
										관한 법률 제35조) : ㆍ신용정보회사 등이 본인에 관한 신용정보를 이용ㆍ제공한 경우 매 1년마다
										이용ㆍ제공현황을 통보해줄 것을 [통지요청의 방법]를 통해 요구할 수 있는 권리</p>
									<p class="dashTxt">- 개인신용정보 삭제요구권(신용정보의 이용 및 보호에 관한 법률
										제38조의3) : ㆍ당행과의 금융거래 종료 후 법령에서 정한 기간이 경과 시 당행이 보유한 본인 정보의 파기를
										요구할 수 있는 권리</p>
								</li>
								<li>나. 고객은 본인 개인(신용)정보를 개인신용평가회사(마이크레딧, 크레딧뱅크, 사이렌24, 올크레딧
									등)를 하여 연간 일정 범위 내에서 확인할 수 있습니다. 자세한 사항은 각 개인신용평가회사에 문의하시기 랍니다.
									<p class="dashTxt">- 마이크레딧: 02) 1588-2486 /
										www.mycredit.co.kr</p>
									<p class="dashTxt">- 크레딧뱅크: 02) 3771-1004 /
										www.creditbank.co.kr</p>
									<p class="dashTxt">- 사이렌24: 02) 1577-1006 / www.siren24.com</p>
									<p class="dashTxt">- 올크레딧: 02) 708-1000 /
										www.allcredit.co.kr</p>
								</li>
							</ul>
							<h5 class="termsTitLV1 mt12">4. 개인정보 유출시 피해보상</h5>
							<p class="mt12">쌍용은행의 고의 또는 과실 등 귀책사유로 인한 개인정보 유출로 고객님에게 발생한
								손해에 대해 관계 법령 등에 따라 보상받으실 수 있습니다.</p>
						</div>
						<!-- // 내용 끝 -->

					</div>
					<!-- // contents -->
				</div>
				<!-- // contentsWrap -->

			</section>
		</p>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		
		/* 확인 버튼을 눌렀을 경우 약관 동의에 대한 기능 */
		$("#nextJoinPage").click(function(event){
			event.preventDefault();
			
			if( $("#mbj0001-01").prop("checked") && $("input[name=join01]:checked").val()=="true" && $("input[name=join02]:checked").val()=="true" ){
				location.href="<%=cp %>/member/member-0002";
			} else {
				
				/* 모든 약관에 동의를 하지 않았을 경우 dialog 출력 */
				$( "#dialog-termsConfirm" ).dialog({
					modal: true,
					buttons: {
						확인 : function() {
							$( this ).dialog( "close" );
						}
					}
				});
			}
		});
		
		
		$("#memberServiceTerms").click(function(){
			$( "#dialog-memberServiceTerms" ).dialog({
				width: 800,
				maxHeight: 600,
				modal: true,
				buttons: {
					확인 : function() {
						$( this ).dialog( "close" );
					}
				}
			});
		});
		
		$("#collectMemberInfoTerms").click(function(){
			$( "#dialog-collectMemberInfoTerms" ).dialog({
				width: 800,
				maxHeight: 600,
				modal: true,
				buttons: {
					확인 : function() {
						$( this ).dialog( "close" );
					}
				}
			});
		});
	});
</script>