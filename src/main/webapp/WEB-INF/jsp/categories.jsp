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

    <style>
        .dropdown-menu {
            display: none;
        }

        .dropdown-menu a {
            display: block;
            margin-left: 40px;
            color: black;
            position: relative;
            top: 30%;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .btn {
            justify-content: normal;
            border: none;
        }

        .text {
            margin-left: 20px;
        }

        .cate-item {
            background-color: #EAEAEA;
            height: 50px;
        }

        .cate-item:hover {
            background-color: #9DBF3F;
        }
    </style>
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
            <div class="title">카테고리</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="col-50 medium-25" style="margin-top: 60px;">
            <div class="dropdown" style="margin-bottom: 30px;">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    <!-- 추후에 fruits.png 이미지 파일 넣기. 자꾸 실패함 ㅜㅜ -->
                    <h3 class="text">과일</h3>
                </button>
                <div class="dropdown-menu">
                   <div class="cate-item"><a class="dropdown-item" href="#">사과</a></div>
                   <div class="cate-item"><a class="dropdown-item" href="#">배</a></div>
                   <div class="cate-item"><a class="dropdown-item" href="#">포도</a></div>
                   <div class="cate-item"><a class="dropdown-item" href="#">감귤</a></div>
                   <div class="cate-item"><a class="dropdown-item" href="#">참외</a></div>
                </div>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    <h3 class="text">채소</h3>
                </button>
                <div class="dropdown-menu">
                    <div class="cate-item"><a class="dropdown-item" href="#">당근</a></div>
                    <div class="cate-item"><a class="dropdown-item" href="#">양파</a></div>
                    <div class="cate-item"><a class="dropdown-item" href="#">오이</a></div>
                    <div class="cate-item"><a class="dropdown-item" href="#">마늘</a></div>
                    <div class="cate-item"><a class="dropdown-item" href="#">고구마</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
