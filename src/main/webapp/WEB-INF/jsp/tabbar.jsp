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
  <title>상품 검색</title>
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
<div class="toolbar tabbar tabbar-labels toolbar-bottom menubar-area">
  <div class="toolbar-inner">
    <a href="/home/" class="tab-link active">
      <i class="flaticon-home"></i>
    </a>
    <a href="/categories/" class="tab-link">
      <i class="fa-solid fa-bars"></i>
    </a>
    <a href="/search/" class="tab-link">
      <i class="fa-solid fa-magnifying-glass"></i>
    </a>
    <a href="/shopping-cart/" class="tab-link cart-in">
      <i class="flaticon-shopping-cart"></i>
    </a>
    <a href="/user/" class="tab-link">
      <img src="images/avatar/1.jpg" class="user-media" alt="" />
    </a>
  </div>
</div>
</body>
</html>
