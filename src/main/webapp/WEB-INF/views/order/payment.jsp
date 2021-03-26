<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새늘봄 - checkout</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/order/orderstyle.css">
</head>
<script>

</script>
<body>
<%@ include file="../main/header.jspf" %>
<div class="container">
    <!-- 헤더 -->
    <div class="checkout_wrap">
        <div class="navi" tabindex="-1">
            <ol class="process">
                <div class="step"><span class="order"><b>1</b><span class="desc">편지 추가</span></span></div>
                <div class="step"><span class="order"><b>2</b><span class="desc">주소 입력</span></span></div>
                <div class="step current"><span class="order"><b>3</b><span class="desc">결제</span></span></div>
            </ol>
        </div>

    <div class="checkout_content">
        <div class="process">
            <div class="step" id="okCheckout">

                <!-- 폼 시작-->
                <form action="" method="post">
                <div class="infomation_box">
                    <div class="checkout_finals">
                        <div class="check_row"><span class="label">마지막으로 다시 한 번 주문내역을 확인해보세요.</span></div>

                        <!-- 주문내역 -->
                        <div class="checkout_cartlist">
                            <div class="head"><span class="delivery">수령일</span>
                                <span class="product">상품명</span><span class="price">가격</span></div>
                            <div class="cartlist_wrap">
                                <div id="cartlist_wrapper_final">
                                    <div id="cartlist_wrapper" class="cartlist_wrap">
                                        <div class="item">
                                            <h4 class="delivery_date">
                                                <span class="label">수령일</span><span class="val">2021-03-27</span></h4>
                                            <h5 class="delivery_title"><span class="label">상품명</span>
                                                <span class="val">폴인로즈 에디션</span></h5>
                                            <div class="delivery_goods">
                                                <div class="row">
                                                    <div class="list_good_checkout">
                                                        <div class="good">
                                                            <div class="photo">
                                                                <a href="#" class="img" title="폴인로즈 에디션">
                                                                    <!-- <img src="images/0_1.png" class="rounded float-start" alt="..."> -->
                                                                    <img src="/static/image/oitem/0_1.png" class="image_size">
                                                                </a>
                                                            </div>
                                                            <div class="detail">
                                                                <span class="content_category"></span>
                                                                <span class="name">폴인로즈 에디션</span>
                                                                <div class="option">
                                                                    <span class="l"><span class="label"><i>수량 : </i>1</span></span>
                                                                </div>
                                                                <div class="option">
                                                                    <span class="l"><span class="label"><i></i>편지 추가</span></span>
                                                                </div>
                                                                <div class="option">
                                                                    <span class="l"><span class="label"><i></i><span>화이트 화병[1]</span></span></span>
                                                                </div>
                                                                <span class="price">
                                                                    <span class="label">가격</span>
                                                                    <span class="val">69,300원</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="list_good_price">
                                                        <span class="price"><span>69,300원</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
    <!---------------------------------------------- 주소입력부분 ------------------------------------------------------->

    <%--                <form action="order/payment" method="post">--%>
                        <div class="check_row under"><span class="label">배송 주소</span></div>
                        <table class="address_input_table in_s4 w450">
                            <tbody>
                            <tr>
                                <td><span class="detail"><span class="th">수령인 이름</span><span class="td">
                                    <input readonly type="text" value="권유나"></span></span></td>
                            </tr>
                            <tr>
                                <td><span class="detail"><span class="th">수령인 연락처</span><span class="td">
                                    <input readonly type="text" value="010-5847-1880"></span></span></td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="check_unknow"><span class="label">익명처리여부</span><span class="val">실명배송</span>
                        </div>

                        <!-- 쿠폰, 적립금 -->
                        <table class="address_input_table in_s4 w450">
                            <tbody>
                            <tr>
                                <td>
                                    <span class="detail"><span class="th">쿠폰 할인</span><span class="td_coupon">
                                        <input type="text" autocomplete="off" maxlength="128"
                                               name="coupon_code" id="input_my_coupon" placeholder="코드를 입력해주세요" value="">
                                        <button type="button" class="btns add">적용</button>
                                    </span>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="detail"><span class="th">적립금</span>
                                    <span class="td_savings">
                                        <input type="number" min="0" name="point" id="input_my_point"
                                               placeholder="0" autocomplete="off">
                                        <button type="button" class="btns add"
                                                data-checkout_price="69300">적용</button>
                                        <span class="text">* 사용 가능 포인트: 0</span>
                                    </span>
                                    </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="check_row_table">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    상품<span>69,300 원</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    배송비<span>-0 원</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    쿠폰할인<span>-0 원</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    포인트할인<span>-0 원</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    등급할인<span>-0 원</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center"
                                    id="total_color">
                                    <strong class="total_color">총 결제금액</strong>
                                    <strong class="total_color">69,300 원</strong>
                                </li>
                            </ul>
                        </div>

                        <!-- 결제수단 선택 라디오 버튼 -->

                        <div class="check_row_method" id="check_row_method">
                            <div class="row"><span class="label">결제 수단 선택</span><span class="val">
                                <b class="total"></b></span></div>
                            <div class="row" style="width: 700px;">
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1"
                                           autocomplete="off" checked>
                                    <label class="btn btn-outline-primary id="btn-text" " for=" btnradio1">신용카드
                                    </label>
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2"
                                           autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio2">신용카드(직접입력)
                                    </label>
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
                                           autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio3">무통장입금
                                    </label>
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio4"
                                           autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio4">카카오페이
                                    </label>
                                </div>
                            </div>

                            <!-- 결제 정보 입력창 -->

                            <!-- 신용카드 -->
                            <div class="checkout_method_card" style="border-top: none; display: block;">
                                <div class="more">* 신용카드 정보를 직접 입력하여 간편하게 결제하실 수 있습니다. <br>* 꾸까에서는 절대 카드 정보를 직접 저장하지
                                    않습니다. <br>* 나이스 정보통신의 결제 기능을 사용합니다. <br>* 기명 법인카드의 경우, 소유하신 분의 주민등록번호 앞자리를
                                    입력해주세요. <br>* 무기명 법인카드의 경우, 사업자 등록번호를 입력해 주세요.</div>
                                <table class="address_input_table in_s4 w450">
                                    <caption class="blind"></caption>
                                    <tbody>
                                    <tr>
                                        <td><span class="detail add_200721"><span class="th">카드 번호</span><span
                                                class="td_card">
                                                                <div class="card_number" style="width: 24%;"><input
                                                                        maxlength="4" name="card_num_1" id="card_num_1"
                                                                        type="text" data-type="card_number" data-index="0"
                                                                        autocomplete="off" value=""></div><span class="d"
                                                                                                                style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 23%;"><input
                                                                        maxlength="4" name="card_num_2" id="card_num_2"
                                                                        data-type="card_number" data-index="1"
                                                                        type="password"
                                                                        class="ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                                        aria-haspopup="true" role="textbox"
                                                                        autocomplete="off" readonly="readonly" value="">
                                                                </div><span class="d" style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 23%;"><input
                                                                        maxlength="4" name="card_num_3" id="card_num_3"
                                                                        data-type="card_number" data-index="2"
                                                                        type="password"
                                                                        class="ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                                        aria-haspopup="true" role="textbox"
                                                                        autocomplete="off" readonly="readonly" value="">
                                                                </div><span class="d" style="width: 2%;">-</span>
                                                                <div class="card_number" style="width: 24%;"><input
                                                                        maxlength="4" name="card_num_4" id="card_num_4"
                                                                        data-type="card_number" data-index="3" type="text"
                                                                        class="form-control form-control-small"
                                                                        autocomplete="off" value=""></div>
                                                            </span></span></td>
                                    </tr>
                                    <tr>
                                        <td><span class="detail add_200721"><span class="th">유효 기간
                                                                (년/월)</span><span class="td_phone"><select
                                                class="form-control form-control-small"
                                                name="card_exp_year" id="card_exp_year"
                                                data-type="card_valid" data-index="0"
                                                style="width: 48%;">
                                                                    <option value="2021">2021</option>
                                                                    <option value="2022">2022</option>
                                                                    <option value="2023">2023</option>
                                                                    <option value="2024">2024</option>
                                                                    <option value="2025">2025</option>
                                                                    <option value="2026">2026</option>
                                                                    <option value="2027">2027</option>
                                                                    <option value="2028">2028</option>
                                                                    <option value="2029">2029</option>
                                                                    <option value="2030">2030</option>
                                                                    <option value="2031">2031</option>
                                                                    <option value="2032">2032</option>
                                                                    <option value="2033">2033</option>
                                                                    <option value="2034">2034</option>
                                                                    <option value="2035">2035</option>
                                                                </select><span class="d" style="width: 4%;">-</span><select
                                                class="form-control form-control-small"
                                                name="card_exp_month" id="card_exp_month"
                                                data-type="card_valid" data-index="1"
                                                style="width: 48%;">
                                                                    <option value="01">01</option>
                                                                    <option value="02">02</option>
                                                                    <option value="03">03</option>
                                                                    <option value="04">04</option>
                                                                    <option value="05">05</option>
                                                                    <option value="06">06</option>
                                                                    <option value="07">07</option>
                                                                    <option value="08">08</option>
                                                                    <option value="09">09</option>
                                                                    <option value="10">10</option>
                                                                    <option value="11">11</option>
                                                                    <option value="12">12</option>
                                                                </select></span></span></td>
                                    </tr>
                                    <tr>
                                        <td><span class="detail add_200721"><span class="th">주민등록번호
                                                                앞자리</span><span class="td" style="width: 48%;"><input
                                                autocomplete="off"
                                                class="form-control form-control-small" maxlength="10"
                                                name="card_id" id="card_id" type="text"
                                                data-type="card_id" data-index="1"
                                                value=""></span></span></td>
                                    </tr>
                                    <tr>
                                        <td><span class="detail add_200721"><span class="th">비밀번호 앞
                                                                두자리</span><span class="td" style="width: 48%;"><input
                                                autocomplete="off"
                                                class="form-control form-control-small ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-lockedinput"
                                                id="card_password" maxlength="2" name="card_password"
                                                type="password" aria-haspopup="true" role="textbox"
                                                data-type="card_password" data-index="0"
                                                readonly="readonly"></span></span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>



                            <!-- 무통장 입금 -->
                            <div id="mootong" class="checkout_method_more" style="display: block;">
                                <div class="more">입금자명 <input type="text" name="pre-mootong-name"
                                                              id="pre-mootong-name" value=""> 미기재시 주문자명으로 자동 반영</div>
                                <div class="noti">* 주문 후 72시간동안 미 입금시 자동 주문 취소됩니다.</div>
                                <div class="recept_money">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">개인소득공제용</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">사업자증빙용</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                        <label class="form-check-label" for="inlineRadio3">미신청</label>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div class="complete"><button type="button" class="info_btn next" id="purchase_submit"><span>
                        결제 하기</span></button><button type="button" class="info_btn back" onclick="history.back()">
                        <span>이전 단계로</span></button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>

<%@ include file="../main/footer.jspf"%>
</body>
</html>
