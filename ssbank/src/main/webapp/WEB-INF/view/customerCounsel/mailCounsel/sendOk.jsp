<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">

   <h1>이메일 상담</h1>
    <div style="margin: 0px auto; padding-top:90px; width:420px;">
    	<div style="text-align: center;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;">메일 전송</span>
        </div>
        
        <div class="messageBox">
            <div style="line-height: 150%; padding-top: 35px;">
                       ${message}            
            </div>
            <div style="margin-top: 20px;">
                     <a class="btn-type-blue1 medium" onclick="javascript:location.href='<%=cp%>/customerCounsel/main';">메인화면으로 이동</a>
                </div>
        </div>
     </div>   

</div>
