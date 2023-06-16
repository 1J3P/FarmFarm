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
  <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
  <style>
    .item-inner {
      position: relative;
    }

    .fa-solid.fa-pencil,
    .fa-regular.fa-trash-can {
      position: absolute;
      bottom: 0;
    }

    .fa-solid.fa-pencil {
      right: 30px;
    }

    .fa-regular.fa-trash-can {
      right: 0;
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
      <div class="title"><b>상품 문의 내역</b></div>
      <div class="right"></div>
    </div>
  </div>
  <div class="page-content pt-60 bottom-sp60">
    <div class="container">
      <div class="list media-list review-list">
        <ul>
          <c:forEach var="enquiry" items="${enquiries}">
            <li class="list">
              <div class="item-link item-content">
                <div class="item-media"><img src="../images/avatar/1.jpg" width="50"></div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title">${enquiry.product.name}</div>
                  </div>
                  <div class="item-text">${enquiry.content}</div>
                  <i class="fa-solid fa-pencil"></i>
                  <i class="fa-regular fa-trash-can"></i>
                </div>
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
