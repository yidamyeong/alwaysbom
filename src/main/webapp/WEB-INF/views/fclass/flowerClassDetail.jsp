<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>클래스 상세페이지</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/fclass/classDetail.css">
    <link rel="stylesheet" href="/static/bootstrap-datepicker/bootstrap-datepicker.css">
<script src="/static/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script>
    function moveToTop() {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    }

    async function findBranch() {
        const idx = document.querySelector("#branchSelectArea input[type=radio]:checked").value;

        const response = await fetch("/fclass/api/branches/" + idx);
        const result = await response.json();
        const imgTag = document.querySelector("#branchMapImg");
        imgTag.setAttribute('src', result.mapImage);
    }

    document.addEventListener("DOMContentLoaded", function () {
        findBranch();
        checkValidDate();
    });
</script>
</head>
<body>
<%@ include file="../main/header.jspf"%>

<!-- 맨위로 가는 버튼 -->
<button type="button" id="moveToTop" onclick="moveToTop()">
    <i class="far fa-arrow-alt-circle-up"></i>
</button>

<!-- 메인 컨테이너 -->
<div id="container" class="mx-auto d-flex flex-column">

    <!-- 메뉴 경로 표시 -->
    <nav id="bread-nav" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb mb-3">
            <li class="breadcrumb-item"><a href="/">HOME</a></li>
            <li class="breadcrumb-item"><a href="/fclass/classList">플라워클래스</a></li>
            <li class="breadcrumb-item active" aria-current="page">${fclassVo.name}</li>
        </ol>
    </nav>

    <!-- 상품 썸네일과 주문 정보 -->
    <div class="d-flex justify-content-between thumb-order">
        <!-- 사진 썸네일 -->
        <div class="thumbnails d-flex flex-column justify-content-start">
            <div id="item-thumbnails" class="carousel slide mb-4" data-bs-interval="0" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${fclassVo.image1}" class="d-block w-100" alt="대표 썸네일">
                    </div>
                    <c:if test="${not empty fclassVo.image2}">
                    <div class="carousel-item">
                        <img src="${fclassVo.image2}" class="d-block w-100" alt="대표 썸네일">
                    </div>
                    </c:if>
                    <c:if test="${not empty fclassVo.image3}">
                    <div class="carousel-item">
                        <img src="${fclassVo.image3}" class="d-block w-100" alt="대표 썸네일">
                    </div>
                    </c:if>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#item-thumbnails" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#item-thumbnails" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div> <!-- id="item-thumbnails" 닫기 -->

            <!-- 3개 한 줄에 일렬로 나오는 썸네일 -->
            <div class="d-flex">
                <button type="button" data-bs-target="#item-thumbnails" data-bs-slide-to="0"
                        class="active col-4 p-0 pe-3 border-0 bg-transparent m-0" aria-current="true" aria-label="Slide 1">
                    <img src="${fclassVo.image1}" alt="썸네일1" class="w-100">
                </button>
                <c:if test="${not empty fclassVo.image2}">
                    <button type="button" data-bs-target="#item-thumbnails" data-bs-slide-to="1"
                            class="col-4 p-0 ps-2 pe-2 border-0 bg-transparent m-0" aria-label="Slide 2">
                        <img src="${fclassVo.image2}" alt="썸네일2" class="w-100">
                    </button>
                </c:if>
                <c:if test="${not empty fclassVo.image3}">
                    <button type="button" data-bs-target="#item-thumbnails" data-bs-slide-to="2"
                            class="col-4 p-0 ps-3 border-0 bg-transparent m-0" aria-label="Slide 3">
                        <img src="${fclassVo.image3}" alt="썸네일3" class="w-100">
                    </button>
                </c:if>
            </div>
        </div> <!-- 사진 썸네일 닫기 -->

        <!-- 주문 정보 -->
        <form class="order-info d-flex flex-column" action="/fclass/payment">
            <span class="subheader">${fclassVo.subheader}</span>
            <span class="item-name">${fclassVo.name}</span>

            <!-- 가격 정보 -->
            <div class="d-flex justify-content-start align-items-center pb-4 border-bottom" style="border-bottom-color: #9d9d9d">
                <c:if test="${not empty fclassVo.discountRate && fclassVo.discountRate > 0}">
                <span class="discount-rate text-danger pe-2">${fclassVo.discountRate}%</span>
                <span class="original-price text-decoration-line-through pe-2">
                        <fmt:formatNumber value="${fclassVo.price}" pattern="#,###원 >"/>
                </span>
                </c:if>
                <span class="fs-3 fw-500">
                    <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 구매옵션 -->
            <div class="row inputs-wrap mb-4 pt-3">
                <!-- 지점 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw-500 pt-1">지점</div>
                    <div id="branchSelectArea" class="col-9" role="group">
                        <c:forEach var="branch" items="${branchList}" varStatus="status">
                        <label>
                            <input type="radio" ${status.index eq 0 ? "checked" : ""}
                                   id="branchIdx" name="branchIdx" value="${branch.idx}"
                                   class="branchBtn border p-2 rounded-3 btn-check" onchange="findBranch()">
                            <span class="btn btn-outline-warning text-dark me-1">
                                    ${branch.name}
                            </span>
                        </label>
                        </c:forEach>
                    </div>
                </div>
                <!-- 수업일 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw-500 pt-1">수강일</div>
                    <div class="col-9">
                        <input type="text" placeholder="수업 날짜를 선택해주세요."
                               class="schedule-datepicker col-12 p-2 ps-3 fs-6"
                               id="scheduleDate"
                               onclick="checkValidDate()"
                               onchange="scheduleChangeEventHandler(this.value)"
