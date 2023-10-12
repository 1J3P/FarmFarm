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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script>
        $(function(){
            var swiper = new Swiper(".swiper", {
                spaceBetween: 30,
                centeredSlides: true,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                autoplay: {     //자동슬라이드 (false-비활성화)
                    delay: 3500, // 시간 설정
                    disableOnInteraction: false, // false-스와이프 후 자동 재생
                },
            });
        })
    </script>
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

        function ViewLayer() {
            document.querySelector(".layer-page").style.display = 'block';
            document.getElementById("mask").style.display = 'block';
        }

        function CloseLayer() {
            document.querySelector(".layer-page").style.display = 'none';
            document.getElementById("mask").style.display = 'none';
        }

        $(document).ready(function () {
            $(".write-enquiry").click(function () {
                $(".enquiry_form").toggle();
            });
        });

        function decreaseValue() {
            var input = document.getElementById('quantityInput');
            var currentValue = parseInt(input.value);
            if (currentValue > 0) {
                input.value = currentValue - 1;
            }
        }


        function increaseValue() {
            var input = document.getElementById('quantityInput');
            var currentValue = parseInt(input.value);
            var maxValue = parseInt(input.max);
            if (currentValue < maxValue) {
                input.value = currentValue + 1;
            }
        }
        function confirmAndDeleteProduct(pId) {
            // 알림 창을 표시하여 사용자의 확인을 받습니다.
            if (confirm("정말로 삭제하시겠습니까?")) {
                // AJAX를 사용하여 삭제 요청을 보냅니다.
                $.ajax({
                    url: "/product/" + pId,
                    type: "DELETE",
                    success: function (response) {
                        alert("삭제 되었습니다.");
                        location.href="localhost:9000/";
                        location.href = "http://localhost:9000/";
                        window.location.href("http://localhost:9000/");
                        window.location.href = "http://localhost:9000/";
                        window.location.assign("http://localhost:9000/");
                        window.location.replace("http://localhost:9000/");
                    },
                    error: function (xhr, status, error) {
                        console.error(error);
                        alert("삭제 요청을 처리할 수 없습니다.");
                    }
                });
            }
        }
    </script>
    <style>
        #tab-2, #tab-3 {
            display: none;
        }

        .right {
            position: absolute;
            top: 0;
            right: 20px;
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

        .parti {
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
            margin: 20px 0 0 auto;
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

        .open {
            background: #94C015;
        }

        .flaticon-cancel {
            cursor: pointer;
            font-size: 25px !important;
        }

        .toolbar-inner > p {
            font-weight: bold;
        }

        .layer-page {
            display: none;
            box-sizing: border-box;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            transform: none;
            background-color: var(--f7-page-bg-color);
            z-index: 9999;
            background: var(--f7-theme-color-light);
            border-radius: 20px;
        }

        .layer-border {
            border-radius: 20px;
        }

        #mask {
            width: 100%;
            height: 100%;
            position: fixed;
            background: rgba(0, 0, 0, 0.7) repeat;
            top: 0;
            left: 0;
            z-index: 999;
            display: none;
        }

        .fa-pencil {
            margin-right: 20px;
        }

        .flaticon-share {
            cursor: pointer;
            font-size: 28px;
            font-weight: bold;
        }

        #enquiryBtn {
            width: 100%;
        }

        /*.swiper{*/
        /*    position: inherit;*/
        /*}*/
    </style>
</head>
<body>
<input type="hidden" value="${Authorization}" id="Auth">
<div class="page light">
    <div class="navbar navbar-style-1 navbar-transparent">
        <div class="navbar-inner">
            <div class="left">
                <a href="/product/list" class="link back">
                    <i class="icon flaticon-left"></i>
                </a>
            </div>
            <div class="title"></div>
            <div class="right">
                <i class="fa-solid fa-pencil"></i>
                <i class="fa-regular fa-trash-can" onclick="confirmAndDeleteProduct(${product.PId})"></i>
            </div>
        </div>
    </div>
    <div class="page-content pt-80 bottom-sp90 item-details">
        <div data-pagination='{"el": ".swiper-pagination"}'
             class="swiper swiper-slider-wrapper swiper-init demo-swiper">
            <div class="swiper-wrapper">
                <c:if test="${product.image1 != ''}">
                    <div class="swiper-slide">
                        <img src="${product.image1}" alt="">
                    </div>
                </c:if>
                <c:if test="${product.image2 != ''}">
                    <div class="swiper-slide">
                        <img src="${product.image2}" alt="">
                    </div>
                </c:if>
                <c:if test="${product.image3 != ''}">
                    <div class="swiper-slide">
                        <img src="${product.image3}" alt="">
                    </div>
                </c:if>
            </div>
            <div class="swiper-pagination"></div>
        </div>
