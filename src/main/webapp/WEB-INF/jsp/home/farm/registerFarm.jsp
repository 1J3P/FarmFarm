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
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
    .farm_name,
    .farm_location {
      margin-bottom: 30px;
    }

    .auction-container > * {
      display: inline-block;
      vertical-align: middle;
    }

    .farm_location input {
      display: block;
      margin-bottom: 5px;
    }

    .farm_location .input-wrapper {
      display: inline-block;
      margin-right: 10px;
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
  <script>
    $(document).ready(function(){
      $("input[name='is_auction']").change(function(){
        if($("input[name='is_auction']:checked").val() == 'true'){
          $('.auction_time_1').show();
        }
        else if($("input[name='is_auction']:checked").val() == 'false'){
          $('.auction_time_1').hide();
        }
      });
    });
    function goPopup(){
      // 주소검색을 수행할 팝업 페이지를 호출합니다.
      // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
      var pop = window.open("/popup","pop","scrollbars=yes, resizable=yes");

      // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
      //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
    }
    function jusoCallBack(roadAddrPart1, addrDetail, siNm, sggNm){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      console.log(roadAddrPart1);
      document.querySelector("#location_full").value = roadAddrPart1;
      document.querySelector("#location_detail").value = addrDetail;
      document.querySelector("#location_city").value = siNm;
      document.querySelector("#location_gu").value = sggNm;
      console.log("전체 주소 ! " + roadAddrPart1);
      console.log("상세 주소 ! " + addrDetail);
      console.log("시/도 ! " + siNm);
      console.log("시/군/구 ! " + sggNm);
    }

  </script>

  </script>
</head>
<body>

<div class="page page-homepage light" data-name="homepage">
  <div class="navbar navbar-style-1">
    <div class="navbar-inner">
      <div class="left">
        <a href="/myPage" class="link back">
          <i class="flaticon-left"></i>
        </a>
      </div>
      <div class="title">농장 개설</div>
      <div class="right"></div>
    </div>
  </div>
  <div class="page-content content-area pt-30 bottom-sp80">
    <div class="container allProduct product" style="padding-top:10px">
      <form id="form">
        <div class="farm_name">
          <h3 style="margin-bottom:5px">농장 이름</h3>
          <input type="text" name="name" placeholder="농장 이름을 입력해주세요.">
        </div>
        <div class="farm_location">
          <h3 style="margin-bottom: 5px;">농장 위치</h3>
          <p></p>
          <div>
            <p></p>
            <div class="input-wrapper" >
              <input type="text" name="locationCity" id="location_city" placeholder="OO시/도" value="${siNm}" readonly>
            </div>
            <div class="input-wrapper">
              <input type="text" name="locationGu" id="location_gu" placeholder="OO시/군/구" value="${sggNm}" readonly>
            </div>
            <p></p>
            <div class="input-wrapper">
              <input type="text" name="locationFull" id="location_full" placeholder="전체 주소" value="${roadAddrPart1}" readonly>
            </div>
            <div class="input-wrapper">
              <input type="text" name="locationDetail" id="location_detail" placeholder="상세 주소" value="${addrDetail}" readonly>
            </div>
            <label class="file-label" for="chooseFile" onclick="goPopup();" style="padding: 15px 36px;">주소 찾기</label>
          </div>
        </div>


        <div class="product_details">
          <h3 style="margin-bottom:-5px"> 농장 설명</h3>
          <p style="font-size:12px;color:#999999">농장과 관련된 내용들을 자유롭게 작성해주세요. </p>
          <textarea name="detail" rows="10" cols="100%" placeholder="농장에 대한 자세한 설명을 작성해주세요."></textarea>
        </div>
        <div class="product_trade">
          <h3 style="margin-bottom:-5px">경매를 진행하실건가요?</h3>
          <p style="font-size:12px;color:#999999">
            경매는 상품을 등록한 시점부터 상품 등록시 설정한 경매 종료 시각까지 진행되며 <br>
            가격이 높은 경매건이 낙찰됩니다.
          </p>
          <div class="auction-container">
            <input type="radio" name="auction" value="true"><span>네</span>
            <input type="radio" name="auction" value="false"><span>아니오</span>
          </div>
        </div>
        <div class="product_pic">
          <h3>사진을 올려주세요</h3>
          <div>
            <label class="file-label" for="chooseFile">파일 선택</label>
            <input class="file" id="chooseFile" type="file">
            <div class="my-image"></div>
            <input type="hidden" name="image" class="input-img">
          </div>
          <p style="font-size:12px;color:#999999">상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다.<br>
            사진 첨부 시 개인정보가 노출되지 않도록 유의해주세요.</p>
        </div>
        <div class="list">
          <ul>
            <li class="mb-15"><button type="button" class="button-large button button-fill" id="openBtn">농장 개설</button></li>
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
    const inputImg = document.querySelector(".input-img");

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
          inputImg.setAttribute("value", obj.fileurl);
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

      var hasEmptyFields = false;
      for (var i = 0; i < formsubmitSerialArray.length; i++) {
        if (formsubmitSerialArray[i].value.trim() === "") {
          hasEmptyFields = true;
          break;
        }
      }

      if (hasEmptyFields) {
        alert("내용을 모두 입력해주세요.");
        return;
      }

      console.log(formsubmitSerialArray);
      console.log(formsubmit);
      $.ajax({
        type:"POST",
        async:true,
        url:"http://localhost:9000/farm",
        data:formsubmit,
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        success:function (data){
          alert("농장을 개설하였습니다.");
          var sessionValue = '<%= session.getAttribute("user") %>';
          console.log(sessionValue);
          sessionStorage.setItem('user', sessionValue);
          console.log(data);
          window.location.replace("/myPage");
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
