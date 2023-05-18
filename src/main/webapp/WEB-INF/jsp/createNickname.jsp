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
</head>
<body>
<div class="page">
    <div class="page-content account-area">
        <div class="dz-banner" style="background-image:url(img/banner/bnr-2.jpg); background-repeat:no-repeat; background-size:cover;"></div>
        <div class="dz-banner-height"></div>
        <div class="fixed-content py-30">
            <div class="container">
                <div class="tabs">
                    <div class="tab tab-active form-elements tabs">
                        <form class="tab tab-active" id="tabA1">
                            <div class="title-bar mb-20">
                                <h3 class="dz-title ma-0">닉네임을 입력해주세요</h3>
                            </div>
                            <div class="list mb-0">
                                <ul class="row">
                                    <li class="item-content item-input col-100 item-input-with-value">
                                        <div class="item-inner">
                                            <div class="item-input-wrap">
                                                <input type="email" placeholder="닉네임을 설정해주세요" id="demo-username-22" class="form-control"/>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <br><br><br>
                            <div class="list">
                                <ul>
                                    <li class="mb-15"><a href="/home/" class="button-large button button-fill">Sign In</a></li>
                                </ul>
                            </div>
                        </form>
                        <form class="tab" id="tabA2">
                            <div class="title-bar mb-20">
                                <a href="#tabA1" data-route-tab-id="tabA1" class="tab-link icon-close"><i class="flaticon-cancel"></i></a>
                            </div>
                            <div class="list mb-0">
                                <ul>
                                    <li class="item-content item-input item-input-with-value">
                                        <div class="item-inner">
                                            <div class="item-input-wrap">
                                                <input type="password" placeholder="New Password" id="demo-username-25" class="form-control"/>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="/home/" class="button-large button button-fill">SUBMIT</a></li>
                                </ul>
                            </div>
                            <div class="list text-center">
                                <p class="fs-14 d-inline-block mt-10">Sign in to your registered account <a href="#tabA1"  data-route-tab-id="tabA1" class="fw6 tab-link">Login here</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
