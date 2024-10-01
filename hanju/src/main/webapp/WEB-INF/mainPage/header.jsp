<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainPage/header.css" />
    <title>한주</title>
  </head>
  <body>
    <div id="headerZone"></div>
    <div id="header">
      <div id="container">
        <div id="center">
          <div class="menu">
            <a href="../market/productList.do">전통주</a>
          </div>
          <div class="menu">
            <a href="../pickup/pickUpLists.do">와인</a>
          </div>
          <div class="menu">
            <a href="../market/groupSellList.do">공동구매</a>
          </div>
          <!-- <div class="menu">
                    <a href="">펀딩</a>
                </div> -->
        </div>
        <div id="logo" @click="fnMain">
          <img src="/image/hanju_logo_g2.gif" />
          <!-- <img src="/image/haju_rogo.png" /> -->
        </div>
        <div id="right">
          <div v-if="userStatus == 'C'" class="icons">
            <div class="menu" @click="fnLogout"><a>로그아웃</a></div>
            <img
              class="rightIcon"
              src="../../image/person_black.png"
              @click="fnMyPage"
            />
            <img
              class="rightIcon"
              src="../../image/cart_black.png"
              @click="fnCart"
            />
            <img
              class="rightIcon"
              src="../../image/heart_plus_black.png"
              @click="fnFavorite"
            />
          </div>
          <div v-else-if="userStatus == 'S'" class="icons">
            <!-- <div @click="fnLogout">로그아웃</div> -->
            <div class="menu" @click="fnLogout">로그아웃</div>
            <div class="menu" @click="fnSellerPage">사업자 페이지</div>
          </div>
          <div v-else-if="userStatus == 'A'" class="icons">
            <div @click="fnLogout">로그아웃</div>
            <div @click="fnAdminPage">관리자 페이지</div>
            <img class="rightIcon" src="../../image/person_black.png" />
          </div>
          <div v-else class="icons" @click="fnLogin">
            <div class="menu">로그인</div>
            <img class="rightIcon" src="../../image/person_black.png" />
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const header = Vue.createApp({
    data() {
      return {
        userId: "${sessionId}",
        userStatus: "${sessionStatus}",
      };
    },
    methods: {
      fnTest() {
        console.log(this.userId);
        console.log(this.userStatus);
      },
      fnMain() {
        location.href = "../mainPage/mainPage.do";
      },
      fnSellerPage() {
        location.href = "../sellerPage/sellerMain.do";
      },
      fnLogin() {
        location.href = "../user/login.do";
      },
      fnLogout() {
        $.ajax({
          url: "../user/logout.dox",
          dataType: "json",
          type: "POST",
          data: {},
          success: (data) => {
            console.log(data);
            location.href = "../mainPage/mainPage.do";
          },
        });
      },
      fnMyPage() {
        location.href = "../user/myPage.do";
      },
      fnCart() {
        location.href = "../cart/viewCart.do";
      },
      fnFavorite() {
        location.href = "../user/favorite.do";
      },
      fnAdminPage() {
        location.href = "../admin/adminMain.do";
      },
    },
    mounted() {
      this.fnTest();
    },
  });
  header.mount("#header");
</script>
