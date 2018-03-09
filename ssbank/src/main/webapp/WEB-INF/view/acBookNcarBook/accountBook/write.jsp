<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!--자바스크립트-->
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script>



$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#sltAll").click(function(){
        //클릭되었으면
        if($("#sltAll").prop("checked")){
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[id=sltThis]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[id=sltThis]").prop("checked",false);
        }
    })
})

function add_row() {
    var my_tbody = document.getElementById('my-tbody');
    //var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow( my_tbody.rows.length-1 ); // 하단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell6 = row.insertCell(6);
    var cell6 = row.insertCell(7);
    
    cell1.innerHTML = '';
    cell2.innerHTML = '';
    cell3.innerHTML = '';
    cell4.innerHTML = '';
    cell5.innerHTML = '';
    cell6.innerHTML = '';
    cell7.innerHTML = '';
    cell7.innerHTML = '<a href="#" class="btn-type-blue1 medium">입력</a>';
  }
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content">
	<!-- jsp body 영역 -->
	<div class="table-wrap">
		<!-- jsp body 영역 -->
			<div class="page-con">
				<h1>가계부 쓰기</h1>
				<div class="date-wrap">
					<a href="#" class="btn arrow-left"></a>
					<span>2018.03.01 ~ 2018.03.31</span>
					<a href="#" class="btn arrow-right"></a>
				</div>
				<h2>가계부 요약</h2>
				<div class="account-area mb30">
					<div class="graph-area">그래프이미지영역</div>
					<div class="account-view">
						<ul>
							<li class="income-area">
								<div class="view-tit">수입</div>
								<div class="view-sub">
									<dl>
										<dd>50,000</dd>
										<dt>주수입</dt>
									</dl>
									<dl>
										<dd>0</dd>
										<dt>부수입</dt>
									</dl>
								</div>
								<div class="view-total">50,000</div>
							</li>
							<li class="spend-area">
								<div class="view-tit">지출</div>
								<div class="view-sub">
									<dl>
										<dd>5,000</dd>
										<dt>현금</dt>
									</dl>
									<dl>
										<dd>0</dd>
										<dt>카드</dt>
									</dl>
								</div>
								<div class="view-total">5,000</div>
							</li>
							<li>
								<span class="ico-sum"></span>
								<span class="account-total">45,000</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="tab-wrap blue item3">
					<ul>
						<li class="active"><a href="#">지출</a></li>
						<li><a href="#">수입</a></li>
						<li><a href="#">달력</a></li>
					</ul>
				</div>

			</div>
			<!-- //jsp body 영역 -->
	
	<table class="table-hori">
		<!--머리-->
        <colgroup>
            <col style="width:auto"/>
            <col style="width:10%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:auto;"/>
        </colgroup>
        <thead>
        	<tr>
                <th scope="col">
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltAll">
                   		<label for="sltAll"></label>
                    </div>
                </th>
                <th scope="col">날짜</th>
                <th scope="col">사용내역</th>
                <th scope="col">현금</th>
                <th scope="col">카드</th>
                <th scope="col">카테고리</th>
                <th scope="col">입력 및 수정</th>
            </tr>        
        </thead>
		
		<!--몸통-->
        <tbody id="my-tbody">
        <c:forEach var="dto" items="${listAll}" begin="0" varStatus="status">
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="${status.count}">
                    	<label for="${status.count}"></label>
                    </div>
                </td>
                <td><input type="text" class="ACBtext" value="${dto.accountBookDate}" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" value="${dto.content}" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" value="" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" value="${dto.amount}" size="10" style="width=100%"></td>
                <td>
                	<div class="item-select" id="sltIO">
                		 <select name="" id="">
                            <option>카테고리</option>
                            <option>식비</option>
                            <option>주거/통신</option>
                            <option>생활용품</option>
                            <option>의복/미용</option>
                            <option>건강/문화</option>
                            <option>교육/육아</option>
                            <option>교통/차량</option>
                            <option>경조사/회비</option>
                            <option>세금/이자</option>
                            <option>용돈/기타</option>
                            <option>미분류</option>
                        </select>
                	</div>
                </td>
                <td>
                    <a href="#" class="btn-type-blue1 medium">입력</a>
                	<!-- <a href="#" class="btn-type-gray small">수정</a> -->
                </td>   
            </tr>
      </c:forEach>      

            
            
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                	<a onclick="add_row()" class="btn-type-gray1 small">추가</a>
                	<a onclick="add_row()" class="btn-type-gray1 small">선택삭제</a>
                </td>
                <td></td>
                <td></td>
                <td></td>                
            </tr>
            
        </tbody>
    </table>
        	</div>
        </div>
        


</body>
</html>