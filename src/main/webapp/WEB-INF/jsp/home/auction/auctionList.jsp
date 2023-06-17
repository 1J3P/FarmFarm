<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, viewport-fit=cover"
    />
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta
            name="apple-mobile-web-app-status-bar-style"
            content="black-translucent"
    />
    <meta name="theme-color" content="#2196f3"/>
    <meta
            http-equiv="Content-Security-Policy"
            content="default-src * 'self' 'unsafe-inline' 'unsafe-eval' data: gap:"
    />
    <meta name="author" content="DexignZone"/>
    <meta name="robots" content="index, follow"/>
    <meta
            name="keywords"
            content="delivery, eatables, ecommerce, electronics, food delivery, Food Store, fruits, grocery, Grocery & Staples, market, online grocery shop, online vegetables, organic, supermarket, vegetables, "
    />
    <meta
            name="description"
            content="Kede - Grocery Mobile App HTML ( Framework 7 + PWA )"
    />
    <meta
            property="og:title"
            content="Kede - Grocery Mobile App HTML ( Framework 7 + PWA )"
    />
    <meta
            property="og:description"
            content="Kede - Grocery Mobile App HTML ( Framework 7 + PWA )"
    />
    <meta
            property="og:image"
            content="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/10591631-d5da-4804-b013-ff6eccbed6f7.png"
    />
    <meta name="format-detection" content="telephone=no"/>

    <title>FarmFarm</title>

    <link rel="stylesheet" href="../../style/framework7-bundle.min.css"/>
    <link rel="stylesheet" href="../../style/app.css"/>

    <link
            rel="stylesheet"
            href="../../style/font-awesome/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="../../style/line-awesome/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="../../style/flaticons/flaticon.css"/>

    <link rel="stylesheet" href="../../style/style.css"/>

    <link rel="apple-touch-icon" href="../images/f7-icon-square.png"/>
    <link rel="icon" href="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/10591631-d5da-4804-b013-ff6eccbed6f7.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/home/" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">경매 전체보기</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="container">
            <div class="col-50 medium-25" style="margin-top: 50px">
                <h4>진행 중인 경매 ${productList.size()}개</h4>
                <c:forEach var="product" items="${productList}">
                    <div class="item-box" onclick="location.href='/product/${product.PId}'">
                        <div class="item-media">
                            <img src="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/920d0c68-c41a-45ec-82a1-a13160b140c7.png" alt="" />
                        </div>
                        <div class="auction_time"><h3 class="ac-time" data-date="${product.date}"></h3></div>
                        <div class="item-content">
                            <h5>${product.farm.name}</h5>
                            <h3 class="title">${product.name}</h3>
                            <h4 class="price">경매 시작가 ${product.price}원</h4>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${productList.size() == 0}">
                    <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
                </c:if>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
<script>
    window.onload = function() {
        const remainTimeElements = document.querySelectorAll(".ac-time");

        remainTimeElements.forEach((element) => {
            function updateCountdown() {
                const targetDate = moment(element.dataset.date);
                const currentDate = moment();
                const diff = targetDate.diff(currentDate);

                const diffDuration = moment.duration(diff);
                const diffHour = String(diffDuration.hours()).padStart(2, "0");
                const diffMin = String(diffDuration.minutes()).padStart(2, "0");
                const diffSec = String(diffDuration.seconds()).padStart(2, "0");
                element.innerText = diffHour + " : " + diffMin + " : " + diffSec;
            }

            updateCountdown();
            setInterval(updateCountdown, 1000);
        });
    };

</script>
</html>