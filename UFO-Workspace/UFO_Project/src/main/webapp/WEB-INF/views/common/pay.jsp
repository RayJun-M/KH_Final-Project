<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ur Favorite OTT</title>

    <!-- jQuery 라이브러리 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- Bootstrap 프레임워크 연결 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #content_container {
		margin-left : 8%;
		margin-right : 8%;
	}
    #content_container a {
    	text-decoration: none;
    	color: gray;
    }
    
    #footer_navi>div {
    	display: inline-block;
    	width: 24%;
    	margin-top: 25px;
    	font-size: 20px;
    	padding: 10px;
		text-align: center;
    }
    #footer_navi {
    	border-bottom: 1px solid gray;
    	margin-bottom: 3%;
    }
    
    #selected_tab {
    	border-bottom:3px solid #64FFDA;
    }
    #selected_tab a {
    	color: white;
    	font-weight: bold;
    }
    
    #policy_wrap {
    	color: #a5a5a5;
    	background-color: #252525;
    	padding: 3%;
    	margin-top: 30px;
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

		
        <!-- 컨텐츠 영역 (개별 구현 구역) -->
        <div id="content_container">
        
			<div id="footer_navi">
		        <div><a href="about.agree">ABOUT</a></div>
		        <div><a href="service.main">서비스 이용약관</a></div>
		        <div id="selected_tab"><a href="pay.main">유료상품 이용약관</a></div>       
		        <div><a href="personal.main">개인정보 처리방침</a></div>
			</div>
           
           	<h4><b>유료상품 이용약관</b> <small>시행일자 : 2022-01-26</small></h4>
           
          	<div id="policy_wrap">
          	
	          	<div id="policy_content">
	          		<p>제 1 조 [목적] <br>
					이 약관은 UFO 주식회사(이하 회사)가 제공하는 유무선 인터넷 유료서비스 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다. <br>
	          		</p>
	          		<p>제 2 조 [정의] <br>
					이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
					1. 해지 : 회사 또는 회원이 서비스 개통 후 이용 계약을 해약하는 것을 말합니다. <br>
					2. 유료서비스: 유료서비스라 함은 회원이 회사에 일정 금액을 지불해야만 이용할 수 있는 회사의 서비스 또는 상품을 의미하거나, 회사 또는 제3자와의 거래 내지 약정 조건을 수락하는 대가로 이용하게 되는 회사의 서비스 또는 상품을 의미합니다. 유료서비스의 세부내용은 각각의 서비스 또는 상품 구매 페이지 및 해당 서비스 또는 상품의 결제 페이지에 상세히 설명되어 있으며 안내된 내용을 바탕으로 이용가능합니다. <br>
					3. 결제: 회사가 제공하는 유료서비스를 이용하기 위하여 각종 지불수단을 통하여 일정 금액을 회사 또는 회사가 정한 제3자에 지불 하는 것을 의미합니다. <br>
					4. 구매 : 회사가 유료서비스에 대한 이용 승낙 및 유료서비스 제공이 가능할 수 있도록 회원이 이용하고자 하는 유료서비스를 선택하여 해당 유료서비스의 가액과 동일한 코인의 차감을 청구하거나 지불수단을 통한 결제로써 그 대가를 지급하는 행위를 의미합니다. <br>
	          		</p>
	          		<p>제 3 조 [유료서비스 내용 게시] <br>
					1. 회사는 다음 사항을 해당 유료서비스의 이용초기화면이나 그 포장에 회원이 알기 쉽게 표시합니다. <br>
					① 유료서비스의 명칭 또는 제호 <br>
					② 유료서비스의 제작 및 표시 연월일 <br>
					③ 유료서비스 제작자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호 <br>
					④ 유료서비스의 내용, 이용방법, 이용료 기타 이용조건 <br>
					2. 회사는 유료 서비스별 이용가능기기 및 이용에 필요한 최소한의 기술사양에 관한 정보를 계약체결과정에서 회원에게 제공합니다. <br>
	          		</p>
	          		<p>제 4 조 [이용계약의 성립 등] <br>
					1. 회원은 회사가 제공하는 다음 또는 이와 유사한 절차에 의하여 이용신청을 합니다. <br> 회사는 계약 체결 전에 각 호의 사항에 관하여 회원이 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.
					①유료서비스 확인 및 선택 <br>
					②결제방법의 선택 및 결제정보의 입력 <br>
					③유료서비스의 이용신청에 관한 확인 또는 회사의 확인에 대한 동의 <br>
					2. 회사는 회원의 이용신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다. <br>
					①실명이 아니거나 타인의 명의를 이용한 경우 <br>
					②허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우 <br>
					③미성년자가 청소년보호법에 의해서 이용이 금지되는 콘텐츠를 이용하고자 하는 경우 <br>
					④서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우 <br>
					3. 이용계약의 성립시기는 "가입완료", "구매완료"를 신청절차 상에서 표시한 시점으로 합니다. <br>
					4. "회원"이 유료서비스를 이용하기 위해서는 이 약관에 동의 후 각 서비스에 따른 이용조건에 따라 이용요금을 지급하여야 합니다. <br>
	          		</p>
	          		<p>제 5 조 [미성년자 이용계약에 관한 특칙] <br>
					회사는 만 20세 미만의 미성년이용자가 유료서비스를 이용하고자 하는 경우에 부모 등 법정 대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다. <br>
	          		</p>
	          		<p>제 6 조 [유료서비스 및 범위] <br>
					1. 회사가 회원에게 제공하는 유료서비스의 종류는 아래와 같습니다. <br>
					①서비스 속성에 따른 분류 <br>
					(ㄱ) 스트리밍 서비스: 회사가 콘텐츠를 온라인 스트리밍 방식으로 제공하는 서비스 <br>
					(ㄴ) 다운로드 서비스: 회사가 콘텐츠를 다운로드 방식으로 제공하는 서비스 <br>
					② 자동결제 여부에 따른 분류 <br>
					(ㄷ) 기간제 상품: 회원이 VOD 서비스를 이용하고자 하는 기간 동안만 이용할 수 있는 상품 <br>
					(ㄹ) 자동결제 상품: 서비스를 이용하는 회원이 정기적으로 유료서비스 이용 요금을 회사에 결제하기로 신청한 경우 회원이 지정한 결제 일자 및 수단으로 유료서비스의 이용 요금이 자동으로 결제되는 상품 <br>
					③ 판매 방식에 따른 분류 <br>
					(ㅁ) 직접판매 : 회사가 제공하는 유료서비스를 회원에게 결제 수단을 통해 직접 제공하는 방식을 말합니다. <br>
					(ㅂ) 대행판매 : 회사가 제공하는 유료서비스를 제3자를 통해 판매하는 방식으로 해당 판매 상품의 이용 방식은 제휴사가 제공하는 유료서비스 안내에 따릅니다. <br>
					2. 서비스에서 제공되는 콘텐츠는 방송사별, 국가별로 라이선스 정책이 달라 이용 가능 콘텐츠의 수량과 정책이 다를 수 있습니다. <br>
					회사는 기간제 상품에 가입할 때 회원으로부터 가입안내 또는 팝업안내로 추가적인 고지와 동의를 얻어 서비스를 가입시킬 수 있고, 회원은 동의 후에 상품의 지역제한이나 이용 콘텐츠의 제한으로 환불 요청이 있을 경우, 제12조(환불정책) 기준에 따릅니다. 회사는 저작권 문제 또는 기타 사업권역 문제로 서비스 및 콘텐츠 제공을 제한할 수 있습니다.이때 회사는 회원이 이미 대금 결제를 통해 이용 기간이 확정된 서비스를 받고 있는 잔여기간에 대한 서비스를 계속 제공 하여야 하나, 다른 회사와의 계약 등 외적 조건에 의해 부득의할 경우 전체 기간에 대한 잔여 기간의 비율을 계산하여 환불하는 것으로 합니다. 해외 가입 회원 여부는 IP주소 확인이나 회원 본인의 확인 등의 절차를 거치는 것으로 합니다. <br>
	          		</p>
	          		<p>제 7 조 [결제방식] <br>
					1. 유료서비스의 이용에 대한 대금지급방법은 다음 각 호의 방법 중 가능한 방법으로 할 수 있습니다. 다만, 회사는 회원의 지급방법에 대하여 어떠한 명목의 수수료도 추가하여 징수하지 않습니다. <br>
					①직불카드, 신용카드 등의 각종 카드결제 <br>
	          		</p>
	          		<p>제 8 조 [자동결제 및 해지] <br>
					1.회사는 매월 서비스 이용계약의 자동갱신 및 이용요금 청구를 위해 서비스 이용기간 및 서비스 이용 기간 종료 후 일정기간 동안 회원의 결제관련정보를 보유할 수 있습니다. <br>
					2.회원이 자동결제를 신청하시면 별도의 해지 신청을 하지 않을 경우, 유료서비스의 실제 이용 여부와 상관없이 매월 지정된 결제 일자 및 수단으로 자동 청구 및 결제됩니다. (최초 결제일 익일 1일차부터 서비스 일수로 계산) <br>
					3.자동결제해지로 인한 “만료일은 자동결제일로부터 1개월 입니다. 자동결제해지 시 회원은 정기 결제일로 부터 1개월 동안 서비스를 이용할 수 있습니다. <br>
					4.타인의 결제 정보를 동의 없이 사용할 경우 민/형사상 책임을 지게 되며 관계법령에 의해 처벌될 수 있습니다. <br>
					5.결제 정보 변경, 신용카드 분실, 기타의 사유로 정기결제가 이루어지지 않을 경우 마지막 정기결제일로부터 1개월 이 지난 후 서비스 이용이 자동 정지됩니다. <br>
					6.회원의 이용요금 미납 등 귀책사유로 인한 정기결제중지 및 이에 따른 서비스 이용정지로 인한 손해에 대해 회사는 책임을 지지 않습니다. <br>
	          		</p>
	          		<p>제 9 조 [회원의 청약철회와 결제취소] <br>
					1.회사와 유료서비스의 이용에 관한 계약을 체결한 회원은 수신확인의 통지를 받은 날로부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 회사가 다음 각 호중 하나의 조치를 취한 경우에는 회원의 청약철회권이 제한될 수 있습니다. <br>
					①스트리밍/다운로드 등의 방식으로 상품에 해당하는 콘텐츠의 제공이 개시된 경우 <br>
					②이벤트 등으로 제공한 재화 등이 회원의 책임이 있는 사유로 멸실되거나 훼손된 경우 회원의 사용 또는 일부 소비로 가치가 현저하게 감소한 경우, 시간이 지나 다시 판매하기 곤란할 정도로 가치가 현저히 감소한 경우, 복제가 가능한 재화 등의 포장을 훼손한 경우 <br>
					③회원이 프로모션 등을 통해 무료/무상으로 취득하는 등 회원이 직접 비용을 지불하지 아니하고 이용하는 경우 <br>
					2.제1항의 청약철회는 회원이 전화, 전자우편 또는 모사전송으로 회사에 그 의사를 표시한 때에 효력이 발생합니다. <br>
					3.회사는 제1항에 따라 회원이 표시한 청약철회의사표시를 수신한 후 지체 없이 이러한 사실을 회원에게 회신합니다. <br>
					4.회원은 이용신청을 철회한 경우 회원이 선택한 각각의 결제방식에 따라 회사에 해당 결제취소처리를 신청할 수 있습니다. 다만, 각 호의 경우에는 결제취소처리가 불가능합니다. <br>
					①해당 기간 내에 사용내역이 있을 경우 <br>
					②해당 결제수단에 따른 결제취소 가능기간을 경과한 경우 <br>
					5.결제취소처리가 불가능한 결제방식(계좌이체 등)을 이용해서 유료서비스를 결제한 경우, 이 경우는 본 약관 제12 조에 따라 환불처리만 가능합니다. <br>
					6.결제방식에 따른 결제취소 가능기간은 다음과 같으며, 결제취소 가능기간이 경과한 경우 결제취소처리가 불가능합니다. 단, 아래 각 호는 관련업체의 사정에 따라 변경될 수 있습니다. <br>
					①신용카드 : 결제당일 ~ 2개월(60일) 이내에 결제취소가 가능합니다. 단, 각각의 해당 신용카드사의 정책에 따라 취소가능기간이 다를 수 있습니다. <br>
	          		</p>
	          		<p>제 10 조 [회원의 계약해제·해지] <br>
					1.회사는 회원이 청약철회의 의사표시를 한 날로부터 또는 회원에게 계약해제·해지의 의사표시에 대하여 회신한 날로부터 3영업일 이내에 대금의 결제와 동일한 방법으로 이를 환급하여야 하며, 동일한 방법으로 환불이 불가능할 때에는 이를 사전에 고지하여야 합니다. <br>
					2.회사가 제1항에 따라 환급할 경우에 회원이 서비스이용으로부터 얻은 이익에 해당하는 금액을 공제하고 환급할 수 있습니다. <br>
					3.회사는 위 대금을 환급함에 있어서 회원이 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다. 다만, 제2항의 금액공제가 필요한 경우에는 그러하지 아니할 수 있습니다. <br>
					4.회사, “유료서비스 등의 대금을 지급 받은 자” 또는 “회원과 유료서비스 이용계약을 체결한 자“가 동일인이 아닌 경우에 각자는 청약철회 또는 계약해제·해지로 인한 대금환급과 관련한 의무의 이행에 있어서 연대하여 책임을 집니다. <br>
	          		</p>
	          		<p>제 11 조 [과오금] <br>
					1.회사는 과오금이 발생한 경우 이용대금의 결제와 동일한 방법으로 과오금 전액을 환불하여야 합니다. 다만, 동일한 방법으로 환불이 불가능할 때는 이를 사전에 고지합니다. <br>
					2.회사의 책임 있는 사유로 과오금이 발생한 경우 회사는 계약비용, 수수료 등에 관계없이 과오금 전액을 환불합니다. 다만, 회원의 책임 있는 사유로 과오금이 발생한 경우, 회사가 과오금을 환불하는 데 소요되는 비용은 합리적인 범위 내에서 회원이 부담하여야 합니다. <br>
					3.회사는 회원이 주장하는 과오금에 대해 환불을 거부할 경우에 정당하게 이용대금이 부과되었음을 입증할 책임을 집니다. <br>
					4.회사는 과오금의 환불절차를 디지털 콘텐츠 이용자 보호지침에 따라 처리합니다. <br>
	          		</p>
	          		<p>제 12 조 [콘텐츠하자 등에 의한 이용자피해보상] <br>
					회사는 유료서비스 하자 등에 의한 이용자피해보상의 기준·범위·방법 및 절차에 관한 사항을 디지털콘텐츠 이용자 보호지침에 따라 처리합니다. <br>
	          		</p>
	          		<p>제 13 조 [분쟁의 해결] <br>
					회사는 분쟁이 발생하였을 경우에 회원이 제기하는 정당한 의견이나 불만을 반영하여 적절하고 신속한 조치를 취합니다. 다만, 신속한 처리가 곤란한 경우에 회사는 회원에게 그 사유와 처리일정을 통보합니다. <br>
	          		</p>
	          		<p>제 16 조 (준거법 및 관할법원)
					1. 회사와 회원간에 제기된 소송에 대해서는 대한민국 법률을 준거법으로 합니다. <br>
					2. 회사와 회원간 발생한 분쟁에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 회원의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다. <br>
	          		</p>
	          	</div>
	          	
	          	<br><br>
	          	
          		<p>부칙 <br>
				(시행일) 이 약관은 2022년 1월 26일부터 시행합니다.
				</p>
			</div>
		</div>

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />
        
	</div>
</body>
</html>