<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, viewport-fit=cover"
    />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta
            name="apple-mobile-web-app-status-bar-style"
            content="black-translucent"
    />
    <meta name="theme-color" content="#2196f3" />
    <meta
            http-equiv="Content-Security-Policy"
            content="default-src * 'self' 'unsafe-inline' 'unsafe-eval' data: gap:"
    />
    <meta name="author" content="DexignZone" />
    <meta name="robots" content="index, follow" />
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
    <meta name="format-detection" content="telephone=no" />

    <title>Kede - Grocery Mobile App HTML ( Framework 7 + PWA )</title>

    <link rel="stylesheet" href="../style/framework7-bundle.min.css" />
    <link rel="stylesheet" href="../style/app.css" />

    <link
            rel="stylesheet"
            href="../style/font-awesome/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="../style/line-awesome/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="../style/flaticons/flaticon.css" />

    <link rel="stylesheet" href="../style/style.css" />

    <link rel="apple-touch-icon" href="../images/f7-icon-square.png" />
    <link rel="icon" href="../images/f7-icon.png" />

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
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
                                <img src="../images/banner_image.png" alt="" />
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
                <%--                <c:forEach var="product" items="${productList}">--%>
                <%--                    <div class="col-50 medium-25">--%>
                <%--                        <div class="item-box">--%>
                <%--                            <div class="item-media">--%>
                <%--                                <img src="../images/categories/pic1.jpg" alt="" />--%>
                <%--                            </div>--%>
                <%--                            <label class="bookmark-btn">--%>
                <%--                                <input type="checkbox" checked />--%>
                <%--                            </label>--%>
                <%--                            <div class="item-content">--%>
                <%--                                <h5>${product.farm.name}</h5>--%>
                <%--                                <h3 class="title">--%>
                <%--                                    <a href="/item-details/">${product.name}</a>--%>
                <%--                                </h3>--%>
                <%--                                <h4 class="price">${product.price}</h4>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </c:forEach>--%>
                <div class="col-50 medium-25">
                    <div class="item-box">
                        <div class="item-media">
                            <img src="../images/categories/pic1.jpg" alt="" />
                        </div>
                        <label class="bookmark-btn">
                            <input type="checkbox" checked />
                        </label>
                        <div class="item-content">
                            <h5>팜팜 농장</h5>
                            <h3 class="title">
                                <a href="/item-details/">대저 토마토 (1KG)</a>
                            </h3>
                            <h4 class="price">8,980원</h4>
                        </div>
                    </div>
                </div>
                <div class="col-50 medium-25">
                    <div class="item-box">
                        <div class="item-media">
                            <img src="../images/categories/pic2.jpg" alt="" />
                        </div>
                        <label class="bookmark-btn">
                            <input type="checkbox" />
                        </label>
                        <div class="item-content">
                            <h5>가지가지 농장</h5>
                            <h3 class="title">
                                <a href="/item-details/">브로콜리 (1개)</a>
                            </h3>
                            <h4 class="price">8,000원</h4>
                        </div>
                    </div>
                </div>
                <div class="col-50 medium-25">
                    <div class="item-box" style="margin-bottom:0;">
                        <div class="item-media">
                            <img src="../images/categories/pic3.jpg" alt="" />
                        </div>
                        <label class="bookmark-btn">
                            <input type="checkbox" />
                        </label>
                        <div class="item-content">
                            <h5>팜팜 농장</h5>
                            <h3 class="title">
                                <a href="/item-details/">아보카도 (1개)</a>
                            </h3>
                            <h4 class="price">7,000원</h4>
                        </div>
                    </div>
                </div>
                <div class="col-50 medium-25">
                    <div class="item-box" style="margin-bottom:0;">
                        <div class="item-media">
                            <img src="../images/categories/pic4.jpg" alt="" />
                        </div>
                        <label class="bookmark-btn">
                            <input type="checkbox" />
                        </label>
                        <div class="item-content">
                            <h5>팜팜 농장</h5>
                            <h3 class="title">
                                <a href="/item-details/">아보카도 (1개)</a>
                            </h3>
                            <h4 class="price">7,000원</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="title-bar mb-15">
                <h2 class="dz-title my-5">이런 농장 어때요?</h2>
                <a href="/farm/list"><i class="flaticon-right"></i></a>
            </div>
                        <c:forEach var="farm" items="${farmList}" varStatus="status">
                            <div class="col-100">
                                <a href="/deals/" class="item-category">
                                    <div class="item-info">
                                        <h3 class="title">${status.count} ${farm.name}</h3>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
<%--            <div class="col-100">--%>
<%--                <a href="/deals/" class="item-category">--%>
<%--                    <div class="item-info">--%>
<%--                        <h3 class="title">1. 팜팜 농장</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-100">--%>
<%--                <a href="/deals/" class="item-category">--%>
<%--                    <div class="item-info">--%>
<%--                        <h3 class="title">2. 일제삼피 사과 농장</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-100">--%>
<%--                <a href="/deals/" class="item-category">--%>
<%--                    <div class="item-info">--%>
<%--                        <h3 class="title">3. 영린이네 과수원</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-100">--%>
<%--                <a href="/deals/" class="item-category">--%>
<%--                    <div class="item-info">--%>
<%--                        <h3 class="title">4. 다팔아 농장</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-100 banner">--%>
<%--                <a href="/deals/" class="item-category">--%>
<%--                    <div class="item-info">--%>
<%--                        <h3 class="title">5. 토마토마토 농장</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
            <div class="title-bar mb-15">
                <h2 class="dz-title my-5">진행 중인 경매</h2>
                <a href="/deals/"><i class="flaticon-right"></i></a>
            </div>
            <div class="col-50 medium-25">
                <div class="item-box">
                    <div class="item-media">
                        <img src="../images/categories/pic2.jpg" alt="" />
                    </div>
                    <label class="bookmark-btn">
                        <input type="checkbox" />
                    </label>
                    <div class="auction_time"><h3>00 : 27 : 21</h3></div>
                    <div class="item-content">
                        <h5>팜팜 농장</h5>
                        <h3 class="title">
                            <a href="/item-details/">싱싱한 찰토마토 / 5박스 한정   </a>
                        </h3>
                        <h4 class="price">경매 시작가 2,000원</h4>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>

</body>
</html>