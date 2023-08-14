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
    <style>
        .no-auction{
            position: relative;
            height:580px;
        }
        .no-auction p{
            position: absolute;
            left: 50%;
            top: 40%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        .no-auction a{
            width:90%;
            position: absolute;
            left:50%;
            bottom: 0;
            transform: translateX(-50%);
            margin-top: 10px;
        }

    </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/myPage" class="link back">
                    <i class="icon flaticon-left"></i>
                </a>
            </div>
            <div class="title">경매 참가 내역</div>
            <div class="right">
            </div>
        </div>
    </div>
    <div class="page-content pt-60 bottom-sp60">
        <div class="container cart-list-area">
            <div class="list cart-list">
                <ul>
                    <c:if test="${empty auctionList}">
                        <div class="no-auction">
                            <p style="text-align: center;">아직 경매 참여 내역이 없습니다!<br>
                                경매를 참여해보세요!!</p>
                            <a href="/product/auction/list" class="button-large button button-fill"
                               style="margin-top: 48%;">경매 물품 보러가기</a>
                        </div>
                    </c:if>
                    <c:forEach var="auction" items="${auctionList}">
                        <li class="swipeout cart-item" style="border-bottom: 1px solid; border-bottom-style: inset;">
                            <div class="item-content swipeout-content">
                                <div class="item-inner">
                                    <div class="item-media">
                                        <img src="${auction.orders.get(0).product.image1}" alt="">
                                    </div>
                                    <div class="item-info">
                                        <c:if test="${not empty auction.orders}">
                                            <div class="item-head">
                                                <h6 class="category">${auction.orders.get(0).product.farm.name}</h6>
                                                <h6 class="category" style="float:right; margin-right:45px">
                                                    <fmt:formatDate pattern="yyyy.MM.dd"
                                                                    value="${auction.created_at}"/></h6>
                                                <h2 class="item-title"><a
                                                        href="/product/${auction.orders.get(0).product.PId}">${auction.orders.get(0).product.name}</a>
                                                </h2>
                                                <h5 class="item-title">
                                                    <span>${auction.orders.get(0).auction.price}</span>원</h5>
                                                <h6 class="category"
                                                    style="color: #4D9EE9; float:right; margin-right:45px">${auction.orders.get(0).auction.status}</h6>
                                            </div>
                                            <div class="item-foot">
                                                <h3 class="text-primary item-total"><span>${auction.total_price}</span>원
                                                </h3>
                                                <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                                    <div class="stepper-input-wrap stepperFont">
                                                        X <span>${auction.total_quantity}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="swipeout-actions-right">
                                <a href="#" class="swipeout-delete"><i class="las la-trash-alt"></i></a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>
