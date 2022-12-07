const RESTAPI = '3817751562357623'; // 검증할 때 사용할 REST API KEY
const REST_SECRET = 'YJTkrsBfrE8koNNcoJLJqu8vcsqN6omgkYxW91ojs5newEjLVC7YR7Vt3A5L913mF0o26nHrkpLrZudV';
      IMP.init('imp22332526');

// 탭 색깔 바꾸는 함수
const changeColor = (el, backgroundColor, fontColor) =>  {
  $(el).css('backgroundColor', backgroundColor);
  $(el).css('color', fontColor);
};

//   IMP.certification({ // param
//   merchant_uid: 'ORD20180131-0000011', // 주문 번호
//   m_redirect_url : '{리디렉션 될 URL}', // 모바일환경에서 popup:false(기본값) 인 경우 필수, 예: https://www.myservice.com/payments/complete/mobile
//   popup : false // PC환경에서는 popup 파라메터가 무시되고 항상 true 로 적용됨
//   }, function (rsp) { // callback
//         if (rsp.success) {
//     // 인증 성공 시 로직,
//         console.log(rsp);
//   } else {
//     // 인증 실패 시 로직,
//     console.log(rsp.error_msg);
//   }
// });



onload = () => {
  const payOpt = document.getElementById('payOpt'); // 일반결제 탭
  const regOpt = document.getElementById('regOpt'); // 정기결제 탭
  const payBtn = document.getElementById('payBtn'); // 결제하기 버튼

  payOpt.addEventListener('click',() => {
    if($(regOpt).css('backgroundColor','#64FFDA')){
      changeColor(regOpt,'','white');
    }
    changeColor(payOpt, '#64FFDA', 'black');
    $(payBtn).attr('disabled',false);

    payBtn.addEventListener('click', () => {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({
      pg : 'html5_inicis.INIpayTest',
      pay_method : 'card',
      merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
      name : '일반결제',
      amount : 200,
      buyer_email : 'iamport@siot.do',
      buyer_name : ${loginUser.userName},
      buyer_tel : '010-1234-5678',
      buyer_addr : '서울특별시 강남구 삼성동',
      buyer_postcode : '123-456'
    }, rsp => {
        if (rsp.success) {
          console.log(rsp);
          $.ajax({
            url: 'insert.pay',
            data: {,
                   payUrl: rsp.receipt_url,},
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
          })
        } else {
          console.log(rsp.error_msg);
        }
      });
    });
  });
  
  regOpt.addEventListener('click',() => {
    if($(payOpt).css('backgroundColor','#64FFDA')){
      changeColor(payOpt,'','white');
    }

    changeColor(regOpt, '#64FFDA', 'black');
    $(payBtn).attr('disabled',false);

    payBtn.addEventListener('click', () => {
      IMP.request_pay({
        pg : 'html5_inicis.INIBillTst', // 실제 계약 후에는 실제 상점아이디로 변경
        pay_method : 'card', // 'card'만 지원됩니다.
        merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
        name : '정기결제',
        amount : 200,
        buyer_email : 'iamport@siot.do',
        buyer_name : '${loginUser.userName}',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
      },function(rsp) {
          if (rsp.success) {
            console.log(rsp);
          } else {
            console.log(rsp.error_msg);
          }
        });
    });
  })
};