<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>

    <!-- 아임포트 CDN -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap 프레임워크 연결 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이용권 결제</title>

    <style>
      
      #provides i {
        margin-bottom: 20px;
      }
      ul{
        list-style:none;
      }
      
      #content_header {
        margin-top: 100px;
      }
      #content_header, #content_main{
        padding: 0 20%;
      }
      #regOpt, #payOpt {
        float:left;
        width:50%;
        text-align: center;
        border:1px solid white;
        line-height: normal;
        padding-top:10px;
      }
      #regOpt, #payOpt:hover {
        cursor: pointer;
      }
      #provides {
        float:left;
        border: 1px solid white;
        width: 100%;
        text-align: center;
        padding-top:10px;
      }
      #provides>ul>li {
        padding-top:10px;
      }
      #payBtn {
        display:inline-block;
        width: 100%;
        /* height: 100%; */
      }
      #content_footer{
        margin-top: 100px;
        margin-left: 120px;
      }
      #content_footer > ul {
        margin-top: 10px
      }
    </style>
  </head>
  <body>
    <!-- 전체 영역 -->
    <div class="wrap">

      <!-- 플로팅 버튼 영역 -->
      <jsp:include page="../common/floatingButton.jsp" />

      <!-- 헤더 영역 -->
      <jsp:include page="../common/header.jsp" />

      <!-- 콘텐츠 영역 -->
      <div id="content_container">

        <!-- 콘텐츠 헤더 --> 
        <div id="content_header" style="font-weight:bold">
          <p style="font-size: x-large;">이용권을 선택해주세요 <br>
            <span style="font-size: small; color:grey">영화/드라마/해외시리즈 무제한!</span>
          </p>
        </div>


        <!-- 이용권 선택 / 결제 -->

        <div id="content_main"> <!-- 선택창, 결제버튼 포함하는 div -->
          <div id="payOpt" value="5900"> <!-- 일반결제 -->
            <i class="fa-solid fa-circle-check" ></i>
            <p style="font-weight:900">한달 이용권</i><br>
              <span>5,900원</span>
            </p>
          </div>
          <div id="regOpt" value="3900"> <!-- 정기결제 -->
            <i class="fa-solid fa-circle-check"></i>
            <p style="font-weight:900">정기 구독권</i><br>
              <span>3,900원</span>
            </p>
          </div>
          <div id="provides"> <!-- 혜택 안내 -->
            <ul>
              <li>
                <i class="pay_icon fa-solid fa-video fa-2xl"></i>
                <p>국내/해외 영화, 드라마<br>2억7천만 건 제공</p>
              </li>
              <li>
                <i class="pay_icon fa-solid fa-user fa-2xl"></i>
                <p>무려 최대 1명 동시 이용 가능!!</p>
              </li><i class="pay_icon fa-solid fa-desktop fa-2xl"></i>
                <p><span style="font-weight:bold; color:#64FFDA">DESKTOP ONLY</span><br>
                  침대에 누워서 불끄고 보고싶다구요? 눈 나빠집니다.<br>앉아서보세요</p>
              <li>
                <i class="pay_icon fa-solid fa-closed-captioning fa-2xl"></i>
                <p>영어 잘하십니까? 해외 콘텐츠는 자막을 지원합니다.<br>한국어도 잘 못한다구요?</p>
              </li>
            </ul>
          </div>
          <div id="payArea"> <!-- 결제 버튼 포함하는 div-->
            <button id="payBtn" class="btn text-black" style="background-color: #64FFDA; font-weight: bolder;" disabled>결제하기</button>
          </div>
        </div>

        <script>
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
            pg : 'html5_inicis.INIpayTest', // 일반결제, 인증결제
            pay_method : 'card',
            merchant_uid: 'pay_'+new Date().getTime(), // 상점에서 관리하는 주문 번호
            name : '일반결제',
            amount : 200,
            buyer_email: '${loginUser.userId}',
            // buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-123'
          }, rsp => {
              if (rsp.success) { // 결제 성공 -> 돈 빠져나갔으니까 내가 받은 결제 정보와 아임포트 서버에 저장된 결제 정보 대조시켜서 일치하는지 확인 -> REST API 활용해야 함
                console.log('rsp: '+rsp);
                $.ajax({
                  url:'insert.pay',
                  method:'POST',
                  headers: {'Content-Type':'application/json'},
                  data: {
                  }
                }).done(data => { // insert.pay로 요청 보내서 데이터 insert 성공하면 돌릴 로직
                  console.log
                  alert('결제가 성공적으로 완료되었습니다.')
                  console.log('data :'+data);
                });
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
              pg : 'html5_inicis.INIBillTst', // 실제 계약 후에는 실제 상점아이디로 변경, 정기결제, 비인증결제
              pay_method : 'card', // 'card'만 지원됩니다.
              merchant_uid: 'reg_'+new Date().getTime(), // 상점에서 관리하는 주문 번호
              name : '정기결제',
              amount : 200,
              buyer_email : 'iamport@siot.do',
              buyer_name : '성현',
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
        </script>
        <!-- 결제 약관 -->
        <div id="content_footer">
          <div style="font-size:medium; color:rgb(108, 114, 118);">구독 안내</div>
          <ul style="font-size:small; color: rgb(75, 78, 81);">
            <li>결제 금액에는 VAT가 포함되어있습니다.</li>
            <li>UFO 서비스는 저작권자의 요청으로 해외에서는 이용하실 수 없습니다.</li>
            <li>정기 구독권은 매달 동일한 날짜에 자동 결제되며, 당월에 해당 일자가 없는 경우 말일에 결제가 이루어집니다.</li>
            <li>정기 구독권 자동 결제 해지는 결제 예정일 최소 24시간 이전에 해지 신청을 해야합니다.</li>
            <li>일부 영상은 저작권자의 요청에 따라 도중에 제공이 중단될 수 있습니다.</li>
            <li>엣지, 크롬, 파이어폭스, 웨일, 사파리 브라우저를 지원합니다.</li>
            <li>미성년자의 이용권 구매 시 법정대리인의 동의가 필요하며, 동의를 받지 않은 경우 법정대리인이 이를 취소할 수 있습니다.</li>
          </ul>
        </div>
      </div>
      <!-- 푸터 영역 -->
      <jsp:include page="../common/footer.jsp" />
    </div>
  </body>
</html>