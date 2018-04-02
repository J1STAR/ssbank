$(function(){
	$(".btn-gnb").click(function(){
		$(this).toggleClass("active");
	});
});


$(document).ready(function() {

	// 탭메뉴
	$(".tab_content").hide();
	$(".tab_content:first").show();

	$("ul.tabs li").click(function () {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();

		return false;
	});

	// 계산기
	var $buttons = $(".calcurator button");
	$buttons.on('click', function(){
		$('#cal-input').val($('#cal-input').val() + $(this).val());
		$('.show-all').append($(this).val());
	});
	// 숫자만 입력받도록

	// 비어있을때 0을 두번이상 클릭할수 없도록

	// 계산부호 클릭시
	$('.oper').on('click', function(){
		var oldNum = $('#cal-input').val();
		var $oper = $(this).val();
		oldNum = oldNum.substring(oldNum.length-1, 0);
		$('#cal-hidden').val(oldNum);
		$('#oper-hidden').val($oper);
		$('#cal-input').val('');
		// 부호클릭하면 기존 입력된 숫자만 다시 표시되게

		console.log('oldNum = ' + oldNum + ', $oper = ' + $oper);
	});

	// AC 버튼 눌렀을때
	$('.clear button').on('click', function(){
		$('#cal-input').val('');
		$('#cal-hidden').val('');
		$('#oper-hidden').val('');
		$('.show-all').text('');
	});

	$(document).on('keydown', function(e){
		if(e.keyCode == 27){
			$('#cal-input').val('');
			$('#cal-hidden').val('');
			$('#oper-hidden').val('');
			$('.clear').addClass('active');
		}
	});

	$(document).on('keyup', function(e){
		if(e.keyCode == 27){
			$('#cal-input').val('');
			$('#cal-hidden').val('');
			$('#oper-hidden').val('');
			$('.clear').removeClass('active');
		}
	});

	// + - 클릭시
	$('.plusMinus').on('click', function(){
		var minus = $('#cal-input').val();
		minus = minus * -1;
		$('#cal-input').val(minus);
	});

	// % 클릭시
	$('.percent').on('click', function(){
		var perc = parseFloat($('#cal-input').val());
		perc = perc * 0.01;
		$('#cal-input').val(perc);

	});

	// 점 클릭시 , 점이 두번이상 입력될수 없도록
	$('.period').on('click', function(){

	});

	// = 클릭시
	$('.return').on('click', function(){
		var x = parseFloat($('#cal-hidden').val());
		var y = parseFloat($('#cal-input').val());
		var op = $('#oper-hidden').val();
		var result;

		if(op == '+'){
			result = x + y;
		} else if (op == '-'){
			result = x - y;
		} else if (op == '*'){
			result = x * y;
		} else if (op == '/'){
			result = x / y;
		} else {
			result = y;
		}
		$('#cal-hidden').val('');
		$('#oper-hidden').val('');
		$('#cal-input').val(result);
		$('.show-all').append(result);

		// 연산후 = 누르면 이전에 했던 연산이 또 일어나서 결과값에 나오게
		
		console.log('x : ' + x + ', y : ' + y + ', op : ' + op);

	});

	// 리셋
	$('#btnReset').on('click', function(){
		$('#amountInput').val("");
		$('#termInput').val("");
		$('#rateInput').val("");
		$('input:radio[name=radioInput]').removeAttr("checked");
		$('#rateType').val("1");
	});

	// 적금 : 적립금 + (이자율 * 납입기간/12) = 총금액
	$('#btnCal-01').on('click', function(){
		var amountInput = $('#amountInput').val(); 
		var termInput = $('#termInput').val();
		var rateInput = $('#rateInput').val()/100;

		var taxRate=0.154;
		

		var resultAmount = amountInput * termInput * 10000;
		var resultTerm = termInput + ('개월');
		var resultRate = rateInput * 100 + ('%');
		var resultRateAmount;
		var resultTotal;

		if ($('select[name=rateType]').val() == '1') {
			var temp = rateInput * (parseInt(termInput)+parseInt(1)) / 24;
			resultRateAmount=resultAmount*temp*0.846;
			resultTotal=resultAmount+resultRateAmount;
			
		} ;

		$('.resultAmount').text(resultAmount);
		$('.resultTerm').text(resultTerm);
		$('.resultRate').text(resultRate);
		$('.resultTotal').text(resultTotal.toFixed(0));
		$('.resultRateAmount').text(resultRateAmount.toFixed(0));
	});

	// 예금
	$('#btnCal-02').on('click', function(){
		var amountInput = $('#amountInput').val();
		var termInput = $('#termInput').val();
		var rateInput = $('#rateInput').val()/100;
		
		var resultAmount = amountInput * 10000;
		var resultTerm = termInput + ('개월');
		var resultRate = rateInput * 100 + ('%');
		var resultRateAmount;
		var resultTotal;
		
		//일반
		if ($('select[name=rateType]').val() == '1') {
			resultRateAmount = resultAmount * rateInput * (termInput / 12) * 0.846;
			resultTotal = resultAmount + resultRateAmount;

		
		} else if ($('select[name=rateType]').val() == '2') {
			var temp = Math.pow(( 1+ (rateInput/12)),termInput);
			var temp1 = resultAmount * resultRateAmount;
			resultRateAmount = (temp - resultAmount) * 0.846 ; // 이자 
			resultAmount = resultAmount+resultRateAmount;
			
			
		};

		$('.resultAmount').text(resultAmount);
		$('.resultTerm').text(resultTerm);
		$('.resultRate').text(resultRate);
		$('.resultTotal').text(resultTotal.toFixed(0));
		$('.resultRateAmount').text(resultRateAmount.toFixed(0));
	});
	
	$('#btnCal-03').on('click', function(){
		
		var money = $("#money").val(); //대출금액
		var period = $("#period").val(); //대출기간
		var rate = $("#rate").val(); //대출이율
		
		var result1;
		var result2;
		var result3;
	
		if($('select[name=rateType]').val()=='1'){
			//일시 만기 상환
			result1=(money*10000)*(rate/12/100)*period;//이자
			alert();
			result2=(money*10000)*(rate/12/100);//월 납부금액';
			result3=(parseInt(money*10000)+parseInt((money*10000)*(rate/12/100)));//만기월 납부금액
			
			$("#method").text('일시 만기 상환');
			$("#content").text('매월 이자만 납입하다가 만기에 원금을 한꺼번에 상환하는 방식입니다.');
			$("#r1").text((money*10000).toFixed(0));
			$("#r2").text(result1.toFixed(0));
			$("#r3").text('평월 납부금액');
			$("#r4").text(result2.toFixed(0));
			$("#r5").text('만기월 납부금액');
			$("#r6").text(result3.toFixed(0));
			
		}else if($('select[name=rateType]').val()=='2'){
			//원리금 균등분할 상환
			result1=(money*10000)*((rate/12/100)/(1-1/Math.pow(1+rate/12/100,period)));
			result2=result1*period-(money*10000);
			

			
			$("#method").text('원리금 균등분할 상환');
			$("#content").text('대출기간 중 매월 원금 일부와 이자를 상환하되, 그 합계액은 동일하게 조정합니다.');
			$("#r1").text((money*10000).toFixed(0));
			$("#r2").text(result2.toFixed(0));
			$("#r3").text('평월 납부금액');
			$("#r4").text(result1.toFixed(0));
			$("#r5").text('만기월 납부금액');
			$("#r6").text(result1.toFixed(0));
			
		}else if($('select[name=rateType]').val()=='3'){
			//원금 균등분할 상환
			result1=0;
			for(var i=1;i<=period;i++){
				result1 =
					result1+
					parseInt(((money*10000)*(i))/period*(rate/12/100));
			}
			 result2 = parseInt((money*10000)/period)+parseInt((money*10000)*(rate/12/100));
		     result3 = parseInt((money*10000)/period)+parseInt((money*10000)/period*(rate/12/100));
		    
		     $("#method").text('원금 균등분할 상환');
		     $("#content").text('매월 원금은 대출금액을 대출개월로 나누어 일정하게 일부상환하고, 이자는 남은 대출원금에 대해 지급하는 방식입니다.');
		     $("#r1").text((money*10000).toFixed(0));
		     $("#r2").text(result1.toFixed(0));
		     $("#r3").text('1차월 납부금액');
		     $("#r4").text(result2.toFixed(0));
		     $("#r5").text('만기월 납부금액');
		     $("#r6").text(result3.toFixed(0));
		}

	});
	
	
	 
	//환율 계산기
	$("#btnCal-04").on('click', function(){
		
	 var ch = $("#change").val(); // 바꿀 돈
	 var rs=0; //바꿔질 돈
	 if($("select[name=nation]").val()=='1'){
		
		 if($("#cal-51").prop("checked")){
			 rs=ch/1066+'USD';
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*1066+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='2'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/10+'JPY';
			  alert(rs);
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*10+'KRW';
			 
		 }	
		 
		 
	 }else if($("select[name=nation]").val()=='3'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/1314+'EUR';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*1314+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='4'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/1501+'GBP';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*1501+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='5'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/825+'CAD';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*825+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='6'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/1115+'CHF';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*1115+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='7'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/135+'HKD';
			 
		 }else if($("#cal-52").prop("checked")){
			 
			 rs=ch*135+'KRW';
		 }	
		 
	 }else if($("select[name=nation]").val()=='8'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/127+'SEK';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*127+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='9'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/817+'AUD';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*817+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='10'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/176+'DKK';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*176+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='11'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/135+'NOK';
		 }else if($("#cal-52").prop("checked")){
			 
			 rs=ch*135+'KRW';
		 }	
		 
	 }else if($("select[name=nation]").val()=='12'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/284+'SAR';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*284+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='13'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/3553+'KWD';
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*3553+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='14'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/2825+'BHD';
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*2825+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='15'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/290+'AED';
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*290+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='16'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/812+'SGD';
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*812+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='17'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/275+'MYR';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*275+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='18'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/768+'NZD';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*768+'KRW';
			 
		 }	
		 
	 }else if($("select[name=nation]").val()=='19'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/170+'CNY';
			 
		 }else if($("#cal-52").prop("checked")){
			 
			 rs=ch*170+'KRW';
		 }	
		 
	 }else if($("select[name=nation]").val()=='20'){
		 	if($("#cal-51").prop("checked")){
			 
		 		rs=ch/0.08+'IDR';
		 }else if($("#cal-52").prop("checked")){
			 
			 rs=ch*0.08+'KRW';
		 }	
		 
	 }else if($("select[name=nation]").val()=='21'){
		 	if($("#cal-51").prop("checked")){
		 		rs=ch/34+'THB';
			 
		 }else if($("#cal-52").prop("checked")){
			 rs=ch*34+'KRW';
			 
		 }	
		 
	 }
	 
	 
	 $("#exMon").text(rs);
		
	
	});
	
	
});



