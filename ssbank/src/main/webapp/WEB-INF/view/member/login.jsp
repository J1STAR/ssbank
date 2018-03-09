<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 340px; height: 35px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}
</style>

<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login_check";
    f.submit();
}
</script>

<div class="body-container">
    <div style="margin: 0px auto; padding-top:90px; width:360px;">
    	<div style="text-align: center;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;">회원 로그인</span>
        </div>
        
		<form name="loginForm" method="post" action="">
		  <table style="margin: 15px auto; width: 360px; border-spacing: 0px;">
		  <tr align="center" height="60"> 
		      <td> 
                <label for="userId" id="lblUserId" class="lbl" >아이디</label>
		        <input type="text" name="userId" id="userId" class="loginTF" maxlength="100"
		                   tabindex="1"
                           onfocus="document.getElementById('lblUserId').style.display='none';"
                           onblur="bgLabel(this, 'lblUserId');">
		      </td>
		  </tr>
		  <tr align="center" height="60"> 
		      <td>
		        <label for="userPwd" id="lblUserPwd" class="lbl" >패스워드</label>
		        <input type="password" name="userPwd" id="userPwd" class="loginTF" maxlength="20" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblUserPwd').style.display='none';"
                           onblur="bgLabel(this, 'lblUserPwd');">
		      </td>
		  </tr>
		  <tr align="center" height="65" > 
		      <td>
		        <button type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
		      </td>
		  </tr>

		  <tr align="center" height="45">
		      <td>
		       		<a href="<%=cp%>/">아이디찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="<%=cp%>/">패스워드찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="<%=cp%>/member/memberJoin-0001">회원가입</a>
		      </td>
		  </tr>
		  
		  <tr align="center" height="40" >
		    	<td><span style="color: blue;">${message}</span></td>
		  </tr>
		  
		  </table>
		</form>           
	</div>
</div>
<section class="main-recommand">
	<h2>쌍용은행 <span>추천상품</span></h2>
	<section class="recommand-visual">
		<div class="owl-carousel owl-theme slider">
			<div class="item item-01">
				<ul>
					<li>쌍용뱅크 입출금 통장</li>
					<li>까다로운 계좌개설도</li>
					<li>정말 손쉽게</li>
					<li>연 0.10%</li>
				</ul>
				<a href="#">더 알아보기</a>
			</div>
			<div class="item item-02">
				<ul>
					<li>쌍용뱅크 정기예금</li>
					<li>실시간 이자로</li>	
					<li>돈모으는 재미가 쏠쏠</li>	
					<li>연 2.20%</li>	
					<li>(12개월기준)</li>	
				</ul>
				<a href="#">더 알아보기</a>
			</div>
			<div class="item item-03">
				<ul>
					<li>쌍용뱅크 전월세보증금 대출</li>
					<li>전월세 보증금도</li>
					<li>정말 간편하게</li>
					<li>연 2.82%</li>
					<li>(최저)</li>
				</ul>
				<a href="#">더 알아보기</a>
			</div>
		</div>
	</section>
</section>