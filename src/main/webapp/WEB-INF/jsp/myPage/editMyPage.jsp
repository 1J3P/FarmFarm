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
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="page light">
  <div class="navbar navbar-style-1">
    <div class="navbar-inner">
      <div class="left">
        <a href="/myPage" class="link back">
          <i class="icon flaticon-left"></i>
        </a>
      </div>
      <div class="title"><b>마이페이지</b></div>
      <div class="right"></div>
    </div>
  </div>
  <div class="page-content pt-80 bottom-sp90" style="text-align: center;">
    <div class="container" style="text-align: center;">
      <div class="write-reviews-box" style="text-align: center;">
        <form id="formUser">
        <img src="${user.image}" class="user-media" id="userImage" alt="" style="border-radius: 50%; width: 150px; height:150px;"/>
        <div>
          <label class="file-label" for="chooseFile">파일 선택</label>
          <input class="file" id="chooseFile" type="file">
          <input type="hidden" name="image" class="input-img">
        </div>
        <div class="reviews-head">
          <p></p>
          <h3><span class="title"><b>${user.nickname}</b></span><b>님</b></h3>
        </div>
        <form class="form-elements" style="text-align: center;">
          <div class="list" style="text-align: center;">
            <ul class="row">
              <li class="item-content item-input col-100 item-input-with-value">
                <div class="item-inner">
                  <div class="item-input-wrap">
                    <input type="text" name="nickname" placeholder="변경할 닉네임을 입력해주세요" value="" class="form-control"/>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </form>
        <!-- url 변경 필요 -->
        <a id="updateProfile" class="button-large button button-fill" style="margin-top: 10px;">프로필 수정하기</a>
        <br>
        <a href="/" class="button-large button" style="height: 59px; border: 1px solid #94C015;">회원 탈퇴하기</a>
        </form>
      </div>
    </div>
  </div>
    <div class="toolbar tabbar tabbar-labels toolbar-bottom menubar-area">
      <div class="toolbar-inner">
        <a href="/home/" class="tab-link active">
          <i class="flaticon-home"></i>
        </a>
        <a href="/categories/" class="tab-link">
          <i class="fa-solid fa-bars"></i>
        </a>
        <a href="/search/" class="tab-link">
          <i class="fa-solid fa-magnifying-glass"></i>
        </a>
        <a href="/shopping-cart/" class="tab-link cart-in">
          <i class="flaticon-shopping-cart"></i>
        </a>
        <a href="/user/" class="tab-link">
          <img src="../images/avatar/1.jpg" class="user-media" alt="" />
        </a>
      </div>
    </div>
  </div>
<script>
  window.onload = function (){
    const fileInput = document.getElementById("chooseFile");
    const imageView = document.getElementById("userImage");
    //const myImg = document.querySelector(".my-image");
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
          inputImg.setAttribute("value", obj.fileurl);
          fileInput.setAttribute("name", obj.fileurl);
          imageView.setAttribute("src", obj.fileurl);
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
    $("#updateProfile").on("click", function (){
      var formsubmitSerialArray = $("#formUser").serializeArray();
      var formsubmit = JSON.stringify(objectifyForm(formsubmitSerialArray));

      console.log(formsubmitSerialArray);
      console.log(formsubmit);
      $.ajax({
        type:"POST",
        async:true,
        url:"http://localhost:9000/user/profile",
        data:formsubmit,
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        success:function (data){
          alert("success");
          console.log(data);
          location.href="/myPage";
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
