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

      #cardInfo > p {
        color: #64FFDA;
      }

      #cardInfo>table>tbody>tr>th{
        color: rgb(108, 114, 118);
      }
      
      #expiry, #pwd_2digit, #birthday {
        width: 100%;
      }
      /* 모달창 */
      #modal.modal-overlay {
          width: 100%;
          height: 100%;
          position: absolute;
          left: 0;
          top: 0;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          background: rgba(255, 255, 255, 0.25);
          box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
          backdrop-filter: blur(1.5px);
          -webkit-backdrop-filter: blur(1.5px);
          border-radius: 10px;
          border: 1px solid rgba(255, 255, 255, 0.18);
        }

        #modal .modal-window {
          background: #48EDC6;
          box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
          backdrop-filter: blur( 13.5px );
          -webkit-backdrop-filter: blur( 13.5px );
          border-radius: 10px;
          border: 1px solid rgba( 255, 255, 255, 0.18 );
          width: 900px;
          height: 450px;
          position: relative;
          top: -100px;
          padding: 10px;
        }

        #modal .title {
          padding-left: 10px;
          display: inline;
          text-shadow: 1px 1px 2px gray;
          color: white;
        }

        #modal .title h2 {
          display: inline;
          font-size: 40px;
        }

        #modal .close-area {
          display: inline;
          float: right;
          padding-right: 10px;
          cursor: pointer;
          text-shadow: 1px 1px 2px gray;
          color: white;
        }

        #modal .content {
          margin-top: 20px;
          padding: 0px 10px;
          text-shadow: 1px 1px 2px gray;
          color: white;
          font-size: 25px;
        }

        .content>table{
          margin-top:50px;
        }

        .content>table>tbody>tr {
          height: 50px;
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
      let userId = '${loginUser.userId}';

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

          /* 일반결제 */
          payBtn.addEventListener('click', () => {
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({
            pg : 'html5_inicis.INIpayTest', // 일반결제, 인증결제
            pay_method : 'card',
            merchant_uid: 'pay_'+new Date().getTime(), // 상점에서 관리하는 주문 번호
            name : '일반 이용권',
            amount : 200,
            buyer_email: '${loginUser.userId}',
          }, rsp => {
              if (rsp.success) { // 결제되고 돈 빠져나갔으면 아임포트 서버와 대조하여 검증해야 함
                console.log('rsp 불러와집니다요')
                $.ajax({
                  url: 'verify.pay/'+ rsp.imp_uid,
                  type: 'POST'
                }).done(data => {
                  console.log('data 불러와집니다요');
                  if(rsp.paid_amount === data.response.amount){
                      $.ajax({
                        url:'insert.pay',
                        method:'get',
                        data: {payNo: rsp.imp_uid,
                              payOrderNo: rsp.merchant_uid,
                              userNo: ${loginUser.userNo},
                              payment: rsp.paid_amount,
                              payUrl: rsp.receipt_url}
                      }).done(data => { // insert.pay로 요청 보내서 데이터 insert 성공하면 돌릴 로직
                        alert('결제가 성공적으로 완료되었습니다.')
                        location.href="/ufo"
                        console.log('data :'+data);
                });
                  }else {
                    alert('결제정보 검증 처리 중 문제가 발생했습니다.');
                  }
                })
              } else {
                console.log(rsp.error_msg);
              }
            });
          });
        });
        
        /* 정기결제 */
        regOpt.addEventListener('click',() => {
          modalOn();
          if($(payOpt).css('backgroundColor','#64FFDA')){
            changeColor(payOpt,'','white');
          }

          changeColor(regOpt, '#64FFDA', 'black');
          $(payBtn).attr('disabled',false);

          payBtn.addEventListener('click', () => {
            $.ajax({
              url: 'regRequest.pay',
              data: {
                pg:'html5_inicis.INIBillTst',
                merchant_uid: 'reg_'+new Date().getTime(),
                amount: 100,
                card_number: $('#cardNum1').val()+'-'+$('#cardNum2').val()+'-'+$('#cardNum3').val()+'-'+$('#cardNum4').val(),
                expiry: $('#expiry').val(),
                birth: $('#birth').val(),
                pwd_2digit: $('#pwd_2digit').val(),
                customer_uid: userId.substr(0,userId.indexOf('@')),
                name: '정기구독권',
                buyer_email: '${loginUser.userId}',
              },
              error: (() => {console.log('결제요청 불가능')})
            }).done((rsp) => {
              console.log(rsp);
            });
          });
        });
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

    <!-- 모달창 시작 -->
    <div id="modal" class="modal-overlay" style="display:none;">
      <div class="modal-window">
        <div class="title">
          <h2>카드정보 입력(필수)</h2>
        </div>
        <div class="close-area">X</div>
        <div class="content">
          <table>
              <tr>
                <th>카드번호</th>
                <td><input type="text" id="cardNum1" placeholder="0000" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4"></td>
                <td><input type="text" id="cardNum2" placeholder="0000" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4"></td>
                <td><input type="text" id="cardNum3" placeholder="0000" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4"></td>
                <td><input type="text" id="cardNum4" placeholder="0000" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4"></td>
              </tr>
              <tr>
                <th>유효기간</th>
                <td colspan="4"><input type="text" id="expiry" placeholder="YYYY/MM" oninput="this.value = this.value.replace(/[^0-9/]/g, '').replace(/(\..*)\./g, '$1');"maxlength="7"></td>
              </tr>
              <tr>
                <th>비밀번호</th>
                <td colspan="4"><input type="password" id="pwd_2digit" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" placeholder="비밀번호 앞 2자리" maxlength="2"></td>
              </tr>
              <tr>
                <th>생년월일</th>
                <td colspan="4"><input type="text" id="birthday" placeholder="YYMMDD(6자리)" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="6"></td>
              </tr>
            </table>

            <div style="margin-top:20px; margin-right:30px; float:right;">
              <p id="emptySpace" style="color:red; display:none; font-size: 15px;">* 작성되지 않은 공간이 있습니다.</p>
              <button id="cardConfirm" type="button" class="btn text-black" style="background-color: #64FFDA; font-weight: bolder;">확인</button>
              <button id="cardCancel" type="button" class="btn text-white" style="background-color: rgb(62, 77, 104); font-weight: bolder;">취소</button>
            </div>
        </div>
      </div>
    </div>
    <!-- 모달창 종료 -->

    <script>
			const modal = document.getElementById("modal")
			const cardConfirm = document.getElementById('cardConfirm');
      const cardCancel = document.getElementById('cardCancel');
      const cardInfo = [
                       document.getElementById('cardNum1'),
                       document.getElementById('cardNum2'),
                       document.getElementById('cardNum3'),
                       document.getElementById('cardNum4'),
                       document.getElementById('expiry'),
                       document.getElementById('pwd_2digit'),
                       document.getElementById('birthday')
      ];
      const emptySpace = document.getElementById('emptySpace');

			function modalOn() {
			  modal.style.display = "flex"
			}
			
			function isModalOn() {
			  return modal.style.display === "flex"
			}
			
			function modalOff() {
			  modal.style.display = "none"
			}
			
      const emptySpaceChecker = (cardInfo) => {
        for(let i=0; i<cardInfo.length; i++) {
          if(cardInfo[i].value === "" || cardInfo[i].value === null){
            emptySpace.style.display = 'flex';
            cardInfo[i].focus();
            break;
          }else{
            modalOff();
          }
        }
      };

			const btnModal = document.getElementById("btn-modal")
			
			const closeBtn = modal.querySelector(".close-area")
			
			closeBtn.addEventListener("click", e => {
			  modalOff();
			})
			
			modal.addEventListener("click", e => {
			  const evTarget = e.target
			  
			  if(evTarget.classList.contains("modal-overlay")) {
			    modalOff()
			  }
			})

      cardConfirm.addEventListener('click', () => {
        emptySpaceChecker(cardInfo);
      })

      cardCancel.addEventListener('click', modalOff);
	</script>
  </body>
</html>