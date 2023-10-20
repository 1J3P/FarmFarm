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

    <link rel="stylesheet" href="/style/framework7-bundle.min.css"/>
    <link rel="stylesheet" href="/style/app.css"/>

    <link
            rel="stylesheet"
            href="/style/font-awesome/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="/style/line-awesome/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="/style/flaticons/flaticon.css"/>

    <link rel="stylesheet" href="/style/style.css"/>

    <link rel="apple-touch-icon" href="../images/f7-icon-square.png"/>
    <link rel="icon"
          href="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/10591631-d5da-4804-b013-ff6eccbed6f7.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        var mapContainer = document.getElementById('map');
        $(document).ready(function () {
            $("input[name='delivery']").change(function () {
                if ($("input[name='delivery']:checked").val() == 'true') {
                    $('.check-delivery').show();
                } else if ($("input[name='delivery']:checked").val() == 'false') {
                    $('.check-delivery').hide();
                }
            });
        });
        function goPopup(){
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("/popup","pop","scrollbars=yes, resizable=yes");

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
        }
        function jusoCallBack(roadAddrPart1, addrDetail, siNm, sggNm){
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            console.log(roadAddrPart1);
            document.querySelector("#delivery_address").value = roadAddrPart1;
            document.querySelector("#delivery_address_detail").value = addrDetail;
            console.log("전체 주소 ! " + roadAddrPart1);
            console.log("상세 주소 ! " + addrDetail);
            console.log("시/도 ! " + siNm);
            console.log("시/군/구 ! " + sggNm);
            displayMap();
        }
        var deliveryRadio = document.getElementById("delivery-no");
        deliveryRadio.addEventListener("click", function () {
            console.log("클릭이벤트 발생여부")
            var dd = document.getElementById("check-delivery");
            if (deliveryRadio.checked) {
                dd.style.display = "none";
            } else {
                dd.style.display = "block";
            }
        })
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547b485b92252f5f3b1f8d3253d2b9d5&libraries=services"></script>
    <style>
        .item-input-wrap [type="radio"] {
            vertical-align: middle;
            appearance: none;
            background: #d9d9d9;
            border-radius: 50%;
            width: 2em;
            height: 2em;
            margin-right: 10px;
        }

        .item-input-wrap [type="radio"]:checked {
            background: #94C015;
        }
        .file-label {
            margin: 30px 0;
            background-color: #94C015;
            color: #fff;
            text-align: center;
            font-size:13px;
            padding: 7px 20px;
            width: 60%;
            border-radius: 13px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/product/cart" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">배송 정보 입력</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="container">
            <div class="tabs" style="margin-top: 50px">
                <div class="tab tab-active form-elements tabs">
                    <form class="tab tab-active" id="tabA1">
                        <div class="list mb-0">
                            <ul class="row">
                                <li class="item-content item-input col-100 item-input-with-value">
                                    <div class="item-inner">
                                        <h4>이름</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" name="delivery_name" placeholder="이름을 입력하세요"
                                                   id="username" class="form-control"/>
                                        </div>

                                        <h4>전화번호</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" name="delivery_phone" placeholder="전화번호를 입력하세요"
                                                   id="phone" class="form-control"/>
                                        </div>
                                        <h4>거래 방식</h4>
                                        <div class="item-input-wrap">
                                            <c:choose>
                                                <c:when test="${isDirect == 0}"> <!-- 배송 / 직거래 둘 다 가능-->
                                                    <label><input type="radio" id="delivery-yes" name="delivery" value="true" checked/>배송(+3000원)</label>
                                                    <label><input type="radio" id="delivery-no" name="delivery" value="false"/>직거래</label>
                                                    <div class="check-delivery" id="check-delivery" style="margin-top:40px;">
                                                        <h4>배송 요청사항</h4>
                                                        <div class="item-input-wrap">
                                                            <input type="email" name="delivery_memo"
                                                                   placeholder="배송 요청 사항을 입력하세요" id="email"
                                                                   class="form-control"/>
                                                        </div>
                                                        <h4 style="display: inline-block">주소</h4><span style="margin-left: 10px;"><label class="file-label" onclick="goPopup();" style="padding: 10px 30px;">주소 찾기</label></span>
                                                        <div class="item-input-wrap">
                                                            <input type="text" name="delivery_address" placeholder="주소를 입력하세요"
                                                                   id="delivery_address" class="form-control" readonly/>
                                                        </div>
                                                        <div class="item-input-wrap">
                                                            <input type="text" name="delivery_address_detail"
                                                                   placeholder="상세 주소를 입력하세요" id="delivery_address_detail"
                                                                   class="form-control" readonly/>
                                                        </div>
                                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547b485b92252f5f3b1f8d3253d2b9d5&libraries=services"></script>
                                                        <p style="margin-top:-12px">
                                                            <em class="link">
                                                                    <%--                                    <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">--%>
                                                                    <%--                                        혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.--%>
                                                                    <%--                                    </a>--%>
                                                            </em>
                                                        </p>
                                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547b485b92252f5f3b1f8d3253d2b9d5&libraries=services"></script>
                                                        <div id="map" style="width:100%;height:350px; "></div>
                                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=547b485b92252f5f3b1f8d3253d2b9d5&libraries=services"></script>


                                                    </div>
                                                </c:when>
                                                <c:otherwise> <!-- 직거래만 가능 -->
                                                    <label><input type="radio" id="true_" name="delivery" value="true" disabled/>배송</label>
                                                    <label><input type="radio" id="false_" name="delivery"
                                                                  value="false" checked/>직거래</label>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="list" style="margin-top: 50px">
                            <ul>
                                <li class="mb-15"><a class="button-large button button-fill" id="createOrder">결제하기</a>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function () {
        function objectifyForm(formArray) {
            var returnArray = {};
            for (var i = 0; i < formArray.length; i++) {
                returnArray[formArray[i]['name']] = formArray[i]['value'];
            }
            return returnArray;
        }

        $("#createOrder").on("click", function () {
            var formsubmitSerialArray = $("#tabA1").serializeArray();
            var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));

            console.log(formsubmitSerialArray);
            console.log(formsubmit);
            jQuery.ajax({
                type: "POST",
                async: true,
                url: "/order",
                data: formsubmit,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("uid", <%= session.getAttribute("uid") %>);
                },
                success: function (data) {
                    console.log(data);
                    console.log(data.oid);
                    jQuery.ajax({
                        type: "POST",
                        async: true,
                        url: "/pay/order/" + data.oid,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            alert("결제창으로 이동합니다.");
                            console.log(data);
                            console.log(data.oid);
                            console.log(data.next_redirect_pc_url);
                            location.href = data.next_redirect_pc_url;
                        },
                        error: function (request, status, error) {
                            console.log(request);
                            console.log(status);
                            console.log(error);
                        }
                    });
                },
                error: function (request, status, error) {
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            });
        });
    };

    function displayMap() {
        var address = document.getElementById('delivery_address').value;
        console.log(address + " displayMap!");
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div

        mapContainer.style.display = 'block'; // 지도 컨테이너 표시
        initializeMap(address); // 주소를 기반으로 지도 초기화
    }
    function initializeMap(address) {
        console.log("initializeMap!");
        // Kakao 지도 초기화 및 표시
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

// 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
        geocoder.addressSearch(address, function(result, status) {

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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">배송 장소</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    }
</script>
</body>
</html>
