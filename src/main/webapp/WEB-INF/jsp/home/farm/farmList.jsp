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

  <style>
    table {
      border-collapse: collapse;
      font-size: 18px;
      width: 400px;
    }

    table td, table th {
      height: 40px;
      border-bottom: 1px solid #F3F3F3;
      padding-bottom: 5px;
      padding-top: 5px;
    }

    th[scope="row"] {
      color: #94C015;
    }

    .searchbar-input-wrap {
      display: flex;
      align-items: center;
      padding-top: 15px;
    }

    .searchbar-input-wrap input {
      order: 1;
      width: 400px;
    }

    .searchbar-input-wrap i {
      order: 2;
      margin-right: 5px;
    }
  </style>
  <script>
    function handleSearchIconClick() {
      const selectElement = document.querySelector('.sort_type select');
      const selectedValue = selectElement.value;
      const inputValue = document.querySelector('.searchbar-input-wrap input').value;
      let url = 'http://localhost:9000/farm/list';

      if (selectedValue) {
        url += '?sort=' + encodeURIComponent(selectedValue);
      }

      if (inputValue) {
        url += (selectedValue ? '&' : '?') + 'keyword=' + encodeURIComponent(inputValue);
      }

      localStorage.setItem("selectedOption", selectedValue);
      window.location.href = url;
    }

    document.addEventListener("DOMContentLoaded", function() {
      const sortSelect = document.querySelector('.sort_type select');

      const selectedOption = localStorage.getItem("selectedOption");
      if (selectedOption) {
        sortSelect.value = selectedOption;
      }

      sortSelect.addEventListener('change', function() {
        handleSearchIconClick();
      });

      const searchIcon = document.querySelector('.searchbar-input-wrap i');
      searchIcon.addEventListener('click', handleSearchIconClick);
    });

  </script>

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
      <div class="title">지역 농장 보기</div>
      <div class="right">
      </div>
    </div>
  </div>
  <div class="page-content content-area pt-30 bottom-sp80">
    <div class="container allProduct">
      <div class="searchbar-input-wrap">
        <input id="searchInput" type="search" placeholder="검색어를 입력해주세요." />
        <i id="searchIcon" class="fa-solid fa-magnifying-glass" onclick="handleSearchIconClick()"></i>
      </div>
      <div class="allProduct_text">
        <div class="total">
          <h5>총 <span id="totalProductsCount">${farmList.size()}</span>개</h5>
        </div>
        <div class="sort">
          <div class="sort_type">
            <select id="sortSelect" onchange="handleSearchIconClick()">
              <option value="rating">인기순</option>
              <option value="new">신규순</option>
              <option value="old">오래된순</option>
            </select>
          </div>
        </div>
      </div>
      <div class="row">
        <table class="table">
          <tbody>
          <c:forEach var="farm" items="${farmList}" varStatus="status">
            <tr>
              <th scope="row">${status.count}</th>
              <td><a href="/farm/${farm.FId}" style="color: black;">${farm.name}</a></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>
