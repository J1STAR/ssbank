<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	<aside>
		<div class="side-bar">
			<ul>
				<li><a href="<%=cp%>/calc/saving">계산기</a></li>
				<li><a href="#">위치찾기</a></li>
				<li><a href="#">문의하기</a></li>
				<li>
					<span class="tel">1588<br>3082</span>
					<span class="time">평일<br>09:00~17:50</span>
				</li>
				<a href="#" class="btn-top">TOP</a>
			</ul>
		</div>
	</aside>
	<footer>
		<div class="footer-wrap">
			<div class="info-tel">
				<span>쌍용뱅크 콜센터</span>
				<span>1588-3082</span>
			</div>
			<div class="address-wrap">
				<div class="bottom-nav">
					<ul>
						<li><a href="#">개인정보 취급방침</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">전자민원</a></li>
					</ul>
				</div>
				<div class="address">
					<p>
						<span><address>서울시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용뱅크</address></span>
						<span>대표이사 | 김환욱</span><span>사업자등록번호 | 486-486-012</span>
					</p>
					<span class="copy">COPYRIGHT 2018 SSANGYONG BANK CO. LTD. ALL RIGHTS RESERVED.</span>
				</div>
			</div>
		</div>
	</footer>
	<script>
		/* DatePicker를 통한 날짜 입력 */
		$(function(){
			
			$("#date").datepicker({
				maxDate:"0"
				,showOn:"button"
				,buttonImage:"<%=cp %>/resource/images/ico_calendar.png"
				,buttonImageOnly:true
			});
			
			$(".hasDatePicker").datepicker({
				maxDate:"0"
				,showOn:"button"
				,buttonImage:"<%=cp %>/resource/images/ico_calendar.png"
				,buttonImageOnly:true
			});
			
			
			$(".ui-datepicker-trigger").css({
				position:"absolute", width:"32px", height:"32px"
			});
			
		});
	</script>