<%--                               onchange="searchSchedule(this.value)"--%>
                               autocomplete="off" required="required"/>
                        <div>
                            <select id="scheduleSelect" name="scheduleIdx"
                                    onchange="checkRegCount()"
                                    class="form-select mt-3 text-secondary ps-3 py-2" disabled>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- 수강인원 선택 옵션 -->
                <div class="row mb-4">
                    <div class="col-3 fw-500">수강인원</div>
                    <div class="col-9 count d-flex justify-content-start align-items-center">
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(false)">
                            <i class="fas fa-minus-circle"></i>
                        </button>
                        <input id="regCount" name="regCount" class="quantity col-2 text-center border-0" value="1" readonly>
                        <button type="button" class="border-0 bg-transparent" onclick="adjustQuantity(true)">
                            <i class="fas fa-plus-circle"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- price box 그룹 -->
            <div class="price-box-wrap">
                <!-- 상품가격 price box -->
                <div class="d-flex justify-content-between p-4 mx-2 mb-3 price-box">
                    <span class="fw-500">클래스 수업가격</span>
                    <span id="classPrice" class="fw-500" data-fclass-price="${fclassVo.finalPrice}">
                        <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                    </span>
                </div>
            </div> <!-- price-box-wrap 닫기 -->

            <div class="d-flex justify-content-end align-items-baseline me-2 mb-4">
                <span class="me-3">총 주문금액</span>
                <span id="totalPrice" class="fw-bold fs-3">
                    <fmt:formatNumber value="${fclassVo.finalPrice}" pattern="#,###원"/>
                </span>
            </div>

            <!-- 결제 버튼 -->
            <div class="d-flex justify-content-center mt-5">
                <button type="submit" class="btn main-button fw-bold py-3">클래스 예약하기</button>
            </div>

        </form>
    </div>
    <!-- 상품설명/리뷰/클래스안내 Tabs -->
    <div class="d-flex showType-wrap">
        <label class="col-4">
            <input type="radio" name="showType" class="d-none" checked="">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#detail-area')">클래스 설명</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#review-area')">리뷰</span>
        </label>
        <label class="col-4">
            <input type="radio" name="showType" class="d-none">
            <span class="d-block text-center p-3 btn-show" onclick="animateScroll('#class-area')">수강안내</span>
        </label>
    </div>

    <!-- 상품설명 -->
    <div id="detail-area" class="mb-5 d-flex flex-column">
        <div class="d-flex flex-column align-items-center">${fclassVo.content}</div>

        <!-- 상품설명 -->
        <div class="d-flex flex-column align-items-center">
            <img id="branchMapImg" src="" alt="">
        </div>
    </div>

    <!-- 클래스 리뷰게시판 -->
    <div id="review-area" class="p-3">
        <!-- 리뷰게시판 타이틀 -->
        <div class="d-flex justify-content-between align-items-end">
            <div class="d-flex align-items-baseline">
                <span class="fs-2 fw-500 py-3 pe-5">리뷰</span>
                <span class="fs-5 c-666">리뷰 작성 시 200P 적립 (사진 등록 시 300P)</span>
            </div>
            <span class="fs-17"><a href="#" class="fw-500">리뷰 쓰기</a></span>
        </div>

        <!-- 리뷰 카테고리 -->
        <div class="d-flex align-items-baseline review-category col-12 mt-4">
            <label>
                <input type="radio" name="reviewCategory" class="d-none" checked="" onclick="switchCategory('#thisReview', '#bestReview')">
                <span class="d-block text-center py-3 px-4 btn-rev">클래스 베스트 리뷰</span>
            </label>
            <label>
                <input type="radio" name="reviewCategory" class="d-none" onclick="switchCategory('#bestReview', '#thisReview')">
                <span class="d-block text-center py-3 px-4 btn-rev">모든 클래스 리뷰</span>
            </label>
        </div>

        <div id="bestReview" class="accordion accordion-flush">
            <c:forEach var="best" items="${bestReview}" varStatus="status">
                <div class="accordion-item">
                    <div class="accordion-header" id="flush-heading${status.index}" role="button">
                        <div class="review-row collapsed d-flex justify-content-between p-4 fs-5"
                             data-bs-toggle="collapse" data-bs-target="#collapse${status.index}"
                             aria-expanded="false" aria-controls="collapse${status.index}">
                    <span class="col-2 fs-17 c-star ls-narrower text-warning">
                        <c:forEach begin="1" end="5" var="count">
                            <c:set var="halfStar" value="${true}"/>
                            <c:if test="${best.star >= count}">
                                <c:set var="faClassName" value="fas fa-star"/>
                            </c:if>
                            <c:if test="${best.star < count}">
                                <c:set var="faClassName" value="far fa-star"/>
                                <c:if test="${best.star + 1 > count and best.star % 1 > 0 and halfStar}">
                                    <c:set var="halfStar" value="${false}"/>
                                    <c:set var="faClassName" value="fas fa-star-half-alt"/>
                                </c:if>
                            </c:if>
                            <i class="${faClassName} fs-6"></i>
                        </c:forEach>
                    </span>
                    <span class="col-5 fs-17">
                        ${best.name}
                        <c:if test="${best.image != null}">
                        <span class="c-bbb ms-2">
                            <i class="fas fa-images text-secondary"></i>
                        </span>
                        </c:if>
                    </span>
                            <span class="col-2 text-center fs-6 fw-light">${best.memberId}</span>
                            <span class="col-2 text-center fs-6 fw-light">${best.regDate}</span>
                        </div>
                    </div>
                    <div id="collapse${status.index}" class="accordion-collapse collapse border-0"
                         aria-labelledby="flush-heading${status.index}" data-bs-parent="#bestReview"
                         style="padding-left: 196px;">
                        <div class="accordion-body px-5">
                            <span>${best.content}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="thisReview" class="accordion accordion-flush d-none">
            <c:forEach var="all" items="${allReview}" varStatus="status">
                <div class="accordion-item">
                    <div class="accordion-header" id="flush-heading${status.index}" role="button">
                        <div class="review-row collapsed d-flex justify-content-between p-4 fs-5"
                             data-bs-toggle="collapse" data-bs-target="#collapse${status.index}"
                             aria-expanded="false" aria-controls="collapse${status.index}">
                            <span class="col-2 fs-17 c-star ls-narrower text-warning">
                                <c:forEach begin="1" end="5" var="count">
                                    <c:set var="halfStar" value="${true}"/>
                                    <c:if test="${all.star >= count}">
                                        <c:set var="faClassName" value="fas fa-star"/>
                                    </c:if>
                                    <c:if test="${all.star < count}">
                                        <c:set var="faClassName" value="far fa-star"/>
                                        <c:if test="${all.star + 1 > count and all.star % 1 > 0 and halfStar}">
                                            <c:set var="halfStar" value="${false}"/>
                                            <c:set var="faClassName" value="fas fa-star-half-alt"/>
                                        </c:if>
                                    </c:if>
                                    <i class="${faClassName} fs-6"></i>
                                </c:forEach>
                            </span>
                            <span class="col-5 fs-17">
                                ${all.name}
                                <c:if test="${all.image != null}">
                                <span class="c-bbb ms-2">
                                    <i class="fas fa-images text-secondary"></i>
                                </span>
                                </c:if>
                            </span>
                            <span class="col-2 text-center fs-6 fw-light">${all.memberId}</span>
                            <span class="col-2 text-center fs-6 fw-light">${all.regDate}</span>
                        </div>
                    </div>
                    <div id="collapse${status.index}" class="accordion-collapse collapse border-0"
                         aria-labelledby="flush-heading${status.index}" data-bs-parent="#bestReview"
                         style="padding-left: 196px;">
                        <div class="accordion-body px-5">
                            <span>${all.content}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 배송안내 -->
    <hr>
    <div id="class-area" class="ps-3 my-4">
    <div class="fs-2 fw-500 py-3">수강안내</div>
        <div class="c-666 d-flex flex-column">
            <hr>
        <div class="fs-5 fw-500 mt-3">1. 수강 안내</div><br><br>
        <p>
        [신청 확인] ‘MY PAGE’에서 확인할 수 있습니다.<br>
        [불참 안내] 수업에 참석하지 못하신 경우, 재료를 픽업하실 수 있습니다. (수업일 기준으로 2일 내 가능, 택배 및 보강 불가)<br>
        [수업 준비물] 공용 앞치마와 공용 꽃가위는 수업시간에 기본으로 제공됩니다.<br>
        [재료비] 재료비가 모두 포함된 금액입니다.<br>
        [연령 안내] 꽃가위 등 날카로운 집기를 사용하여 안전상 만 13세 이상부터 수강을 추천드립니다.<br>
        </p>

        <div class="fs-5 fw-500 mt-3">2. 장소 안내</div><br>
        <p>
        [주차 안내] 가급적 대중교통을 이용해 주시고 자가용을 이용하실 경우에는 국립현대미술관이나 경복궁 주차장을 이용해주시기 바랍니다.<br><br>
        </p>

        <div class="fs-5 fw-500 mt-3">3. 결제 안내</div><br><br>

        [선착순 마감] 결제 및 입금 완료 순으로 마감됩니다.<br>
        [무통장 입금] 6시간 이내에 입금 완료되지 않으면 자동 취소됩니다.<br>
        <div class="fs-5 fw-500 mt-3">4. 취소 및 환불 정책</div><br>
        수업 재료 및 클래스 대기자 손실 방지로 인해 클래스 취소 시 환불이 불가할 수 있습니다.<br>
        <p>
        환불 시 1:1문의 게시판을 통해 환불 절차가 이루어지며, 환불신청 기간에 따라 환불이 불가할 수 있습니다.<br>
        *수강 신청시 환불 규정에 동의한 것으로 간주됩니다. 신중하게 스케줄 확인 부탁드립니다.<br>
        </p>
        </div>
    </div>