<%--        <div class="dz-banner-height"></div>--%>
        <div class="fixed-content py-30">
            <div class="container">
                <div class="item-info">
                    <div class="clearfix">
                        <h3 class="category">${product.farm.name}</h3>
                        <h2 class="item-title">${product.name}</h2>
                    </div>
                    <div>
                        <i class="icon flaticon-share"></i>
                    </div>
                </div>
                <div class="item-info">
                    <div class="clearfix">
                        <h2 class="text-primary item-price"><fmt:formatNumber type="number"
                                                                              value="${product.price}"/>원</h2>
                    </div>
                    <div class="stepper stepper-small stepper-round stepper-init">
                        <div class="stepper-button-minus" onclick="decreaseValue()"></div>
                        <div class="stepper-input-wrap">
                            <input type="text" value="1" name="quantity" min="0" max="100" step="1" id="quantityInput"
                                   readonly>
                        </div>
                        <div class="stepper-button-plus" onclick="increaseValue()"></div>
                    </div>
                </div>
                <div class="item-info">
                    <div class="reviews-info">
                        <i class="fa fa-star"></i>
                        <h5 class="reviews">${product.rating}</h5>
                        <p class="reviews-text">(${reviews.size()} reviews)</p>
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
                            <p>${product.detail}</p>
                        </div>
                        <div id="tab-2" class="tab">
                            <div class="list media-list review-list">
                                <ul>
                                    <c:forEach var="review" items="${reviews}">
                                        <li class="list">
                                            <div href="#" class="item-link item-content">
                                                <div class="item-media"><img src="../images/avatar/1.jpg" width="50">
                                                </div>
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div class="item-title">${review.user.nickname}</div>
                                                        <div class="item-after stars">
                                                            <c:choose>
                                                                <c:when test="${review.productStar == 5.0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:when test="${review.productStar == 4.0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:when>
                                                                <c:when test="${review.productStar == 3.0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:when>
                                                                <c:when test="${review.productStar == 2.0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:when>
                                                                <c:when test="${review.productStar == 1.0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:when>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="item-text">${review.comment}</div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div id="tab-3" class="tab">
                            <div class="list media-list review-list">
                                <form class="form-elements" id="form">
                                    <div class="list">
                                        <div class="list">
                                            <ul>
                                                <li class="mb-15">
                                                    <div class="button-large button button-fill write-enquiry">문의 작성하기
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="enquiry_form" style="display:none">
                                            <ul class="row">
                                                <li class="item-content item-input col-100 item-input-with-value">
                                                    <div class="item-inner">
                                                        <label class="form-label"><b>1:1 문의 작성</b></label>
                                                        <div class="item-input-wrap">
                                                            <textarea style="height: 150px;" rows="5"
                                                                      placeholder="1:1 문의 내용을 작성해주세요"
                                                                      class="form-control" name="content"/></textarea>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="list">
                                                <ul style="margin-top:0;">
                                                    <li class="mb-15">
                                                        <button class="button-large button button-fill" type="button"
                                                                id="enquiryBtn">작성 완료
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="page-content content-area pt-30 bottom-sp80">
                                    <c:forEach var="enquiry" items="${enquiries}">
                                        <div class="enquiry_list">
                                            <div class="item-title-row">
                                                <div class="item-title">${enquiry.user.nickname}님</div>
                                            </div>
                                            <p class="li_en">${enquiry.content}</p>
                                            <i class="fa-solid fa-pencil"></i>
                                            <i class="fa-regular fa-trash-can"></i>
                                        </div>
                                    </c:forEach>
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
                <c:if test="${product.group == true}">
                    <div class="col-30">
                        <button type="button" onclick="ViewLayer()"
                                class="button-large button btn-block button-fill add-cart-btn active together-order"
                                style="width:100%">같이 주문<span class="price"><fmt:formatNumber type="number"
                                                                                              value="${product.price * 0.9}"/>원</span>
                        </button>
                    </div>
                    <div class="col-70">
                        <button type="button" class="button-large button add-cart-btn btn-block button-fill onePurchaseBtn"
                                style="width:100%">혼자 주문<span class="price"><fmt:formatNumber
                                type="number" value="${product.price}"/>원</span></button>
                    </div>
                </c:if>
                <c:if test="${product.group == false}">
                    <div class="col-30" style="display: none">
                        <button type="button" onclick="ViewLayer()"
                                class="button-large button btn-block button-fill add-cart-btn active together-order"
                                style="width:100%">같이 주문<span class="price"><fmt:formatNumber type="number"
                                                                                              value="${product.price * 0.9}"/>원</span>
                        </button>
                    </div>
                    <div class="col-70" style="width:100%">
                        <button type="button" class="button-large button add-cart-btn btn-block button-fill onePurchaseBtn"
                                style="width:100%">혼자 주문<span class="price"><fmt:formatNumber
                                type="number" value="${product.price}"/>원</span></button>
                    </div>
                </c:if>
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
                                <a href="javascript:CloseLayer();" style="color:#0A3C48"><i
                                        class="icon flaticon-cancel"></i></a>
                            </div>
                            <div class="title-bar">
                                <div class="group_open">
                                    <button class="open" id="group_open">공구 개설</button>
                                </div>
                            </div>
                            <c:if test="${empty groups}">
                                <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                                    <div class="toolbar-inner">
                                        공동 구매를 개설해보세요!
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not empty groups}">
                                <c:forEach var="group" items="${groups}">
                                    <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                                        <div class="toolbar-inner">
                                            <div class="avatar-group">
                                                <c:if test="${group.user1 ne null}">
                                                    <img src="${group.user1.image}" alt="">
                                                </c:if>
                                                <c:if test="${group.user2 ne null}">
                                                    <img src="${group.user2.image}" alt="">
                                                </c:if>
                                            </div> &nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>${group.user1.nickname} (${2 - group.capacity}/2)</p>
                                            <div class="right" name="ChangeByGroupStatus" data-group-id="${group.GId}">
                                                <c:if test="${group.capacity eq 1}">
                                                    <div class="group_1">
                                                        <h5 class="group_2">1명 남음</h5>
                                                        <h5 class="group_2" name = "remain_time"></h5>
                                                        <input type="hidden" name="back_time" value="${group.closed_at}">
                                                    </div>
                                                    <div class="group_1">
                                                        <button class="parti" name="group_attend"
                                                                onclick="groupAttend(${group.GId})">주문 참여
                                                        </button>
                                                    </div>
                                                    <input type="hidden" id="groupId" class="groupId">
                                                </c:if>
                                                <c:if test="${group.capacity eq 0}">
                                                    <p>공동구매완료</p>
                                                </c:if>`
                                                <c:if test="${group.isClose eq 1}">
                                                    <p>공동구매종료</p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var GID;

    function groupAttend(gId) {
        var groupInput = document.getElementById("groupId");
        groupInput.setAttribute("value", gId);
        GID = gId;
        console.log(gId);
    }

    window.onload = function () {
        function objectifyForm(formArray) {
            var returnArray = {};
            for (var i = 0; i < formArray.length; i++) {
                returnArray[formArray[i]['name']] = formArray[i]['value'];
            }
            return returnArray;
        }

        var auth = document.getElementById("Auth").value;
        console.log("auth 확인" + auth);
        $("#enquiryBtn").on("click", function () {
            var formsubmitSerialArray = $("#form").serializeArray();
            var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));
            var pId = ${p_id};
            console.log(formsubmitSerialArray);
            console.log(formsubmit);
            $.ajax({
                type: "POST",
                async: false,
                url: "/enquiry/" + pId,
                data: formsubmit,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Content-type", "application/json");
                    xhr.setRequestHeader("Authorization", auth);
                },
                success: function (data) {
                    alert("문의사항을 등록하였습니다.");
                    console.log(data);
                    location.href = "/product/" + pId;
                },
                error: function (request, status, error) {
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            });
        });

        $(".onePurchaseBtn").on("click", function () {
            // var formsubmitSerialArray = $("#form").serializeArray();
            // var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));
            var pId = ${p_id};
            var quantity = parseInt(document.getElementById('quantityInput').value);
            // console.log(formsubmitSerialArray);
            // console.log(formsubmit);
            $.ajax({
                type: "POST",
                async: false,
                url: "/product/" + pId + "/cart",
                data: JSON.stringify({
                    "quantity": quantity
                }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Content-type", "application/json");
                    xhr.setRequestHeader("Authorization", auth);
                },
                success: function (data) {
                    alert(quantity + "개의 상품이 장바구니에 담겼습니다.");
                    console.log(data);
                    location.href = "/product/cart";
                },
                error: function (request, status, error) {
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            });
        });
        var group = document.getElementById("group_open");
        group.addEventListener('click', function (e) {
            var quantity = parseInt(document.getElementById('quantityInput').value);
            e.preventDefault();
            var pId = ${p_id};
            console.log(pId);
            var link = "http://localhost:9000/order/product/" + pId + "/group?quantity=" + quantity;
            console.log(link);
            location.href = "http://localhost:9000/order/product/" + pId + "/group?quantity=" + quantity;
            window.location.href("http://localhost:9000/order/product/" + pId + "/group?quantity=" + quantity);
            window.location.href = "http://localhost:9000/order/product/" + pId + "/group?quantity=" + quantity;
            window.location.assign("http://localhost:9000/order/product/" + pId + "/group?quantity=" + quantity);
            window.location.replace(link);
        });
        var groupIn = document.getElementsByName("group_attend");
        for (let i = 0; i < groupIn.length; i++) {
            groupIn[i].addEventListener('click', function (e) {
                e.preventDefault();
                setTimeout(function () {
                    var quantity = parseInt(document.getElementById('quantityInput').value);
                    console.log("groupId!!!!!!!!!!!!!!!!!" + GID);
                    var link = "http://localhost:9000/order/group/" + GID + "?quantity=" + quantity;
                    location.href = "http://localhost:9000/order/group/" + GID + "?quantity=" + quantity;
                    window.location.href("http://localhost:9000/order/group/" + GID + "?quantity=" + quantity);
                    window.location.href = "http://localhost:9000/order/group/" + GID + "?quantity=" + quantity;
                    window.location.assign("http://localhost:9000/order/group/" + GID + "?quantity=" + quantity);
                    window.location.replace(link);
                }, 500);

            })
        }
        function updateCountdown() {
            let backTimestamp;
            let timeRemaining;
            let seconds;
            let minutes;
            let hours;
            var remains = document.getElementsByName("remain_time");
            var pId = ${p_id};
            console.log("remain length : " + remains.length);
            for (let i = 0; i < remains.length; i++) {
                let now = new Date();
                var timestampString = document.getElementsByName("back_time")[i].value;
                const parts = timestampString.split(/[- :.]/);
                backTimestamp = new Date(parts[0], parts[1] - 1, parts[2], parts[3], parts[4], parts[5]);
                console.log("백엔드 시간 : " + backTimestamp);
                console.log("지금 시간 : " + now);
                timeRemaining = backTimestamp - now;
                console.log("남은 시간 : " + timeRemaining);
                let remain = remains[i];
                let parentDiv = remain.closest(".right");

                if (timeRemaining <= 0) { //원래는 0
                    parentDiv.innerHTML = "공동구매종료";
                    let groupId = parentDiv.getAttribute("data-group-id");
                    console.log("gid : " + groupId);
                } else {
                    seconds = Math.floor(timeRemaining / 1000) % 60;
                    minutes = Math.floor(timeRemaining / (1000 * 60)) % 60;
                    hours = Math.floor(timeRemaining / (1000 * 60 * 60)) % 24;
                }
                let countdownString = hours + ':' + minutes + ':' + seconds;
                remains[i].innerText = countdownString;
            }
        }
        updateCountdown();
        // 1초마다 업데이트
        setInterval(updateCountdown, 1000);
    };
</script>
</html>