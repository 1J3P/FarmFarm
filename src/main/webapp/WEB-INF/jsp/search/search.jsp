<%--
  Created by IntelliJ IDEA.
  User: Hyunsu
  Date: 2023-05-23
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('serverUrl')" var="jspPath" />
<%
    String serverUrl = "@environment.getProperty('serverUrl')";
%>
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
    <style>
        .hidden {
            display: none;
        }
    </style>
    <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var searchInput = document.getElementById('searchInput');
            var searchIcon = document.getElementById('searchIcon');

            searchIcon.addEventListener('click', function () {
                var keyword = searchInput.value;
                var url = '<%=serverUrl%>/product/list?keyword=' + encodeURIComponent(keyword);

                // 페이지 이동
                if (keyword === "") {
                    alert('검색어를 입력해주세요.');
                } else {
                    window.location.href = url;
                }
            });
        });

    </script>
</head>
<body>


<div class="page light">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">상품 검색</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content pt-60 pb-0">
        <div class="fixed-content">
            <div class="bg-white sticky-top deals-search">
                <div class="container">
                    <form data-search-container=".search-list" data-search-in=".item-title"
                          class="searchbar searchbar-init search-box list-search-bx">
                        <div class="searchbar-inner">
                            <div class="searchbar-input-wrap">
                                <input id="searchInput" type="search" placeholder="검색어를 입력해주세요."/>
                                <i id="searchIcon" class="fa-solid fa-magnifying-glass"></i>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 결과 == 0 일때 -->
            <c:if test="${productList.size() == 0}">
                <div class="list simple-list search-not-found" style="height: 400px">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <p>검색된 상품이 없습니다.<br>다른 검색어를 입력해주세요.</p>
                </div>
            </c:if>
            <!-- 결과 != 0 일때 -->
            <div class="container">
                <c:if test="${productList.size() > 0}">
                    <div class="search_result">
                        <p>검색결과 : 총 <span>${productList.size()}</span>개의 상품이 있습니다.</p>
                    </div>
                </c:if>
                <div class="list search-list searchbar-found mt-0 mb-0" style="padding-bottom: 70px;">
                    <div class="row">
                        <c:forEach var="product" items="${productList}">
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
                                        <h4 class="price">${product.price}</h4>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</div>
</body>
</html>