</div> <!-- #container 닫기 -->

<%@ include file="../main/footer.jspf"%>

<script>
    const totalPriceEl = document.querySelector("#totalPrice");

    function checkRegCount() {
        const optionEl = document.querySelector("#scheduleSelect option:checked");
        const remainCount = parseInt(optionEl.dataset.remainCount);

        const regCountEl = document.querySelector("#regCount");
        const regCount = regCountEl.value;

        if (regCount > remainCount) {
            regCountEl.value = remainCount;
            calcPrice(remainCount);
            alert("등록 가능인원을 초과하여, 인원수를 변경하였습니다");
        }
    }

    async function scheduleChangeEventHandler(value) {
        await searchSchedule(value);
        checkRegCount();
    }

    async function searchSchedule(date) {
        const data = {
            fclassIdx: ${fclassVo.idx},
            branchIdx: document.querySelector("#branchSelectArea input[type=radio]:checked").value,
            sdate: date
        }

        const option = {
            method: 'post',
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            }
        }

        const response = await fetch("/admin/fclass/api/searchSchedule", option)
        const result = await response.json();
        const $scheduleSelect = document.querySelector("#scheduleSelect");
        $scheduleSelect.innerHTML = "";

        result.forEach(function (schedule) {
            const $option = document.createElement("option");
            const remainCount = schedule.totalCount - schedule.regCount;
            $option.dataset.remainCount = remainCount.toString(); //data-remain-count 속성의 값으로 들어갑니다
            $option.value = schedule.idx;
            $option.innerText = schedule.startTime + " ~ " + schedule.endTime + "(" + remainCount + "명 가능)";
            $scheduleSelect.appendChild($option);
        })

        if (result.length) {
            if ($scheduleSelect.hasAttribute("disabled")) {
                $scheduleSelect.removeAttribute("disabled");
            }
        } else {
            $scheduleSelect.setAttribute("disabled", "true");
        }

    }

    function dateToString(dateString) { // YY-MM-DD 형태로 변환
        let date = new Date(dateString);
        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let day = date.getDate();
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;

        return year + "-" + month + "-" + day;
    }

    async function checkValidDate() {
        // let disabledArrayInit = [];
        //
        // let today = new Date().getTime();
        // for(let i = 0; i < 60; i++) {
        //     let dateString = dateToString(today + 1000 * 60 * 60 * 24 * i);
        //     disabledArrayInit.push(dateString);
        // }

        let disabledArrayInit = Array.from({length: 60}, //60일치 배열 생성
            (v, i) => dateToString(new Date().getTime() + i * 1000 * 60 * 60 * 24));    // 콜백함수 1초 / 1분 / 1시간 / 하루

        let data = {
            branchIdx: document.querySelector("#branchSelectArea input[type=radio]:checked").value,
            fclassIdx: ${fclassVo.idx}
        };

        let option = {
            method: "post",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            }
        };

        let response = await fetch("/admin/fclass/api/searchSchedule", option);
        let result = await response.json();

        for (let scheduleVo of result) {
            disabledArrayInit = disabledArrayInit.filter(value => value !== dateToString(scheduleVo.sdate));
            // let sdateString = dateToString(scheduleVo.sdate);
            // let number = disabledArrayInit.indexOf(sdateString);
            // disabledArrayInit.splice(number, 1);
        }
        $('.schedule-datepicker').datepicker("setDatesDisabled", disabledArrayInit);
    }

    function calcPrice(regCount) {
        const classPriceEl = document.querySelector("#classPrice");
        const totalPriceEl = document.querySelector("#totalPrice");
        let classPrice = classPriceEl.dataset.fclassPrice;
        classPrice = classPrice * regCount;
        totalPriceEl.innerText = classPrice.toLocaleString("ko-KR") + "원";
    }

    /* 수강인원수, 총금액 증감 */
    function adjustQuantity(isUp) {
        const regCountEl = document.querySelector("#regCount");
        const optionEl = document.querySelector("#scheduleSelect option:checked");
        const remainCount = parseInt(optionEl.dataset.remainCount);

        let regCount = parseInt(regCountEl.value.toString());

        if (isUp) {
            if (regCount < remainCount) {
                regCount = regCount + 1;
            }
        } else {
            if (regCount > 1) {
                regCount = regCount -1;
            }
        }
        regCountEl.value = regCount;

        calcPrice(regCount);
    }


    /* 수강일 선택 */
    $(function () {
        $('.schedule-datepicker').datepicker({
            autoclose: true,
            format: 'yyyy-mm-dd',
            showOtherMonths: false,
            startDate: 'noBefore',
            endDate: '+30d',
            setDate: 'today',
            todayHighlight: true,
            title: '등록하실 클래스 날짜를 선택해주세요.',
            language: 'ko'
        });
    })

    function animateScroll(locationStr) {
        let headerHeight = document.querySelector("header").offsetHeight;
        let targetScrollVal = document.querySelector(locationStr).offsetTop;
        window.scrollTo({top:targetScrollVal - headerHeight, behavior:'smooth'});
    }

    /* 리뷰 카테고리(베스트리뷰/해당 상품리뷰) 탭으로 바꾸기 */
    function switchCategory(prev, next) {
        document.querySelector(prev).classList.add('d-none');
        document.querySelector(next).classList.remove('d-none');
    }

</script>
</body>
</html>
<style>

</style>