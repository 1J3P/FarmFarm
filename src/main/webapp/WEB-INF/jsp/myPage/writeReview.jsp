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
  <script src="https://kit.fontawesome.com/343192f99f.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      var farmRating = 0; // 농장 별점을 저장할 변수
      var productRating = 0; // 상품 별점을 저장할 변수

      // 농장 별점 클릭 이벤트 처리
      $('.rating-box:first .rating-list li').click(function() {
        var index = $(this).index() + 1;

        // 클릭한 li 요소를 기준으로 이전 요소들의 클래스를 "fa-star"로 변경합니다
        $(this).prevAll().find('i').removeClass('fa-star-o').addClass('fa-star');

        // 클릭한 li 요소의 클래스를 "fa-star"로 변경합니다
        $(this).find('i').removeClass('fa-star-o').addClass('fa-star');

        // 클릭한 li 요소를 기준으로 다음 요소들의 클래스를 "fa-star-o"로 변경합니다
        $(this).nextAll().find('i').removeClass('fa-star').addClass('fa-star-o');

        // 선택한 별의 숫자를 농장 별점 변수에 저장합니다
        farmRating = index;

        // 농장 별점 값을 출력합니다
        console.log('농장 별점:', farmRating);
      });

      // 상품 별점 클릭 이벤트 처리
      $('.rating-box:last .rating-list li').click(function() {
        var index = $(this).index() + 1;

        // 클릭한 li 요소를 기준으로 이전 요소들의 클래스를 "fa-star"로 변경합니다
        $(this).prevAll().find('i').removeClass('fa-star-o').addClass('fa-star');

        // 클릭한 li 요소의 클래스를 "fa-star"로 변경합니다
        $(this).find('i').removeClass('fa-star-o').addClass('fa-star');

        // 클릭한 li 요소를 기준으로 다음 요소들의 클래스를 "fa-star-o"로 변경합니다
        $(this).nextAll().find('i').removeClass('fa-star').addClass('fa-star-o');

        // 선택한 별의 숫자를 상품 별점 변수에 저장합니다
        productRating = index;

        // 상품 별점 값을 출력합니다
        console.log('상품 별점:', productRating);
      });
    });
  </script>
  </script>
</head>
<body>
<div class="page light">
  <div class="navbar navbar-style-1">
    <div class="navbar-inner">
      <div class="left">
        <a href="#" class="link back">
          <i class="icon flaticon-left"></i>
        </a>
      </div>
      <div class="title"><b>리뷰 작성</b></div>
      <div class="right">
      </div>
    </div>
  </div>
  <div class="page-content pt-80 bottom-sp90">
    <div class="container">
      <div class="write-reviews-box">
        <div class="reviews-head">
          <h3 class="title"><b>농장의 별점을 입력해주세요. </b></h3>
        </div>
        <div class="rating-box">
          <ul class="rating-list">
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star-o"></i></li>
            <li><i class="fa fa-star-o"></i></li>
          </ul>
        </div>
        <div class="reviews-head">
          <h3 class="title"><b>상품의 리뷰를 작성해주세요</b></h3>
          <p>받아보신 상품은 어떠셨나요?<br>
            다른 고객님들을 위해 솔직한 의견 남겨주세요:)</p>
        </div>
        <div class="rating-box">
          <ul class="rating-list">
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star-o"></i></li>
            <li><i class="fa fa-star-o"></i></li>
          </ul>
        </div>
        <form class="form-elements">
          <div class="list">
            <ul class="row">
              <li class="item-content item-input col-100 item-input-with-value">
                <div class="item-inner">
                  <label class="form-label"><b>상품에 대한 의견을 남겨주세요</b></label>
                  <div class="item-input-wrap">
                    <textarea placeholder="이곳에 의견을 남겨주세요" class="form-control"/></textarea>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </form>
      </div>
    </div>
    <div class="container px-15">
      <a href="/home/" class="button-large button button-fill">리뷰 등록하기</a>
    </div>
  </div>
  <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>
