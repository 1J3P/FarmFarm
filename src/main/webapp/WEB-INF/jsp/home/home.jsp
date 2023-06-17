<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>FarmFarm</title>
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

    <link rel="stylesheet" href="../style/framework7-bundle.min.css"/>
    <link rel="stylesheet" href="../style/app.css"/>

    <link
            rel="stylesheet"
            href="../style/font-awesome/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="../style/line-awesome/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="../style/flaticons/flaticon.css"/>

    <link rel="stylesheet" href="../style/style.css"/>

    <link rel="apple-touch-icon" href="../images/f7-icon-square.png"/>
    <link rel="icon"
          href="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/10591631-d5da-4804-b013-ff6eccbed6f7.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
            font-size: 18px;
            width: 100%;
        }

        table td, table th {
            height: 40px;
            border-bottom: 1px solid #F3F3F3;
            padding-bottom: 5px;
            padding-top: 5px;
        }

        th[scope="row"] {
            width: 7%;
            color: #94C015;
        }
    </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="container">
            <div class="notification-bar">
                <div class="info">
                    <h1 class="title"><img src="../images/farmfarm_logo2.png"></h1>
                </div>
                <div class="media">
                    <a href="/" class="notibell">
                        <i class="fa fa-bell"></i>
                        <div class="badge"></div>
                    </a>
                </div>
            </div>

            <div class="banner">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="post-card">
                            <div class="post-media">
                                <img src="../images/banner_image.png" alt=""/>
                                <div class="banner-text">
                                    <h2>신선하게 공수한<br>방울 토마토 500g</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="title-bar mb-15">
                <h2 class="dz-title my-5">이 상품 어때요?</h2>
                <a href="/product/list" class="home-product"><i class="flaticon-right"></i></a>
            </div>
            <div class="row banner">
                <c:forEach var="product" items="${products}" begin="0" end="3">
                    <div class="col-50 medium-25" onclick="location.href='/product/${product.PId}'">
                        <div class="item-box">
                            <div class="item-media">
                                <img src=${product.image1} alt=""/>
                            </div>
                            <label class="bookmark-btn">
                                <input type="checkbox" checked/>
                            </label>
                            <div class="item-content">
                                <h5>${product.farm.name}</h5>
                                <h3 class="title">
                                        ${product.name}
                                </h3>
                                <h4 class="price">${product.price}원</h4>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="title-bar mb-15">
                <h2 class="dz-title my-5">이런 농장 어때요?</h2>
                <a href="/farm/list"><i class="flaticon-right"></i></a>
            </div>
            <div class="row">
                <table class="table">
                    <tbody>
                    <c:forEach var="farm" items="${farms}" varStatus="status" begin="0" end="4">
                        <tr>
                            <th scope="row">${status.count}</th>
                            <td><a href="/farm/${farm.FId}" style="color: black;">${farm.name}</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <p></p>
            <br>
            <div class="title-bar mb-15">
                <h2 class="dz-title my-5">진행 중인 경매</h2>
                <a href="/product/auction/list"><i class="flaticon-right"></i></a>
            </div>
            <c:forEach var="auction" items="${auctions}" begin="0" end="1">
                <div class="item-box" onclick="location.href='/product/${auction.PId}'">
                    <div class="item-media">
                        <img src= ${auction.image1} alt=""/>
                    </div>
                    <div class="auction_time"><h3 class="ac-time" data-date="${auction.date}"></h3></div>
                    <div class="item-content">
                        <h5>${auction.farm.name}</h5>
                        <h3 class="title">${auction.name}</h3>
                        <h4 class="price">경매 시작가 ${auction.price}원</h4>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${auctions.size() == 0}">
                <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
            </c:if>
        </div>

    </div>

    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>

</body>
<script>
    window.onload = function () {
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