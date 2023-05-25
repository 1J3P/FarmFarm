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
          <h1 class="title">Farm Farm</h1>
        </div>
        <div class="media">
          <a href="/notifications-app/" class="notibell">
            <i class="fa fa-bell"></i>
            <div class="badge"></div>
          </a>
        </div>
      </div>

      <div
              data-space-between="10"
              data-slides-per-view="auto"
              data-centered-slides="false"
              class="swiper swiper-init mb-30 post-area"
      >
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="post-card">
              <div class="post-media">
                <img src="img/post/pic1.jpg" alt="" />
              </div>
              <div class="post-info">
                <h3 class="title">Recomended Recipe Today</h3>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="post-card">
              <div class="post-media">
                <img src="img/post/pic2.jpg" alt="" />
              </div>
              <div class="post-info">
                <h3 class="title">Fresh Fruits Delivery</h3>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="post-card">
              <div class="post-media">
                <img src="img/post/pic1.jpg" alt="" />
              </div>
              <div class="post-info">
                <h3 class="title">Recomended Recipe Today</h3>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="post-card">
              <div class="post-media">
                <img src="img/post/pic2.jpg" alt="" />
              </div>
              <div class="post-info">
                <h3 class="title">Fresh Fruits Delivery</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="title-bar mb-15">
        <h2 class="dz-title my-5">이 상품 어때요?</h2>
        <a href="/deals/"><i class="flaticon-right"></i></a>
      </div>
      <div class="row">
        <div class="col-50 medium-25">
          <div class="item-box">
            <div class="item-media">
              <img src="img/categories/pic1.jpg" alt="" />
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
              <img src="img/categories/pic2.jpg" alt="" />
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
          <div class="item-box">
            <div class="item-media">
              <img src="img/categories/pic3.jpg" alt="" />
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
          <div class="item-box">
            <div class="item-media">
              <img src="img/categories/pic4.jpg" alt="" />
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
        <a href="/deals/"><i class="flaticon-right"></i></a>
      </div>
      <div class="col-100">
        <a href="/deals/" class="item-category">
          <div class="item-info">
            <h3 class="title">1. 팜팜 농장</h3>
          </div>
        </a>
      </div>
      <div class="col-100">
        <a href="/deals/" class="item-category">
          <div class="item-info">
            <h3 class="title">2. 일제삼피 사과 농장</h3>
          </div>
        </a>
      </div>
      <div class="col-100">
        <a href="/deals/" class="item-category">
          <div class="item-info">
            <h3 class="title">3. 영린이네 과수원</h3>
          </div>
        </a>
      </div>
      <div class="col-100">
        <a href="/deals/" class="item-category">
          <div class="item-info">
            <h3 class="title">4. 다팔아 농장</h3>
          </div>
        </a>
      </div>
      <div class="col-100">
        <a href="/deals/" class="item-category">
          <div class="item-info">
            <h3 class="title">5. 토마토마토 농장</h3>
          </div>
        </a>
      </div>
      <div class="title-bar mb-15">
        <h2 class="dz-title my-5">진행 중인 경매</h2>
        <a href="/deals/"><i class="flaticon-right"></i></a>
      </div>
      <div class="col-50 medium-25">
        <div class="item-box">
          <div class="item-media">
            <img src="img/categories/pic2.jpg" alt="" />
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
</div>

</body>
</html>
