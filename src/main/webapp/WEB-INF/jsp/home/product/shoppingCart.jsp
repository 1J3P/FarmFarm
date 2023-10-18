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
    <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
    <style>
        .fa-trash-can {
            cursor: pointer;
        }
    </style>
    <script>
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

        function confirmAndDeleteCart(pid) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                // AJAX를 사용하여 삭제 요청을 보냅니다.
                $.ajax({
                    url: "/product/cart/delete/" + pid,
                    type: "DELETE",
                    success: function (response) {
                        alert("상품이 장바구니에서 삭제되었습니다.");
                        window.location.href = "<%=serverUrl%>/product/cart";
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
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="/" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">장바구니</div>
            <div class="right">
                <c:if test="${not empty itemList}">
                    <a href="/order/cart">주문</a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="page-content pt-60 bottom-sp60">
        <div class="container cart-list-area">
            <!-- 장바구니 비었을때 -->
            <c:if test="${empty itemList}">
                <div class="list simple-list search-not-found" style="height: 300px">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <p>장바구니가 비었습니다.
                </div>
            </c:if>
            <!-- 장바구니에 물건 있을때 -->
            <c:if test="${not empty itemList}">
                <div class="list cart-list">
                    <ul>
                        <c:forEach var="item" items="${itemList}">
                            <li class="swipeout cart-item">
                                <div class="item-content swipeout-content">
                                    <div class="item-inner">
                                            <%--                                        <div class="item-media">--%>
                                            <%--                                            <img src="../images/categories/pic1.jpg" alt="">--%>
                                            <%--                                        </div>--%>
                                        <div class="item-info">
                                            <div class="item-head">
                                                <h6 class="category" style="float: left;">${item.product.farm.name}</h6>
                                                <i class="fa-regular fa-trash-can" style="float: right;" onclick="confirmAndDeleteCart(${item.product.PId})"></i>
                                                <div style="clear:both; font-weight: bold"></div>
                                                <h2 class="item-title"><a
                                                        href="/product/${item.p_id}">${item.product.name}</a></h2>
                                                <h5 class="item-title"><span>${item.product.price}</span>원</h5>
                                            </div>
                                            <div class="item-foot">
                                                <h3 class="text-primary item-total">
                                                    <span>${item.product.price * item.quantity}</span>원</h3>
                                                <div class="stepper stepper-small stepper-round stepper-init"
                                                     style="border-radius: 20px">
                                                    <div class="stepper-button-minus" onclick="decreaseValue()"></div>
                                                    <div class="stepper-input-wrap">
                                                        <input type="text" value="${item.quantity}" min="0" max="100"
                                                               step="1" id="quantityInput" readonly/>
                                                    </div>
                                                    <div class="stepper-button-plus" onclick="increaseValue()"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swipeout-actions-right">
                                    <a href="#" class="swipeout-delete"><i class="las la-trash-alt"></i></a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>