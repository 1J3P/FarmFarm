<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>마이페이지</title>
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

  <title>마이페이지</title>

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
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }

    table td, table th{
      height: 60px;
      border-bottom: 1px solid #F3F3F3;
      align-content: center;
    }

    .myProfile, .myFarm{
      display: flex;
      font-size: 20px;
      font-weight: bold;
      height: 100px;
      align-items: center;
      justify-content: space-between;
    }

    .row {
      font-family: "Poppins", sans-serif, sans-serif;
      font-size: 16px;
      font-weight: bold;
    }

    .item-media {
      display: inline-block;
    }

    .item-media img {
      border-radius: 50%;
    }

    .username, .farmName {
      font-weight: bold;
      margin-left: 16px;
      margin-right: 20px;
      align-items: center;
      width: 280px;
    }

    .myPage-btn {
      width: auto;
      height: auto;
      padding: 7px;
      background-color: #FFC42B;
    }

    .myPage_container {
      display:flex;
      align-items: center;
    }

  </style>
</head>
<body>
<div class="page page-homepage light" data-name="homepage">
  <div class="navbar navbar-style-1">
    <div class="navbar-inner">
      <div class="left">
        <a href="/home/" class="link back">
          <i class="flaticon-left"></i>
        </a>
      </div>
      <div class="title"></div>
      <div class="right"></div>
    </div>
  </div>

  <div class="page-content content-area bottom-sp80">
    <div class="container allProduct">
      <div class="row">
        <table class="table">
          <tbody>
          <tr>
            <td class= "myProfile" style="vertical-align: middle;">
              <div class="myPage_container">
                <div class="item-media">
                  <img src="../images/avatar/2.jpg" width="50">
                </div>
                <div class="username">${user.nickname}</div>님
              </div>
              <div>
                <a href="javascript:void(0);" class="button btn-block button-fill add-cart-btn active together-order myPage-btn">
                  프로필 관리
                </a>
              </div>
            </td>
          </tr>
          <tr>
            <td class= "myFarm" style="vertical-align: middle;">
              <c:if test="${myFarm eq null}">
                <div class="myPage_container">
                  <div class="item-media">
                    <img src="../images/avatar/2.jpg" width="50">
                  </div>
                  <div class="farmName">농장이 아직 없어요</div>
                </div>
                <div>
                  <a href="/farm" class="button btn-block button-fill add-cart-btn active together-order myPage-btn">
                    농장 개설
                  </a>
                </div>
              </c:if>
              <c:if test="${myFarm ne null}">
                <div class="myPage_container">
                <div class="item-media">
                  <img src="../images/avatar/2.jpg" width="50">
                </div>

                <div class="farmName">${myFarm.name}</div>
                </div>
                <div>
                  <a href="javascript:void(0);" class="button btn-block button-fill add-cart-btn active together-order myPage-btn">
                    농장 관리
                  </a>
                </div>
              </c:if>
<!-- 농장 개설이 안되어있을 경우, 분기 처리해서 사용할 부분!!-->
<%--              <div class="myPage_container">--%>
<%--                <div class="item-media">--%>
<%--                  <img src="../style/images/avatar/2.jpg" width="50">--%>
<%--                </div>--%>
<%--                <div class="farmName">농장이 아직 없어요</div>--%>
<%--              </div>--%>
<%--              <div>--%>
<%--                <a href="javascript:void(0);" class="button btn-block button-fill add-cart-btn active together-order myPage-btn">--%>
<%--                  농장 개설--%>
<%--                </a>--%>
<%--              </div>--%>
            </td>
          </tr>
          <tr>
            <td class="row"><a href="/order">주문 내역</a></td>
          </tr>
          <tr>
            <td class="row">경매 참가 내역</td>
          </tr>
          <tr>
            <td class="row">상품 후기</td>
          </tr>
          <tr>
            <td class="row">문의</td>
          </tr>
          <tr>
            <td class="row">로그아웃</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>