<%@ page import="com.example.farmfarm.Entity.RegionDataEntity" %>
<%@ page import="java.util.List" %>
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
    <link rel="icon" href="https://farmfarmbucket.s3.ap-northeast-2.amazonaws.com/10591631-d5da-4804-b013-ff6eccbed6f7.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .dropdown-menu {
            display: none;
        }

        .dropdown-menu a {
            display: block;
            margin-left: 40px;
            color: black;
            position: relative;
            top: 30%;
        }

        .btn {
            justify-content: normal;
            border: none;
        }

        .text {
            margin-left: 20px;
        }

        .cate-item {
            background-color: #EAEAEA;
            height: 50px;
            position: relative;
        }

        .cate-item:hover {
            background-color: #9DBF3F;
        }

        .selectedGugunList {
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #eaeaea;
            display: none;
            padding: 10px;
            width: 100%;
            z-index: 1;
        }
        .selectedGugunList .cate-item{
            background: #fff;
        }

        /*.selectedSido:hover .selectedGugunList {*/
        /*    display: block;*/
        /*}*/

        /*.selectedGugunList .cate-item {*/
        /*    background-color: transparent; !* 구군 아이템의 배경을 투명으로 설정 *!*/
        /*}*/

        .selectedGugunList .cate-item:hover {
            background-color: #94C015; /* 구군 아이템의 hover 배경도 투명으로 설정 */
        }


        .select_region{
            margin-top:80px;
            text-align: center;
        }
        .select_region form{
            display: flex;
            justify-content: center;
        }
        .select_region select{
            background: #efefef;
            margin-right:10px;
            padding:10px;
            border-radius: 10px;
            appearance: auto;
            -webkit-appearance: auto;
            text-align: center;
        }
        .select_region option{
            text-align: center;
        }
        .selectedGugunList {
            padding-bottom: 60px; /* 아래쪽으로 추가적인 여백을 확보해 탭바와 겹치지 않도록 합니다. */
        }
    </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">지역 카테고리</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="col-50 medium-25" style="margin-top: 60px;">
            <div class="dropdown" style="margin-bottom: 30px;">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false" >
                    <h3 class="text">시 선택</h3>
                </button>
                <div class="dropdown-menu">
                    <c:forEach items="${sidoList}" var="sido">
                        <div class="cate-item selectedSido">
                            <a class="dropdown-item">
                                    ${sido}
                            </a>
                            <div class="selectedGugunList"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
<script>
    window.onload = function() {
        const selectedSido = document.querySelectorAll(".cate-item");
        const button = document.querySelector(".dropdown-toggle");
        const dropdownMenu = document.querySelector(".dropdown-menu");

        let selectedSidoValue = null; // 선택된 시 값을 저장할 변수
        let selectedGugunValue = null; // 선택된 구군 값을 저장할 변수

        button.addEventListener("click", function(e) {
            if (dropdownMenu.style.display === "block") {
                dropdownMenu.style.display = "none";
            } else {
                dropdownMenu.style.display = "block";
            }
        });

        selectedSido.forEach(function(element) {
            element.addEventListener("click", function(e) {
                const selectedValue = element.querySelector("a").innerText;
                const selectedGugunList = element.querySelector(".selectedGugunList");
                if (selectedValue === "대구광역시" || selectedValue === "인천광역시" || selectedValue === "광주광역시" || selectedValue === "대전광역시" || selectedValue === "울산광역시" || selectedValue === "세종특별자치시" || selectedValue === "제주특별자치도") {
                    selectedGugunList.style.paddingBottom = "0";
                }
                if (selectedValue === selectedSidoValue) {
                    // 시를 다시 클릭하면 구군 목록 숨기기
                    selectedSidoValue = null;
                    selectedGugunValue = null;
                    selectedGugunList.style.display = "none";
                } else {
                    selectedSidoValue = selectedValue;
                    selectedGugunValue = null;

                    jQuery.ajax({
                        type: "POST",
                        url: "/category",
                        data: { selectedSido: selectedValue },
                        success: function(data) {
                            const gugunList = data;
                            selectedGugunList.innerHTML = '';
                            gugunList.forEach(function(gugun) {
                                const div = document.createElement("div");
                                const a = document.createElement("a");
                                a.textContent = gugun;
                                a.className = "dropdown-item";
                                div.className = "cate-item";
                                div.appendChild(a);
                                selectedGugunList.appendChild(div);
                            });
                            selectedGugunList.style.display = "block";

                            selectedGugunList.addEventListener("click", function(e) {
                                if (e.target.classList.contains("dropdown-item")) {
                                    const selectedGugun = e.target.textContent;
                                    // 선택된 구군 페이지로 이동
                                    window.location.href = "/farm/list?si=" + selectedSidoValue + "&gugun=" + selectedGugun;
                                }
                            });
                        },
                        error: function(xhr, status, error) {
                            console.log("Status: " + status);
                            console.log("Error: " + error);
                        }
                    });
                }
            });
        });
    };

</script>

</body>
</html>