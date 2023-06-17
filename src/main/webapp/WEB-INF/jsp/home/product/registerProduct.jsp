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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function(){
            $("input[name='type']").change(function(){
                if($("input[name='type']:checked").val() == '2'){
                    $('.auction-date').show();
                }
                else if($("input[name='type']:checked").val() == '0'){
                    $('.auction-date').hide();
                }
                else if($("input[name='type']:checked").val() == '1'){
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
        .my-image img{
            margin-top: 30px;
            width:300px;
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
            <form id="form">
                <div class="product_type">
                    <h3 style="margin-bottom:-5px">상품 유형</h3>
                    <p style="font-size:12px;color:#999999">상품 유형을 선택해주세요.</p>
                    <div>
                        <input type="radio" name="type" value="0"><span>일반 상품</span>
                        <input type="radio" name="type" value="1"><span>공동 구매</span>
                        <input type="radio" name="type" value="2"><span>경매 상품</span>
                    </div>
                    <div style="margin-top:30px" class="auction-date">
                        <h3>경매 종료 날짜와 시간을 선택해주세요</h3>
                        <input type="datetime-local" step="3600" name="date">
                    </div>
                </div>
                <div class="product_name">
                    <h3>상품 이름</h3>
                    <input type="text" placeholder="상품 이름을 입력해주세요." name="name">
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
                    <input type="text" placeholder="상품 수량을 입력해주세요." name="quantity">
                </div>
                <div class="product_details">
                    <h3 style="margin-bottom:-5px">상품 설명</h3>
                    <p style="font-size:12px;color:#999999">상품과 관련된 내용들을 자유롭게 작성해주세요. </p>
                    <textarea name="detail" rows="10" cols="100%" placeholder="상품에 대한 자세한 설명을 작성해주세요."></textarea>
                </div>
                <div class="product_price">
                    <h3 style="margin-bottom:-5px">상품 가격</h3>
                    <p style="font-size:12px;color:#999999">판매하시는 상품의 가격을 입력해주세요.</p>
                    <input type="text" placeholder="상품 가격을 입력해주세요." name="price">
                </div>
                <div class="product_trade">
                    <h3 style="margin-bottom:-5px">거래 방법</h3>
                    <p style="font-size:12px;color:#999999">상품을 거래할 방법을 선택해주세요.</p>
                    <div>
                        <input type="radio" name="direct" value="true"><span>직거래</span>
                        <input type="radio" name="direct" value="false"><span>배송</span>
                    </div>
                </div>
                <div class="product_pic">
                    <h3>사진을 올려주세요 <span>(선택)</span></h3>
                    <div>
                        <label class="file-label" for="chooseFile">파일 선택</label>
                        <input class="file" id="chooseFile" type="file">
                        <div class="my-image"></div>
                        <input type="hidden" name="image1" class="img1">
                        <input type="hidden" name="image2" class="img2">
                        <input type="hidden" name="image3" class="img3">
                    </div>
                    <p style="font-size:12px;color:#999999">상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다.<br>
                        사진 첨부 시 개인정보가 노출되지 않도록 유의해주세요.</p>
                </div>
                <div class="list">
                    <ul>
                        <li class="mb-15"><button type="button" class="button-large button button-fill" id="openBtn">상품 등록</button></li>
                    </ul>
                </div>
            </form>
        </div>

    </div>
    <%@ include file="/WEB-INF/jsp/common/tabbar.jsp" %>
</div>
<script>
    window.onload = function (){
        const fileInput = document.getElementById("chooseFile");
        const myImg = document.querySelector(".my-image");
        const img1 = document.querySelector(".img1");
        const img2 = document.querySelector(".img2");
        const img3 = document.querySelector(".img3");

        fileInput.addEventListener("change", (evt)=> {
            const image = evt.target.files[0];
            console.log(image);

            var url = "/s3/file";
            var formData = new FormData();
            formData.append("multipartFile", image);

            $.ajax({
                url:url,
                data:formData,
                type:"POST",
                async:false,
                enctype:"multipart/form-data",
                processData:false,
                contentType:false,

                success: function (response){
                    console.log(JSON.stringify(response));
                    var json = JSON.stringify(response);
                    var obj = JSON.parse(json);
                    var str = '<img src="' + obj.fileurl + '"></img>';
                    myImg.innerHTML += str;
                    img1.setAttribute("value", obj.fileurl);
                    img2.setAttribute("value", obj.fileurl);
                    img3.setAttribute("value", obj.fileurl);
                    fileInput.setAttribute("name", obj.fileurl);
                },

                error: function (request, status, error) {
                    console.log("request : " + request);
                    console.log("status : " + status);
                    console.log("error : " + error);
                },

                complete:function(data,textStatus) {
                    console.log("");
                    console.log("[serverUploadImage] : [complete] : " + textStatus);
                    console.log("");
                }
            })
        });

        function objectifyForm(formArray){
            var returnArray = {};
            for (var i = 0; i < formArray.length; i++) {
                returnArray[formArray[i]['name']] = formArray[i]['value'];
            }
            return returnArray;
        }
        $("#openBtn").on("click", function (){
            var formsubmitSerialArray = $("#form").serializeArray();
            var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));

            console.log(formsubmitSerialArray);
            console.log(formsubmit);
            $.ajax({
                type:"POST",
                async:true,
                url:"http://localhost:9000/product",
                data:formsubmit,
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:function (data){
                    alert("success");
                    console.log(data);
                    console.log("2" + data.pid);
                    location.href="/product/" + data.pid;
                },
                error:function (request, status, error){
                    alert("error");
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