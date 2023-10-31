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
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        ::-webkit-scrollbar-thumb {
            display: none;
            -ms-overflow-style: none;
            scrollbar-width: none; }

        ::-webkit-scrollbar-thumb:horizontal {
            display: block; /* 가로 스크롤바의 thumb 표시 */
        }
        html{
            overflow: scroll;
        }
        .farm-location {
            font-weight: bold;
            font-size: 14px;
            color: #8E8E8E;
        }

        #tab-2, #tab-3, #tab-4 {
            display: none;
        }
        #tab-4{
            overflow-x: scroll;
            overflow-x:scroll;
            white-space: nowrap;
        }
        #tab-4 > div{
            margin:1em 0;
        }
        #tab-4 table{
            border-top:1px solid #d9d9d9;
            border-bottom:1px solid #d9d9d9;
            border-collapse: collapse;
            overflow-x: scroll;
            /*width:100%;*/
            table-layout: fixed; /* 테이블 너비 고정 */
            /*white-space: nowrap;*/
        }
        #tab-4 th,
        #tab-4 td{
            padding-right:50px;
        }
        #tab-4 th:last-of-type,
        #tab-4 td:last-of-type{
            padding-right:0;
        }
        #tab-4 tr{
            text-align: center;
            border-top:1px solid #d9d9d9;
            height:50px;
        }
        #tab-4 button{
            width:50px;
            border:none;
            background: #94C015;
            color:#fff;
            padding:6px 0;
            border-radius: 5px;
            cursor: pointer;
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

        .flaticon-share {
            cursor: pointer;
            font-size: 28px;
            font-weight: bold;
        }

        .transaction_status_select{
            -webkit-appearance: inherit;
            appearance: inherit;
            border: inherit;
        }

        #tab-2 .row{
            margin-top: 20px;
        }

        /* 팝업 스타일 */
        .buyer-info-popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 999;
            margin:0;
        }

        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        /* 닫기 버튼 */
        #close-popup {
            display: block;
            margin-top: 10px;
            cursor: pointer;
        }

        @media screen and (max-width: 768px) {
            /* 가로 스크롤을 활성화하는 스타일 */
            #tab-4 {
                /*overflow-x: scroll;*/
                width:100%;
            }
            #tab-4 table{
                overflow-x: scroll;
            }
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

        document.addEventListener('DOMContentLoaded', function () {
            // "보기" 버튼 요소를 가져옵니다.
            var viewButtons = document.querySelectorAll(".residence_btn");

            // 팝업 요소를 가져옵니다.
            var popup = document.querySelector('.buyer-info-popup');

            // "닫기" 버튼 요소를 가져옵니다.
            var closeButton = document.querySelector('.close-popup');

            // "보기" 버튼에 클릭 이벤트 리스너를 추가합니다.
            viewButtons.forEach(function (viewButton) {
                viewButton.addEventListener('click', function () {
                    // 팝업을 표시합니다.
                    popup.style.display = 'block';

                    // 팝업 내용을 채웁니다. (거주지 정보를 가져와서 표시)
                    var buyerAddress = this.closest('tr').querySelector('.address').innerText;
                    console.log(buyerAddress);
                    var popupContent = popup.querySelector('.popup-content');
                    popupContent.querySelector('.buyer-address').innerHTML = buyerAddress;
                });
            });

            // "닫기" 버튼에 클릭 이벤트 리스너를 추가하여 팝업을 닫습니다.
            closeButton.addEventListener('click', function () {
                popup.style.display = 'none';
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
                        alert("농장이 삭제 되었습니다.");
                        location.href = "/myPage";
                    },
                    error: function (xhr, status, error) {
                        console.error(error);
                        alert("상품이 등록되어 있어 농장을 삭제할 수 없습니다.");
                    }
                });
            }
        }

        function toggleEditMode(button) {
            var patchData;
            var selectedStatus;
            var row = button.closest('tr');
            var editButton = row.querySelector('.edit_btn');
            var statusCell = row.querySelector('.transaction_status');
            var invoiceCell = row.querySelector('.tracking_number');
            var newTrackingNumber = invoiceCell.querySelector('input').value;

            if (editButton.textContent === '수정') {
                editButton.textContent = '저장';

                var select = document.createElement('select');
                select.value = statusCell.textContent;
                var options = ['상품준비', '배송중', '배송완료'];
                options.forEach(function(option) {
                    var optionElement = document.createElement('option');
                    optionElement.text = option;
                    select.add(optionElement);
                });
                select.style.appearance = "button";

                statusCell.textContent = '';
                statusCell.appendChild(select);

                select.addEventListener('change', function() {
                    selectedStatus = select.value;
                    if (selectedStatus === '배송중') {
                        invoiceCell.querySelector('input').style.display = 'block';
                    }
                    else {
                        invoiceCell.querySelector('input').style.display = 'none';
                        invoiceCell.querySelector('p').style.display = 'none';
                    }

                    if (editButton.textContent === '수정'){
                        invoiceCell.querySelector('input').style.display = 'none';
                        invoiceCell.querySelector('p').style.display = 'block';
                    }
                });
            } else {
                editButton.textContent = '수정';

                statusCell.textContent = statusCell.querySelector('select').value;

                var invoiceInput = invoiceCell.querySelector('input');
                var invoiceText = invoiceCell.querySelector('p');

                invoiceInput.style.display = 'none';
                invoiceText.style.display = 'block';
                invoiceText.textContent = invoiceInput.value;

                let od_id = button.getAttribute('data-od_id');

                patchData = {
                    deliveryStatus: statusCell.textContent,
                    trackingNum: newTrackingNumber
                };

                fetch('/farm/order/' + od_id, {
                    method: 'PATCH',
                    body: JSON.stringify(patchData),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(response => {
                    if (response.ok) {
                        alert('사용자의 배송 상태가 올바르게 변경되었습니다.');
                    } else {
                        alert('오류가 발생했습니다.');
                        throw new Error('Network response was not ok');
                    }
                }).catch(error => {
                    alert('오류가 발생했습니다.');
                });
            }
        }

        function clip(){
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = window.document.location.href;
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
            alert("URL이 복사되었습니다.")
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
                        <p class="farm-location">${farm.locationCity}&nbsp;${farm.locationGu}</p>
                        <h2 class="item-title">${farm.name}</h2>
                    </div>
                    <div>
                        <i class="icon flaticon-share" onclick="clip(); return false;"></i>
                    </div>
                </div>
                <div class="toolbar toolbar-bottom tabbar tab-style-2 tabbar-scrollable">
                    <div class="toolbar-inner">
                        <a href="#tab-1" class="tab-link tab-link-active">농장 설명</a>
                        <a href="#tab-2" class="tab-link">판매 상품</a>
                        <a href="#tab-3" class="tab-link">경매</a>
                        <c:if test="${farm.user.UId == user.UId}">
                            <a href="#tab-4" class="tab-link">내 상품 구매자 조회</a>
                        </c:if>

                    </div>
                </div>
                <div class="tabs-swipeable-wrap tabs-height-auto">
                    <div class="tabs">
                        <div id="tab-1" class="tab tab-active">
                            <p>${farm.detail}</p>
                            <p style="margin-top:-12px">
                                <em class="link">
                                    <%--                                    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">--%>
                                    <%--                                        혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.--%>
                                    <%--                                    </a>--%>
                                </em>
                            </p>
                            <div id="map" style="width:100%;height:350px;"></div>

                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547b485b92252f5f3b1f8d3253d2b9d5&libraries=services"></script>
                            <script>
                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                    mapOption = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                        level: 3 // 지도의 확대 레벨
                                    };
                                console.log("111111111111111111111111");
                                // 지도를 생성합니다
                                var map = new kakao.maps.Map(mapContainer, mapOption);
                                console.log("22222222222222222222222222");
                                // 주소-좌표 변환 객체를 생성합니다
                                var geocoder = new kakao.maps.services.Geocoder();
                                console.log("${farm.locationFull}");
                                // 주소로 좌표를 검색합니다
                                geocoder.addressSearch("${farm.locationFull}", function(result, status) {

                                    // 정상적으로 검색이 완료됐으면
                                    if (status === kakao.maps.services.Status.OK) {

                                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                        // 결과값으로 받은 위치를 마커로 표시합니다
                                        var marker = new kakao.maps.Marker({
                                            map: map,
                                            position: coords
                                        });

                                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                                        var infowindow = new kakao.maps.InfoWindow({
                                            content: '<div style="width:150px;text-align:center;padding:6px 0;">${farm.name}</div>'
                                        });
                                        infowindow.open(map, marker);

                                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                        map.setCenter(coords);
                                    }
                                });
                            </script>
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
                        <div id="tab-3" class="tab">
                            <div class="col-50 medium-25">
                                <c:set var="auctionCount" value="0"/>
                                <h4>진행 중인 경매</h4>
                                <c:forEach var="product" items="${productList}">
                                    <c:if test="${product.open_status != 2}">
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
                                    </c:if>
                                </c:forEach>
                                <c:if test="${auctionCount == 0}">
                                    <h4 class="price" style="text-align: center">진행 중인 경매 상품이 없어요.</h4>
                                </c:if>
                        </div>
                </div>
                <div id="tab-4" class="tab">
                    <div class="col-50 medium-25">
                        <table>
                            <th>상품명</th>
                            <th>구매자 이름</th>
                            <th>상품 수량</th>
                            <th>거래 방법</th>
                            <th>거래 상태</th>
                            <th>송장번호</th>
                            <th style="padding-right: 20px">거주지</th>
                            <th>상태</th>
                            <th style="display: none"></th>
                            <c:forEach var="order" items="${myFarmOrderList}">
                                <tr>
                                    <td>${order.product.name}</td>
                                    <td>${order.order.user.nickname}</td>
                                    <td>${order.quantity}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.order.delivery == false}">직거래</c:when>
                                            <c:when test="${order.order.delivery == true}">배송</c:when>
                                        </c:choose>
                                    </td>
                                    <td class="transaction_status">
                                        <c:choose>
                                            <c:when test="${order.deliveryStatus == null}">---</c:when>
                                            <c:when test="${order.deliveryStatus != null}">${order.deliveryStatus}</c:when>
                                        </c:choose>
                                    </td>
                                    <td class="tracking_number">
                                            ${order.trackingNum}
                                        <p style="display: none;"></p>
                                        <input type="text" style="display: none; width:150px; border: #1b1b1b solid 1px ">
                                    </td>
                                    <td style="padding-right: 20px">
                                        <c:choose>
                                            <c:when test="${order.order.delivery == false}"><button class="residence_btn" disabled style="background:#d9d9d9">보기</button></c:when>
                                            <c:when test="${order.order.delivery == true}"><button class="residence_btn">보기</button></c:when>
                                        </c:choose>
                                    </td>
                                    <td><button data-od_id="${order.odId}" onclick="toggleEditMode(this)" class="edit_btn">수정</button></td>
                                    <td style="display: none" class="address"><input type="hidden">${order.order.delivery_address} ${order.order.delivery_address_detail}</td>
                                </tr>
                                <div class="buyer-info-popup">
                                    <div class="popup-content">
                                        <h2>거주지 정보</h2>
                                        <p><strong>거주지:</strong> <span class="buyer-address"></span></p>
                                        <button class="close-popup">닫기</button>
                                    </div>
                                </div>
                            </c:forEach>
                        </table>
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
