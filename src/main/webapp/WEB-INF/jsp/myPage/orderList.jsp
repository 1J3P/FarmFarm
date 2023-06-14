<%--
  Created by IntelliJ IDEA.
  User: Hyunsu
  Date: 2023-06-08
  Time: 오전 3:50
  To change this template use File | Settings | File Templates.
--%>
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
        .stepper-input-wrap{
            border:none;
        }
        .cart-item{
            background: none;
        }
        .order-date{
            width:100%;
            text-align:center;
            border-bottom: 1px solid #F4F4F4;
        }
        .order-date p{
            font-weight: bold;
            margin:5px;
        }
        .list .item-content{
            display: flex;
            flex-direction: column;
        }

    </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
    <div class="navbar navbar-style-1">
        <div class="navbar-inner">
            <div class="left">
                <a href="#" class="link back">
                    <i class="flaticon-left"></i>
                </a>
            </div>
            <div class="title">주문 내역</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content pt-60 bottom-sp60">
        <div class="container cart-list-area">
            <div class="list cart-list">
                <ul>
                    <div class="order-date">
                        <p>2023.6.14</p>
                    </div>
                    <li class="swipeout cart-item" style="border-bottom: 1px solid; border-bottom-style: inset;">
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <div class="order-date">
                        <p>2023.6.4</p>
                    </div>
                    <li class="swipeout cart-item" style="border-bottom: 1px solid; border-bottom-style: inset;">
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <div class="order-date">
                        <p>2023.5.29</p>
                    </div>
                    <li class="swipeout cart-item" style="border-bottom: 1px solid; border-bottom-style: inset;">
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swipeout-actions-right">
                            <a href="#" class="swipeout-delete"><i class="las la-trash-alt"></i></a>
                        </div>
                    </li>
                    <div class="order-date">
                        <p>2023.5.23</p>
                    </div>
                    <li class="swipeout cart-item" style="border-bottom: 1px solid; border-bottom-style: inset;">
                        <div class="item-content swipeout-content">
                            <div class="item-inner">
                                <div class="item-info">
                                    <div class="item-head">
                                        <h6 class="category">팜팜농장</h6>
                                        <h2 class="item-title"><a href="/item-details/">바나나</a></h2>
                                        <h5 class="item-title"><span>7,500</span>원</h5>
                                    </div>
                                    <div class="item-foot">
                                        <h3 class="text-primary item-total"><span>22,500</span>원</h3>
                                        <div class="stepperForOrderList stepper-small stepper-round stepper-init">
                                            <div class="stepper-input-wrap stepperFont">
                                                X <span>3</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swipeout-actions-right">
                            <a href="#" class="swipeout-delete"><i class="las la-trash-alt"></i></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>