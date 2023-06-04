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
        .farm-location {
            font-weight: bold;
            font-size: 14px;
            color: #8E8E8E;
        }

        #tab-2, #tab-3 {
            display: none;
        }

        #product-type {
            font-weight: bold;
            font-size: 16px;
            color: #94C015;
        }

        .item-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
            margin-bottom: 20px;
        }

    </style>
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
    </script>
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
            <div class="title"></div>
            <div class="right">
                <i class="icon flaticon-share"></i>
            </div>
            <div class="right">
                <i class="icon flaticon-share"></i>
            </div>
        </div>
    </div>
    <div class="page-content pt-80 bottom-sp90 item-details">
        <div data-pagination='{"el": ".swiper-pagination"}'
             class="swiper swiper-slider-wrapper swiper-init demo-swiper">
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
                        <p class="farm-location">서울시 성북구</p>
                        <h2 class="item-title">팜팜농장</h2>
                    </div>
                </div>
                <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                    <div class="toolbar-inner">
                        <a href="#tab-1" class="tab-link tab-link-active">농장 설명</a>
                        <a href="#tab-2" class="tab-link">판매 상품</a>
                        <a href="#tab-3" class="tab-link">경매</a>
                    </div>
                </div>
                <div class="tabs-swipeable-wrap tabs-height-auto">
                    <div class="tabs">
                        <div id="tab-1" class="tab tab-active">
                            <p>안녕하세요. 각종 채소와 과일을 파는 팜팜 농장입니다.
                                저희 상품들은 모두 프리미엄 상품들로 걱정 안하시고
                                드셔도 됩니다:) 많은 관심 부탁드립니다.</p>
                        </div>
                        <div id="tab-2" class="tab">
                            <!--세션 ID = 농장 주인 ID 일때 판매 상품 등록 가능-->
                            <div class="item-container" >
                                <div class="sell-product-options">
                                    <select id="product-type">
                                        <option value="type" style="display: none;">판매 상품 등록</option>
                                        <option value="regular">일반상품</option>
                                        <option value="group-buying">공동구매</option>
                                    </select>
                                </div>
                            </div>
                            <div class="list media-list review-list">
                                <div class="row">
                                    <div class="col-50 medium-25">
                                        <div class="item-box">
                                            <div class="item-media">
                                                <img src="../images/categories/pic1.jpg" alt=""/>
                                            </div>
                                            <label class="bookmark-btn">
                                                <input type="checkbox" checked/>
                                            </label>
                                            <div class="item-content">
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
                                                <img src="../images/categories/pic2.jpg" alt=""/>
                                            </div>
                                            <label class="bookmark-btn">
                                                <input type="checkbox"/>
                                            </label>
                                            <div class="item-content">
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
                                                <img src="../images/categories/pic3.jpg" alt=""/>
                                            </div>
                                            <label class="bookmark-btn">
                                                <input type="checkbox"/>
                                            </label>
                                            <div class="item-content">
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
                                                <img src="../images/categories/pic4.jpg" alt=""/>
                                            </div>
                                            <label class="bookmark-btn">
                                                <input type="checkbox"/>
                                            </label>
                                            <div class="item-content">
                                                <h3 class="title">
                                                    <a href="/item-details/">아보카도 (1개)</a>
                                                </h3>
                                                <h4 class="price">7,000원</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab">
                            <div class="col-50 medium-25">
                                <h4>진행 중인 경매 2개</h4>
                                <div class="item-box">
                                    <div class="item-media">
                                        <img src="../images/card/card1.png" alt=""/>
                                    </div>
                                    <div class="auction_time"><h3>00 : 27 : 21</h3></div>
                                    <div class="item-content">
                                        <h5>팜팜 농장</h5>
                                        <h3 class="title">
                                            <a href="/item-details/">싱싱한 찰토마토 / 5박스 한정 </a>
                                        </h3>
                                        <h4 class="price">경매 시작가 2,000원</h4>
                                    </div>
                                </div>
                                <div class="item-box">
                                    <div class="item-media">
                                        <img src="../images/card/card2.png" alt=""/>
                                    </div>
                                    <div class="auction_time">
                                        <h3>00 : 27 : 21</h3>
                                    </div>
                                    <div class="item-content">
                                        <h5>팜팜 농장</h5>
                                        <h3 class="title">
                                            <a href="/item-details/">싱싱한 찰토마토 / 5박스 한정 </a>
                                        </h3>
                                        <h4 class="price">경매 시작가 2,000원</h4>
                                    </div>
                                    <!-- 진행 중인 경매가 없을시 -->
                                    <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>
