<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>농장 전체보기 </title>
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

<style>
    table {
        border-collapse: collapse;
        font-size: 18px;
        width: 400px;
    }

    table td, table th {
        height: 40px;
        border-bottom: 1px solid #F3F3F3;
        padding: 10px
    }

    th[scope="row"] {
        color: #94C015;
    }

</style>

<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="#" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">농장 전체 보기</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="container allProduct">
            <div class="allProduct_text">
                <div class="total">
                    <h5>총 <span>100</span>개</h5>
                </div>
                <div class="sort">
                    <div class="sort_type">
                        <select>
                            <option>인기순</option>
                            <option>신규순</option>
                            <option>오래된순</option>
                        </select>
                    </div>
                    <div class="filter">
                        <h5>필터</h5>
                    </div>
                </div>
            </div>
            <div class="row">
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>영린이네 과수원</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>영린이네 과수원</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>감현수 감사세요</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>하린 농장</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>영린이네 과수원</td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td>감현수 감사세요</td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td>장현아 다팔아 농장</td>
                    </tr>
                    <tr>
                        <th scope="row">8</th>
                        <td>영린이네 과수원</td>
                    </tr>
                    <tr>
                        <th scope="row">9</th>
                        <td>감현수 감사세요</td>
                    </tr>
                    <tr>
                        <th scope="row">10</th>
                        <td>감현수 감사세요</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
