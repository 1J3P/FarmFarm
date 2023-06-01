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
            <div class="title">거래 방식</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="fixed-content py-30">
        <div class="container">
            <div class="tabs" style="margin-top: 50px">
                <div class="tab tab-active form-elements tabs">
                    <form class="tab tab-active" id="tabA1">
                        <div class="list mb-0">
                            <ul class="row">
                                <li class="item-content item-input col-100 item-input-with-value">
                                    <div class="item-inner">
                                        <h4>이름</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" placeholder="이름을 입력하세요" id="username" class="form-control"/>
                                        </div>
                                        <h4>이메일</h4>
                                        <div class="item-input-wrap">
                                            <input type="email" placeholder="이메일을 입력하세요" id="email" class="form-control"/>
                                        </div>
                                        <h4>전화번호</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" placeholder="전화번호를 입력하세요" id="phone" class="form-control"/>
                                        </div>
                                        <h4>거래 방식</h4>
                                        <div class="item-input-wrap">
                                            <label><input type="checkbox" id="direct" name="direct" value="direct" checked />직거래</label>
                                            <label><input type="checkbox" id="shipping" name="shipping" value="shipping " />배송</label>
                                        </div>
                                        <h4>주소</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" placeholder="주소를 입력하세요" id="address" class="form-control"/>
                                        </div>
                                        <h4>우편번호</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" placeholder="우편번호를 입력하세요" id="zip_code" class="form-control"/>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="list" style="margin-top: 50px">
                            <ul>
                                <li class="mb-15"><a href="/home/" class="button-large button button-fill">결제하기</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
