$(function(){
	$(".btn-gnb").click(function(){
		$(this).toggleClass("active");
	});

//	$('a[class*="btn-type-"]').click(function(e) {
//		e.preventDefault();
//	});
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

		var taxRate;
		if($('input[name=radioInput]:checked').val() == '1'){
			taxRate = 1;
		} else if($('input[name=radioInput]:checked').val() == '2'){
			taxRate = 0.90500005;
		} else if($('input[name=radioInput]:checked').val() == '3'){
			taxRate = 0.846
		}

		var resultAmount = amountInput * termInput * 10000;
		var resultTerm = termInput + ('개월');
		var resultRate = rateInput * 100 + ('%');
		var resultRateAmount;
		var resultTotal;

		if ($('select[name=rateType]').val() == '1') {
			resultRateAmount = 0;
			for(var i=termInput; i>0; i--){
				var sum = amountInput * 10000 * rateInput * i / 12;
				resultRateAmount = resultRateAmount + sum;
			};
			resultRateAmount = resultRateAmount * taxRate;
			resultTotal = resultAmount + resultRateAmount;

		// 복리는 ???...
		} else if ($('select[name=rateType]').val() == '2') {
		 	// resultRateAmount = (amountInput*(Math.pow((1+rateInput /12), termInput)-1))/(rateInput/12);
		 	resultRateAmount = resultAmount*(1+rateInput/100)*termInput;
			resultRateAmount = resultRateAmount * taxRate;
			resultTotal = resultAmount + resultRateAmount;

		};

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

		var taxRate;
		if($('input[name=radioInput]:checked').val() == '1'){
			taxRate = 1;
		} else if($('input[name=radioInput]:checked').val() == '2'){
			taxRate = 0.90500005;
		} else if($('input[name=radioInput]:checked').val() == '3'){
			taxRate = 0.846
		};

		var resultAmount = amountInput * 10000;
		var resultTerm = termInput + ('개월');
		var resultRate = rateInput * 100 + ('%');
		var resultRateAmount;
		var resultTotal;

		if ($('select[name=rateType]').val() == '1') {
			resultRateAmount = resultAmount * rateInput * termInput / 12;
			resultRateAmount = resultRateAmount * taxRate;
			resultTotal = resultAmount + resultRateAmount;

		// 복리는 ???...
		} else if ($('select[name=rateType]').val() == '2') {
			// for(var i=1; i<termInput; i++){
			// 	resultRateAmount = 0;
			// 	var rsa = resultAmount * (1 + rateInput * 0.01 ) * i / 12;
			// 	resultRateAmount = resultRateAmount + rsa;
			// 	console.log(resultAmount + ' ' + rsa + ' ' + resultRateAmount);
			// }


			
		};

		$('.resultAmount').text(resultAmount);
		$('.resultTerm').text(resultTerm);
		$('.resultRate').text(resultRate);
		$('.resultTotal').text(resultTotal.toFixed(0));
		$('.resultRateAmount').text(resultRateAmount.toFixed(0));
	});


	// var 원금 = 1000000;
	// for(var i=0; i<개월수; i++){
	// 	원금 = 원금*(1+이자율);
	// }







});