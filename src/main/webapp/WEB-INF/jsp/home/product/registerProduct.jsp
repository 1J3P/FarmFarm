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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function(){
            $("input[name='pro_type']").change(function(){
                if($("input[name='pro_type']:checked").val() == '경매 상품'){
                    $('.auction-date').show();
                }
                else if($("input[name='pro_type']:checked").val() == '일반 상품'){
                    $('.auction-date').hide();
                }
                else if($("input[name='pro_type']:checked").val() == '공동 구매'){
                    $('.auction-date').hide();
                }
            });
        });
    </script>
    <style>
        .auction-date{
            display:none;
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
        .file {
            display: none;
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
            <div class="title">상품 등록</div>
            <div class="right"></div>
        </div>
    </div>
    <div class="page-content content-area pt-30 bottom-sp80">
        <div class="container allProduct product" style="padding-top:10px">
            <div class="product_type">
                <h3 style="margin-bottom:-5px">상품 유형</h3>
                <p style="font-size:12px;color:#999999">상품 유형을 선택해주세요.</p>
                <div>
                    <input type="radio" name="pro_type" value="일반 상품"><span>일반 상품</span>
                    <input type="radio" name="pro_type" value="공동 구매"><span>공동 구매</span>
                    <input type="radio" name="pro_type" value="경매 상품"><span>경매 상품</span>
                </div>
                <div style="margin-top:30px" class="auction-date">
                    <h3>경매 날짜를 선택해주세요</h3>
                    <input type="date">
                </div>
            </div>
            <div class="product_name">
                <h3>상품 이름</h3>
                <input type="text" placeholder="상품 이름을 입력해주세요.">
            </div>
            <div class="product_category">
                <h3>상품 카테고리</h3>
                <select>
                    <option value="" disabled selected style="display:none">카테고리를 선택해주세요.</option>
                    <option value="fruit">과일</option>
                    <option value="vegetable">채소</option>
                </select>
            </div>
            <div class="product_quantity">
                <h3>상품 수량</h3>
                <input type="text" placeholder="상품 수량을 입력해주세요.">
            </div>
            <div class="product_details">
                <h3 style="margin-bottom:-5px">상품 설명</h3>
                <p style="font-size:12px;color:#999999">상품과 관련된 내용들을 자유롭게 작성해주세요. </p>
                <textarea rows="10" cols="100%" placeholder="상품에 대한 자세한 설명을 작성해주세요."></textarea>
            </div>
            <div class="product_price">
                <h3 style="margin-bottom:-5px">상품 가격</h3>
                <p style="font-size:12px;color:#999999">판매하시는 상품의 가격을 입력해주세요.</p>
                <input type="text" placeholder="상품 가격을 입력해주세요.">
            </div>
            <div class="product_trade">
                <h3 style="margin-bottom:-5px">거래 방법</h3>
                <p style="font-size:12px;color:#999999">상품을 거래할 방법을 선택해주세요.</p>
                <div>
                    <input type="radio" name="pro_type" value="직거래"><span>직거래</span>
                    <input type="radio" name="pro_type" value="배송"><span>배송</span>
                </div>
            </div>
            <div class="product_pic">
                <h3>사진을 올려주세요 <span>(선택)</span></h3>
                <div>
                    <label class="file-label" for="chooseFile">파일 선택</label>
                    <input class="file" id="chooseFile" type="file">
                </div>
                <p style="font-size:12px;color:#999999">상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다.<br>
                    사진 첨부 시 개인정보가 노출되지 않도록 유의해주세요.</p>
            </div>
            <div class="list">
                <ul>
                    <li class="mb-15"><a href="/home/" class="button-large button button-fill">상품 등록</a></li>
                </ul>
            </div>
        </div>

    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
</body>
</html>