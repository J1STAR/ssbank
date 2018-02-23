<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.resultLayout {
   width: 98%;
   min-height: 30px; 
   margin: 10px auto 0px; 
   padding: 5px;
   border: 1px solid #cccccc; 
}

.resultLayout td p {
	padding-bottom: 5px;
}
</style>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 설문조사 결과보기</h3>
    </div>
    
    <div>
        <div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
            <div style="clear:both; height: 35px; margin-bottom:15px; border-bottom: 1px solid #777777;">
	            <div style="float: left;"><b>| 설문조사 요약</b></div>
	            <div style="float: right;">
	                 <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/survey/list?page=${page}';">리스트</button>
	            </div>
            </div>
        
		  <table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  
			  <tr align="left" height="45" style="border-top: 1px solid #777777; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문제목</td>
			      <td style="padding-left:10px;"> 
			        ${dto.subject}
			      </td>
			  </tr>
			  
			  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문목적</td>
			      <td valign="top" style="padding:5px 0px 5px 10px; white-space: pre-wrap;">${dto.content}</td>
			  </tr>
		
			  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문기간</td>
			      <td style="padding-left:10px;">
			           ${dto.startDay} ~ ${dto.endDay}
			      </td>
			  </tr>

			  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">참여대상</td>
			      <td style="padding-left:10px;">
		            <c:if test="${dto.target==1}">전체(회원+비회원)</c:if>
		            <c:if test="${dto.target==2}">회원</c:if>
		            <c:if test="${dto.target==3}">제안된 회원</c:if>
			      </td>
			  </tr>
			  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">참여현황</td>
			      <td style="padding-left:10px;">
			           ${surveyCount}
			      </td>
			  </tr>
		  </table>
		</div>
		
		<div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
            <div style="clear:both; height: 35px; margin-bottom:15px; border-bottom: 1px solid #777777;">
	            <div style="float: left;"><b>| 설문 상세결과</b></div>
	            <div style="float: right;">&nbsp;</div>
            </div>
		
            <div id="resultContainer">
	                <c:set var="questionNo" value="0"/>
	                <c:forEach var="vo" items="${list}">
	                    <c:set var="questionNo" value="${questionNo+1}"/>
			            <div class='resultLayout'>
			                   <table style='width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
			                         <tr height='40'>
			                            <td style='padding-left:5px; padding-right:5px;'>
			                               <span style="font-weight: 700; font-size: 14px;">${questionNo}. ${vo.question}</span>
			                               <c:if test="${vo.required==1}"><span style="color: red;">[필수 항목]</span></c:if>
			                            </td>
			                         </tr>
			                         
			                         <tr height='40'>
			                            <td class="item" data-required='${vo.required}' style='padding-left:20px; padding-right:5px;'>
			                                 <c:set var="itemNo" value="0"/>
			                                 <c:forEach var="v" items="${vo.listItem}" varStatus="status">
			                                     <c:set var="itemNo" value="${itemNo+1}"/>
			                                     <c:if test="${surveyCount!=0}">
			                                         <c:set var="percent" value="${v.itemCount/surveyCount*100}"/>
			                                     </c:if>
			                                     <p>
			                                          <span style="display: inline-block; min-width: 230px;">(${itemNo}) ${v.item}</span>
			                                          <c:if test="${surveyCount!=0 && percent!=0}">
			                                              <span style="display: inline-block; margin-left: 10px; background: tomato; width: ${percent}px;">&nbsp;</span>
			                                          </c:if>
			                                          <c:if test="${surveyCount!=0}">
			                                              <span style="display: inline-block; margin-left: 10px;">
			                                                    ${v.itemCount}명
			                                                    (<fmt:formatNumber value="${percent}" pattern="0"/>%)
                                                        </span>
                                                     </c:if>
			                                     </p>
				                              </c:forEach>

			                                 <c:forEach var="v" items="${vo.listSubjectives}" varStatus="status">
			                                     <c:if test="${vo.answerType == 3}">
				                                      <p>${status.count}. ${v}</p>
				                                  </c:if>
				                                  <c:if test="${vo.answerType == 4}">
				                                      <p style="white-space: pre-wrap;">${status.count}. ${v}</p>
				                                  </c:if>
				                              </c:forEach>
			                            </td>
			                         </tr>
			                   </table>
			            </div>
	                </c:forEach>
                    <div style="text-align: center; padding-top: 10px;">
		                  <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/survey/list?page=${page}';">리스트</button>
		            </div>
            </div>
		</div>	
		
			
    </div>
</div>