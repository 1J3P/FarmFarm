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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>상품 검색</title>
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

  <title>검색</title>

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
</head>
<body>
<div class="page light">
  <div class="navbar navbar-style-1 navbar-transparent">
    <div class="navbar-inner">
      <div class="left">
        <a href="/home" class="link back">
          <i class="icon flaticon-left"></i>
        </a>
      </div>
      <div class="title"> </div>
      <div class="right">
        <a href="/categories/">
          <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M3.5 7.875H7C7 8.84013 7.78487 9.625 8.75 9.625H10.5C11.4651 9.625 12.25 8.84013 12.25 7.875H24.5C24.983 7.875 25.375 7.48388 25.375 7C25.375 6.51612 24.983 6.125 24.5 6.125H12.25C12.25 5.15987 11.4651 4.375 10.5 4.375H8.75C7.78487 4.375 7 5.15987 7 6.125H3.5C3.017 6.125 2.625 6.51612 2.625 7C2.625 7.48388 3.017 7.875 3.5 7.875Z" fill="white"/>
            <path d="M24.5 13.125H19.25C19.25 12.1599 18.4651 11.375 17.5 11.375H15.75C14.7849 11.375 14 12.1599 14 13.125H3.5C3.017 13.125 2.625 13.5161 2.625 14C2.625 14.4839 3.017 14.875 3.5 14.875H14C14 15.8401 14.7849 16.625 15.75 16.625H17.5C18.4651 16.625 19.25 15.8401 19.25 14.875H24.5C24.983 14.875 25.375 14.4839 25.375 14C25.375 13.5161 24.983 13.125 24.5 13.125Z" fill="white"/>
            <path d="M24.5 20.125H12.25C12.25 19.1599 11.4651 18.375 10.5 18.375H8.75C7.78487 18.375 7 19.1599 7 20.125H3.5C3.017 20.125 2.625 20.5161 2.625 21C2.625 21.4839 3.017 21.875 3.5 21.875H7C7 22.8401 7.78487 23.625 8.75 23.625H10.5C11.4651 23.625 12.25 22.8401 12.25 21.875H24.5C24.983 21.875 25.375 21.4839 25.375 21C25.375 20.5161 24.983 20.125 24.5 20.125Z" fill="white"/>
          </svg>
        </a>
      </div>
    </div>
  </div>
  <div class="page-content pt-60 pb-0 bg-primary"><div class="searchbar-backdrop"></div>
    <div class="dz-banner-heading">
      <div class="container">
        <h2 class="head-title text-white">검색</h2>
        <div class="category-icon">
          <img src="img/svg/grapes.svg" alt="">
        </div>
      </div>
    </div>
    <div class="fixed-content deals-content">
      <div class="bg-white sticky-top deals-search">
        <div class="container">
          <form data-search-container=".search-list" data-search-in=".item-title" class="searchbar searchbar-init search-box list-search-bx">
            <div class="searchbar-inner">
              <div class="searchbar-input-wrap">
                <input type="search"  placeholder="Search here"/>
                <i class="fa-solid fa-magnifying-glass"></i>
              </div>
            </div>
          </form>
        </div>
        <div class="search_result container fixed-content">
          <p>검색결과 : 총 <span>4</span>개의 상품이 있습니다.</p>
        </div>
        <!-- 결과 == 0 일때 -->
        <div class="list simple-list search-not-found" style="height: 300px">
          <i class="fa-solid fa-magnifying-glass"></i>
          <p>검색된 상품이 없습니다.<br>다른 검색어를 입력해주세요.</p>
        </div>
      </div>
      <!-- 결과 != 0 일때 -->
      <!--
      <div class="container pt-10">
        <div class="list search-list searchbar-found mt-0 mb-0" style="padding-bottom: 70px;">
          <div class="row">
            <div class="col-50 medium-25">
              <div class="item-box">
                <div class="item-media">
                  <img src="../images/categories/pic1.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" checked />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
                  <img src="../images/categories/pic2.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>가지가지 농장</h5>
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
                  <img src="../images/categories/pic3.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
                  <img src="../images/categories/pic4.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
                  <img src="../images/categories/pic1.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" checked />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
                  <img src="../images/categories/pic2.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>가지가지 농장</h5>
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
                  <img src="../images/categories/pic3.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
                  <img src="../images/categories/pic4.jpg" alt="" />
                </div>
                <label class="bookmark-btn">
                  <input type="checkbox" />
                </label>
                <div class="item-content">
                  <h5>팜팜 농장</h5>
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
      -->
    </div>
  </div>
  <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>
