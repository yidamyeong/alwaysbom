<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1:1문의</title>
    <%@ include file="../main/import.jspf" %>
    <style>
        .h-5 {
            height: 5% !important;
        }

        .h-10 {
            height: 10% !important;
        }

        .h-85 {
            height: 85% !important;
        }
        .bg-pink {
            background-color: #f5b0cf;
        }
        .name-color {
            color: #d869db;
        }
        .bannerName-color {
            color: #f7ebf1;
        }
        a {
            text-decoration: none;
        }
        hr {
            color: white;
        }
        .list-group-item {
            border: none;
        }
        .btn-warning {
            width: 200px;
            height: 60px;
            color: #2c3034;
        }
    </style>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <div class="h-10 d-flex bg-pink bannerName-color p-3">
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2">
            <span class="position-absolute top-0 align-self-baseline">회원 등급</span>
            <span class="h4">WHITE</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2
                    border-secondary border border-bottom-0 border-top-0">
            <span class="position-absolute top-0 align-self-baseline">포인트</span>
            <span class="h4">1000</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center position-relative p-2">
            <span class="position-absolute top-0 align-self-baseline">보유 쿠폰</span>
            <span class="h4">0장</span>
        </div>
    </div>
    <div class="d-flex h-5">
        <div class="col-2"></div>
        <div class="col-10 d-flex justify-content-center px-5 pt-4">
        </div>
    </div>
    <div class="h-85 d-flex">
        <div class="col-2 border-warning d-flex flex-column p-4 ps-5">
            <ul class="d-flex flex-column list-unstyled fs-6 list-group m-0">
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">주문 내역</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">정기 구독</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">수강 내역</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="/community/goFaq" class="link-secondary">자주 묻는 질문</a>
                </li>
                <li class="list-group-item">
                    <a href="/myPage_faq_main" class="link-secondary">1:1 문의</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">상품 후기</a>
                </li>
                <li>
                    <hr>
                </li>
                <li class="list-group-item">
                    <a href="/member_grade" class="link-secondary">회원 등급</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">포인트</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">회원 정보 관리</a>
                </li>
                <li class="list-group-item">
                    <a href="" class="link-secondary">회원 탈퇴</a>
                </li>
            </ul>
        </div>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12">
                <div class="h5 col-12 d-flex flex-column text-secondary">
                    <div class="d-flex">
                        <span class="fw-bold name-color">이다솜</span>
                        <span>님의 회원등급</span>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../main/footer.jspf" %>
</body>
</html>