<%--
  Created by IntelliJ IDEA.
  User: Hyunsu
  Date: 2023-05-29
  Time: 오후 9:12
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/framework7@6"></script>
    <script>
        document.addEventListener('DOMContentLoaded2', function () {
            var tabLinks = document.querySelectorAll('.tab-link');

            tabLinks.forEach(function (link, index) {
                link.addEventListener('click', function (e) {
                    tabLinks.forEach(function (link) {
                        link.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });
        });
    </script>
</head>
<body>
<input type="hidden" value="${Authorization}" id="Auth">
<div class="toolbar tabbar tabbar-labels toolbar-bottom menubar-area">
    <div class="toolbar-inner">
        <a href="/" class="tab-link">
            <i class="flaticon-home"></i>
        </a>
        <a href="/category" class="tab-link">
            <i class="fa-solid fa-bars"></i>
        </a>
        <a href="/search" class="tab-link">
            <i class="fa-solid fa-magnifying-glass"></i></a>
        <a href="/product/cart" class="tab-link">
            <i class="flaticon-shopping-cart"></i>
        </a>
        <a href="/myPage" class="tab-link" id="myPage">
            <img src="https://farmfarm-bucket.s3.ap-northeast-2.amazonaws.com/7cc20134-7565-44e3-ba1d-ae6edbc213e5.png"
                 class="user-media" alt="" style="border-radius: 50%; width: 25px; height:25px;"/>
        </a>
    </div>
</div>

<script>
    window.onload = function () {
        const myPage = document.getElementById("myPage");
        var auth = document.getElementById("Auth").value;
        console.log(auth);
        myPage.addEventListener("click", (evt) => {
            jQuery.ajax({
                type: "POST",
                async: true,
                url: "http://localhost:9000/myPage",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Content-type", "application/json");
                    xhr.setRequestHeader("Authorization", auth);
                },
                success: function (data) {
                    console.log(data);
                    location.href = "/myPage"
                },
                error: function (request, status, error) {
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            });
        });
    };

</script>
</body>
</html>
