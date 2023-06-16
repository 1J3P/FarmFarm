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

    <link rel="stylesheet" href="../../style/framework7-bundle.min.css"/>
    <link rel="stylesheet" href="../../style/app.css"/>

    <link
            rel="stylesheet"
            href="../../style/font-awesome/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="../../style/line-awesome/css/line-awesome.min.css"
    />
    <link rel="stylesheet" href="../../style/flaticons/flaticon.css"/>

    <link rel="stylesheet" href="../../style/style.css"/>

    <link rel="apple-touch-icon" href="../../images/f7-icon-square.png"/>
    <link rel="icon" href="../images/f7-icon.png"/>

    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function(){
            $("input[name='delivery']").change(function(){
                if($("input[name='delivery']:checked").val() == 'true'){
                    $('.check-delivery').show();
                }
                else if($("input[name='delivery']:checked").val() == 'false'){
                    $('.check-delivery').hide();
                }
            });
        });
    </script>
    <style>
        .item-input-wrap [type="radio"]{
            vertical-align: middle;
            appearance: none;
            background:#d9d9d9;
            border-radius: 50%;
            width: 2em;
            height: 2em;
            margin-right:10px;
        }
        .item-input-wrap [type="radio"]:checked{
            background: #94C015;
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
                                            <input type="text" name="delivery_name" placeholder="이름을 입력하세요" id="username" class="form-control"/>
                                        </div>

                                        <h4>전화번호</h4>
                                        <div class="item-input-wrap">
                                            <input type="text" name="delivery_phone" placeholder="전화번호를 입력하세요" id="phone" class="form-control"/>
                                        </div>
                                        <h4>거래 방식</h4>
                                        <div class="item-input-wrap">
                                            <label><input type="radio" id="true" name="delivery" value="true" checked/>배송</label>
                                            <label><input type="radio" id="false" name="delivery" value="false"/>직거래</label>
                                        </div>
                                        <div class="check-delivery">
                                            <h4>배송 요청사항</h4>
                                            <div class="item-input-wrap">
                                                <input type="email" name="delivery_memo" placeholder="배송 요청 사항을 입력하세요" id="email" class="form-control"/>
                                            </div>
                                            <h4>주소</h4>
                                            <div class="item-input-wrap">
                                                <input type="text" name="delivery_address" placeholder="주소를 입력하세요" id="address" class="form-control"/>
                                            </div>
                                            <h4>상세 주소</h4>
                                            <div class="item-input-wrap">
                                                <input type="text" name="delivery_address_detail" placeholder="상세 주소를 입력하세요" id="zip_code" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="list" style="margin-top: 50px">
                            <ul>
                                <li class="mb-15"><a class="button-large button button-fill" id="createOrder">결제하기</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function (){
        function objectifyForm(formArray){
            var returnArray = {};
            for (var i = 0; i < formArray.length; i++) {
                returnArray[formArray[i]['name']] = formArray[i]['value'];
            }
            return returnArray;
        }
        $("#createOrder").on("click", function (){
            var formsubmitSerialArray = $("#tabA1").serializeArray();
            var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));

            console.log(formsubmitSerialArray);
            console.log(formsubmit);
            jQuery.ajax({
                type:"POST",
                async:true,
                url:"http://localhost:9000/order",
                data:formsubmit,
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:function (data){
                    alert("success");
                    console.log(data);
                    console.log(data.oid);
                    jQuery.ajax({
                        type:"POST",
                        async:true,
                        url:"http://localhost:9000/pay/order/"+data.oid,
                        dataType:"json",
                        contentType:"application/json; charset=utf-8",
                        success:function (data){
                            alert("success");
                            console.log(data);
                            console.log(data.oid);
                            console.log(data.next_redirect_pc_url);
                            location.href=data.next_redirect_pc_url;
                        },
                        error:function (request, status, error){
                            console.log(request);
                            console.log(status);
                            console.log(error);
                        }
                    });
                },
                error:function (request, status, error){
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            });
        });
    };

</script>
</body>
</html>
