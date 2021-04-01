<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>꽃다발</title>
    <%@ include file="../main/import.jspf"%>
    <link rel="stylesheet" href="/static/css/item/list.css">
</head>
<body>
    <%@ include file="../main/header.jspf" %>
    <div class="banner-img d-flex justify-content-center align-items-center">
        꽃다발 배너 이미지
    </div>
    <div id="container" class="mx-auto">
        <!-- 정렬 순서 (추후 매출통계와 연계) -->
        <div class="align-by pe-2 d-flex justify-content-end align-items-center">
            추천순 <i class="fas fa-chevron-down p-3"></i>
        </div>

        <!-- 상품 썸네일 리스트 -->
        <div class="row row-cols-4">
            <c:forEach var="flowerVo" items="${list}">
            <c:if test="${not empty flowerVo}">
            <div class="col mb-8em">
                <div class="overflow-hidden">
                    <a href="/flower/${flowerVo.idx}">
                        <img src="${flowerVo.image1}" class="col-12 scale-up" alt="꽃다발 썸네일">
<%--                        <img src="/static/upload/flower/${flowerVo.image1}" class="col-12 scale-up" alt="꽃다발 썸네일">--%>
                    </a>
                </div>
                <div class="ps-1">
                    <div class="subheader">${flowerVo.subheader}</div>
                    <div class="item-name">
                        <a href="/flower/${flowerVo.idx}">${flowerVo.name}</a>
                    </div>
                    <div class="price-wrap">
                        <c:if test="${not empty flowerVo.discountRate && flowerVo.discountRate > 0}">
                        <span class="discount-rate">${flowerVo.discountRate}%</span>
                        <span class="original-price">
                            <fmt:formatNumber value="${flowerVo.price}" pattern="#,###원 >"/>
                        </span>
                        </c:if>
                        <span class="final-price">
                            <fmt:formatNumber value="${flowerVo.finalPrice}" pattern="#,###원"/>
                        </span>
                    </div>
                    <div class="size-delivery">
                        <span class="badge rounded-pill bg-warning size-unit">${flowerVo.fsize}</span>
                        <span class="item-size">size</span>
                        <span class="badge rounded-pill bg-secondary delivery-unit">${flowerVo.freeDeliveryMessage}</span>
                    </div>
                </div>
            </div>
            </c:if>
            </c:forEach>
        </div>
    </div>

    <%@ include file="../main/footer.jspf" %>

</body>
</html>
