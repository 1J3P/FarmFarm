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
            content="https://kede.dexignzone.com/xhtml/social-image.png"
    />
    <meta name="format-detection" content="telephone=no"/>

    <title>Kede - Grocery Mobile App HTML ( Framework 7 + PWA )</title>

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
    <link rel="icon" href="../images/f7-icon.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script>
        window.onload = function (){
            const remainTime = document.querySelectorAll(".ac-time");
            remainTime.forEach((item) => {
                function diffDay(){
                    const masTime = new Date("2023-12-25");
                    const todayTime = new Date();

                    const diff = masTime - todayTime;

                    const diffHour = String(Math.floor((diff / (1000*60*60)) % 24)).padStart(2,"0");
                    const diffMin = String(Math.floor((diff / (1000*60)) % 60)).padStart(2,"0");
                    const diffSec = String(Math.floor(diff / 1000 % 60)).padStart(2,"0");
                    item.innerText =  diffHour + " : " + diffMin + " : " + diffSec;
                }
                setInterval(diffDay, 1000);
            })
        };

    </script>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="#" class="link back">
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
                <h4>진행 중인 경매 2개</h4>
                <div class="item-box">
                    <div class="item-media">
                        <img src="../images/card/card1.png" alt="" />
                    </div>
                    <div class="auction_time"><h3 class="ac-time">00 : 27 : 21</h3></div>
                    <div class="item-content">
                        <h5>팜팜 농장</h5>
                        <h3 class="title">
                            <a href="/item-details/">싱싱한 찰토마토 / 5박스 한정   </a>
                        </h3>
                        <h4 class="price">경매 시작가 2,000원</h4>
                    </div>
                </div>
                <div class="item-box">
                    <div class="item-media">
                        <img src="../images/card/card2.png" alt="" />
                    </div>
                    <div class="auction_time"><h3 class="ac-time">00 : 27 : 21</h3></div>
                    <div class="item-content">
                        <h5>팜팜 농장</h5>
                        <h3 class="title">
                            <a href="/item-details/">싱싱한 찰토마토 / 5박스 한정</a>
                        </h3>
                        <h4 class="price">경매 시작가 2,000원</h4>
                    </div>
                </div>
                <!-- 진행 중인 경매가 없을시 -->
                <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>