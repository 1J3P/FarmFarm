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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script>
    //탭 로직
    document.addEventListener('DOMContentLoaded', function () {
      var tabLinks = document.querySelectorAll('.tab-link');
      var tabs = document.querySelectorAll('.tab');

      // 초기에 첫 번째 탭만 보이도록 설정
      tabs[0].style.display = 'block';

      // 탭 클릭 이벤트 처리
      tabLinks.forEach(function (link, index) {
        link.addEventListener('click', function (e) {
          e.preventDefault();

          // 모든 탭 숨기기
          tabs.forEach(function (tab) {
            tab.style.display = 'none';
          });

          // 클릭한 탭의 내용만 보이도록 설정
          var targetTabId = this.getAttribute('href');
          document.querySelector(targetTabId).style.display = 'block';

          // 선택된 탭 스타일 적용
          tabLinks.forEach(function (link) {
            link.classList.remove('tab-link-active');
          });
          this.classList.add('tab-link-active');
        });
      });
    });

    function ViewLayer(){
      document.querySelector(".layer-page").style.display='block';
      document.getElementById("mask").style.display='block';
    }
    function CloseLayer(){
      document.querySelector(".layer-page").style.display='none';
      document.getElementById("mask").style.display='none';
    }

    $(document).ready(function (){
      $(".write-enquiry").click(function (){
        $(".enquiry_form").toggle();
      });
    });
  </script>
  <style>
    #tab-2, #tab-3 {
      display: none;
    }
    .right {
      position:absolute;
      top:0;
      right:20px;
    }
    button {
      border: none;
      border-radius: 16px;
      color: white;
      width: 95px;
      height: 40px;
      font-size: 16px;
      font-weight: bold;
      position: relative;
      bottom: 7px;
      cursor: pointer;
    }
    .parti{
      background-color: #F6C64F;
    }
    .group_1 {
      display: inline-block;
      margin-left: 5px;
      margin-rignt: 5px;
    }
    .group_2 {
      margin-top: 0;
      margin-bottom: 0;
      text-align: right;
    }
    .group_open {
      margin:20px 0 0 auto;
      cursor: pointer;
      text-align: center;
      padding: 0 20px;
      border-radius: 16px;
      color: white;
      font-size: 16px;
      height: 40px;
      line-height: 40px;
      font-weight: bold;
    }
    .open{
      background: #94C015;
    }
    .flaticon-cancel{
      cursor: pointer;
      font-size:25px !important;
    }
    .toolbar-inner > p{
      font-weight:bold;
    }
    .layer-page{
      display:none;
      box-sizing: border-box;
      position: fixed;
      left: 0;
      bottom: 0;
      width: 100%;
      transform: none;
      background-color: var(--f7-page-bg-color);
      z-index: 9999;
      background: var(--f7-theme-color-light);
      border-radius:20px;
    }
    .layer-border{
      border-radius: 20px;
    }
    #mask {
      width:100%;
      height:100%;
      position:fixed;
      background:rgba(0,0,0,0.7) repeat;
      top:0;
      left:0;
      z-index:999;
      display:none;
    }
  </style>
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
          <img src="../images/slider/slide1.jpg" alt="">
        </div>
        <div class="swiper-slide">
          <img src="../images/slider/slide2.jpg" alt="">
        </div>
        <div class="swiper-slide">
          <img src="../images/slider/slide1.jpg" alt="">
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
              <input type="text" value="4" name="quantity" min="0" max="100" step="1" readonly>
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
            <img src="../images/avatar/1.jpg" alt="">
            <img src="../images/avatar/2.jpg" alt="">
            <img src="../images/avatar/3.jpg" alt="">
          </div>
        </div>
        <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
          <div class="toolbar-inner">
            <a href="#tab-1" class="tab-link tab-link-active">상품 설명</a>
            <a href="#tab-2" class="tab-link">후기</a>
            <a href="#tab-3" class="tab-link">문의</a>
          </div>
        </div>
        <div class="tabs-swipeable-wrap tabs-height-auto">
          <div class="tabs">
            <div id="tab-1" class="tab tab-active">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
              <p>eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
            </div>
            <div id="tab-2" class="tab">
              <div class="list media-list review-list">
                <ul>
                  <li class="list">
                    <div href="#" class="item-link item-content">
                      <div class="item-media"><img src="../images/avatar/1.jpg" width="50"></div>
                      <div class="item-inner">
                        <div class="item-title-row">
                          <div class="item-title">James Logan</div>
                          <div class="item-after stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                        </div>
                        <div class="item-subtitle">27 August 2020</div>
                        <div class="item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sagittis tellus ut turpis condimentum, ut dignissim lacus tincidunt. Cras dolor metus, ultrices condimentum sodales sit amet, pharetra sodales eros. Phasellus vel felis tellus. Mauris rutrum ligula nec dapibus feugiat. In vel dui laoreet, commodo augue id, pulvinar lacus.</div>
                      </div>
                    </div>
                  </li>
                  <li class="list">
                    <div href="#" class="item-link item-content">
                      <div class="item-media"><img src="../images/avatar/2.jpg" width="50"></div>
                      <div class="item-inner">
                        <div class="item-title-row">
                          <div class="item-title">Leo Tucker</div>
                          <div class="item-after stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                        </div>
                        <div class="item-subtitle">15 June 2020</div>
                        <div class="item-text">Phasellus vel felis tellus. Mauris rutrum ligula nec dapibus feugiat. In vel dui laoreet, commodo augue id, pulvinar lacus.</div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div id="tab-3" class="tab">
              <div class="list media-list review-list">
                <form class="form-elements">
                  <div class="list">
                    <div class="list">
                      <ul>
                        <li class="mb-15"><div class="button-large button button-fill write-enquiry">문의 작성하기</div></li>
                      </ul>
                    </div>
                    <div class="enquiry_form" style="display:none">
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
                      <div class="list">
                        <ul style="margin-top:0;">
                          <li class="mb-15"><a href="/home/" class="button-large button button-fill">작성 완료</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </form>
                <div class="page-content content-area pt-30 bottom-sp80">
                  <div class="enquriy_list">
                    <p class="li_pro_name">대저 토마토 1KG</p>
                    <p class="li_en">이 상품 배송 언제 가능할까요 ?</p>
                    <h4>안녕하세요 고객님. 상품은 주문일자로부터 3일<br>
                      이내로 배송이 될 예정입니다.</h4>
                    <i class="fa-solid fa-pencil"></i>
                    <i class="fa-regular fa-trash-can"></i>
                  </div>
                  <div class="enquriy_list">
                    <p class="li_pro_name">대저 토마토 1KG</p>
                    <p class="li_en">이 상품 배송 언제 가능할까요 ?</p>
                    <h4>안녕하세요 고객님. 상품은 주문일자로부터 3일<br>
                      이내로 배송이 될 예정입니다.</h4>
                    <i class="fa-solid fa-pencil"></i>
                    <i class="fa-regular fa-trash-can"></i>
                  </div>
                  <div class="enquriy_list">
                    <p class="li_pro_name">대저 토마토 1KG</p>
                    <p class="li_en">이 상품 배송 언제 가능할까요 ?</p>
                    <h4>안녕하세요 고객님. 상품은 주문일자로부터 3일<br>
                      이내로 배송이 될 예정입니다.</h4>
                    <i class="fa-solid fa-pencil"></i>
                    <i class="fa-regular fa-trash-can"></i>
                  </div>
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
          <a href="javascript:ViewLayer();" class="button-large button btn-block button-fill add-cart-btn active together-order">
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
</div>
<div id="mask"></div>
<div class="layer-page">
  <div class="page-content account-area layer-border">
    <div class="fixed-content py-30">
      <div class="container">
        <div class="tabs">
          <div class="layer-tab tab-active form-elements tabs">
            <form class="layer-tab tab-active" id="tabA1">
              <div class="title-bar mb-20">
                <h3 class="dz-title ma-0">공동구매 참여하기</h3>
                <a href="javascript:CloseLayer();" style="color:#0A3C48"><i class="icon flaticon-cancel" ></i></a>
              </div>
              <div class="title-bar">
                <div class="group_open"><button class="open">공구 개설</button></div>
              </div>
              <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                <div class="toolbar-inner">
                  <div class="avatar-group">
                    <img src="../images/avatar/1.jpg" alt="">
                  </div> &nbsp;&nbsp;&nbsp;&nbsp;
                  <p>권*빈 (1/2)</p>
                  <div class="right">
                    <div class="group_1">
                      <h5 class="group_2">1명 남음</h5>
                      <h5 class="group_2">23:54:36</h5>
                    </div>
                    <div class="group_1"><button class="parti">주문 참여</button></div>
                  </div>
                </div>
              </div>
              <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                <div class="toolbar-inner">
                  <div class="avatar-group">
                    <img src="../images/avatar/1.jpg" alt="">
                    <img src="../images/avatar/2.jpg" alt="">
                  </div> &nbsp;&nbsp;&nbsp;&nbsp;
                  <p>고*용 (2/2)</p>
                  <div class="right">
                    <p>공동구매완료</p>
                  </div>
                </div>
              </div>
              <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                <div class="toolbar-inner">
                  <div class="avatar-group">
                    <img src="../images/avatar/1.jpg" alt="">
                    <img src="../images/avatar/2.jpg" alt="">
                  </div> &nbsp;&nbsp;&nbsp;&nbsp;
                  <p>류*혁 (2/2)</p>
                  <div class="right">
                    <p>공동구매완료</p>
                  </div>
                </div>
              </div>
              <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                <div class="toolbar-inner">
                  <div class="avatar-group">
                    <img src="../images/avatar/1.jpg" alt="">
                    <img src="../images/avatar/2.jpg" alt="">
                  </div> &nbsp;&nbsp;&nbsp;&nbsp;
                  <p>임*철 (2/2)</p>
                  <div class="right">
                    <p>공동구매완료</p>
                  </div>
                </div>
              </div>
              <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                <div class="toolbar-inner">
                  <div class="avatar-group">
                    <img src="../images/avatar/1.jpg" alt="">
                    <img src="../images/avatar/2.jpg" alt="">
                  </div> &nbsp;&nbsp;&nbsp;&nbsp;
                  <p>백*현 (2/2)</p>
                  <div class="right">
                    <p>공동구매완료</p>
                  </div>
                </div>
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
