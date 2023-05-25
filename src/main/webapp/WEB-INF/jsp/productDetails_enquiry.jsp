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
<div class="page light">
  <div class="navbar navbar-style-1 navbar-transparent">
    <div class="navbar-inner">
      <div class="left">
        <a href="#" class="link back">
          <i class="icon flaticon-left"></i>
        </a>
      </div>
      <div class="title"> </div>
      <div class="right">
        <i class="icon flaticon-share"></i>
      </div>
    </div>
  </div>
  <div class="page-content pt-80 bottom-sp90 item-details">
    <div data-pagination='{"el": ".swiper-pagination"}' class="swiper swiper-slider-wrapper swiper-init demo-swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../style/images/slider/slide1.jpg" alt="">
        </div>
        <div class="swiper-slide">
          <img src="../style/images/slider/slide2.jpg" alt="">
        </div>
        <div class="swiper-slide">
          <img src="../style/images/slider/slide1.jpg" alt="">
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <div class="dz-banner-height"></div>
    <div class="fixed-content py-30">
      <div class="container">
        <div class="item-info">
          <div class="clearfix">
            <h3 class="category">팜팜농장</h3>
            <h2 class="item-title">대저 토마토 (1KG)</h2>
          </div>
        </div>
        <div class="item-info">
          <div class="clearfix">
            <h2 class="text-primary item-price">8,980원</h2>
          </div>
          <div class="stepper stepper-small stepper-round stepper-init">
            <div class="stepper-button-minus"></div>
            <div class="stepper-input-wrap">
              <input type="text" value="4" min="0" max="100" step="1" readonly>
            </div>
            <div class="stepper-button-plus"></div>
          </div>
        </div>
        <div class="item-info">
          <div class="reviews-info">
            <i class="fa fa-star"></i>
            <h5 class="reviews">4.5</h5>
            <p class="reviews-text">(128 reviews)</p>
          </div>
          <div class="avatar-group">
            <img src="../style/images/avatar/1.jpg" alt="">
            <img src="../style/images/avatar/2.jpg" alt="">
            <img src="../style/images/avatar/3.jpg" alt="">
          </div>
        </div>
        <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
          <div class="toolbar-inner">
            <a href="#tab-1" class="tab-link">상품 설명</a>
            <a href="#tab-2" class="tab-link">후기</a>
            <a href="#tab-3" class="tab-link tab-link-active">문의</a>
          </div>
        </div>
        <div class="tabs-swipeable-wrap tabs-height-auto">
          <div class="tabs">
            <div id="tab-3" class="tab">
              <div class="list media-list review-list">
                <form class="form-elements">
                  <div class="list">
                    <ul class="row">
                      <li class="item-content item-input col-100 item-input-with-value">
                        <div class="item-inner">
                          <label class="form-label"><b>1:1 문의 작성</b></label>
                          <div class="item-input-wrap">
                            <textarea style="height: 150px;" rows="5" placeholder="1:1 문의 내용을 작성해주세요" class="form-control"/></textarea>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </form>
                <div class="container px-15">
                  <a href="/home/" class="button-large button button-fill">작성 완료</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="toolbar toolbar-bottom footer-button padding border-top item-details-btn">
    <div class="container px-15">
      <div class="row">
        <div class="col-30">
          <a href="javascript:void(0);" class="button-large button btn-block button-fill add-cart-btn active together-order">
            같이 주문하기<span class="price">7,980원</span>
          </a>
        </div>
        <div class="col-70">
          <a href="/shopping-cart/" class="button-large button add-cart-btn btn-block button-fill">혼자 주문하기<span class="price">8,980원</span></a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
