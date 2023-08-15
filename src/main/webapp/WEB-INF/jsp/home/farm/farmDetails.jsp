<%@ page import="com.example.farmfarm.Entity.UserEntity" %>
<%@ page import="com.example.farmfarm.Entity.FarmEntity" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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

        .sell-product-options {
            font-weight: bold;
            font-size: 16px;
            color: #94C015;
            cursor: pointer;
        }

        .item-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .fa-pencil {
            margin-right: 20px;
        }

        .flaticon-share {
            cursor: pointer;
            font-size: 28px;
            font-weight: bold;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        function confirmAndDeleteFarm(fId) {
            // 알림 창을 표시하여 사용자의 확인을 받습니다.
            if (confirm("정말로 삭제하시겠습니까?")) {
                // AJAX를 사용하여 삭제 요청을 보냅니다.
                $.ajax({
                    url: "/farm/" + fId,
                    type: "DELETE",
                    success: function (response) {
                        alert("삭제 되었습니다.");
                        location.href = "http://localhost:9000/myPage";
                    },
                    error: function (xhr, status, error) {
                        console.error(error);
                        alert("삭제 요청을 처리할 수 없습니다.");
                    }
                });
            }
        }

    </script>
</head>
<body>
<div class="page light">
    <div class="navbar navbar-style-1 navbar-transparent">
        <div class="navbar-inner">
            <div class="left">
                <a href="/farm/list" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title"></div>
            <div class="right">
                <!-- 수정 필요 -->
                <!-- 로그인 아이디 == {farm.user.UId} 이면 -->
                <c:if test="${farm.user.UId == user.UId}">
                    <i class="fa-solid fa-pencil"></i>
                    <i class="fa-regular fa-trash-can" onclick="confirmAndDeleteFarm(${farm.FId})"></i>
                </c:if>
            </div>
        </div>
    </div>
    <div class="page-content pt-80 bottom-sp90 item-details">
        <div data-pagination='{"el": ".swiper-pagination"}'
             class="swiper swiper-slider-wrapper swiper-init demo-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="${farm.image}" alt="">
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
                        <p class="farm-location">${farm.location_city}&nbsp;${farm.location_gu}</p>
                        <h2 class="item-title">${farm.name}</h2>
                    </div>
                    <div>
                        <i class="icon flaticon-share"></i>
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
                            <p>${farm.detail}</p>
                        </div>
                        <div id="tab-2" class="tab">
                            <!-- 로그인 아이디 == {farm.user.UId} 이면 -->
                            <c:if test="${farm.user.UId == user.UId}">
                            <div class="item-container">
                                <div class="sell-product-options" onclick="location.href='/product'">
                                    판매 상품 등록
                                </div>
                            </div>
                            </c:if>
                            <div class="row">
                                <c:forEach var="product" items="${productList}">
                                    <c:if test="${!product.auction}">
                                        <div class="col-50 medium-25" onclick="location.href='/product/${product.PId}'">
                                            <div class="item-box">
                                                <div class="item-media">
                                                    <img src="${product.image1}"
                                                         alt=""/>
                                                </div>
                                                <label class="bookmark-btn">
                                                    <input type="checkbox" checked/>
                                                </label>
                                                <div class="item-content">
                                                    <h5>${product.farm.name}</h5>
                                                    <h3 class="title">
                                                            ${product.name}
                                                    </h3>
                                                    <h4 class="price">${product.price}원</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${productList.size() == 0}">
                                    <h4 class="price" style="margin: 30px auto;">판매 중인 상품이 없어요.</h4>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-3" class="tab">
                    <div class="col-50 medium-25">
                        <c:set var="auctionCount" value="0"/>
                        <h4>진행 중인 경매</h4>
                        <c:forEach var="product" items="${productList}">
                            <c:if test="${product.auction}">
                                <c:set var="auctionCount" value="${auctionCount + 1}"/>
                                <div class="item-box" onclick="location.href='/product/${product.PId}'">
                                    <div class="item-media">
                                        <img src=${product.image1}
                                                     alt=""/>
                                    </div>
                                    <div class="auction_time"><h3 class="ac-time" data-date="${product.date}"></h3>
                                    </div>
                                    <div class="item-content">
                                        <h5>${product.farm.name}</h5>
                                        <h3 class="title">
                                            <a href="/home/auction/auctionDetail">${product.name}</a>
                                        </h3>
                                        <h4 class="price">경매 시작가 1,000원</h4>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${auctionCount == 0}">
                            <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function () {
        const remainTimeElements = document.querySelectorAll(".ac-time");

        remainTimeElements.forEach((element) => {
            function updateCountdown() {
                const targetDate = moment(element.dataset.date);
                const currentDate = moment();
                const diff = targetDate.diff(currentDate);

                const diffDuration = moment.duration(diff);
                const diffHour = String(diffDuration.hours()).padStart(2, "0");
                const diffMin = String(diffDuration.minutes()).padStart(2, "0");
                const diffSec = String(diffDuration.seconds()).padStart(2, "0");
                element.innerText = diffHour + " : " + diffMin + " : " + diffSec;
            }

            updateCountdown();
            setInterval(updateCountdown, 1000);
        });
    };
</script>
</body>
</html>
