<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>sample page</title>
  </head>
  <body>
    <jsp:include page="mainPage/header.jsp"></jsp:include>
    <div id="app">
      <div style="text-align: center; font-weight: bold">
        <div style="color: blue; font-size: 40px">서버 돌아가는 중</div>
        <div v-if="loginUser" class="user">
          로그인 중인 아이디 : {{ loginUser }}
        </div>
        <div v-if="loginMsg">{{ loginMsg }}</div>
        <div>vue.js 확인</div>
        <div style="color: red; font-size: 30px">{{ check }}</div>
        <button @click="fnGoToTest('test/list.do')">
          test/list.do 바로가기
        </button>
        <button @click="fnGoToTest('pickup/board.do')">
          pickup/board.do 바로가기
        </button>
        <button @click="fnGoToTest('main/imgUploader.do')">
          이미지 업로더 바로가기
        </button>
        <button @click="fnGoToTest('user/login.do')">로그인</button>
        <button @click="fnGoToTest('cart/viewCart.do')" class="ha">
          장바구니
        </button>
        <button @click="fnGoToTest('user/favorite.do')" class="ha">
          찜목록
        </button>
        <button @click="fnGoToTest('main/addCart.do')">장바구니 담기</button>
        <button @click="fnGoToTest('user/joinbtn.do')">휴대폰 본인인증</button>
        <button @click="fnGoToTest('user/join.do')">회원가입</button>
        <button @click="fnGoToTest('user/login.do')">로그인</button>
        <button @click="fnGoToTest('user/mypage.do')">마이페이지</button>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        check: "이게 보이면 vue.js 정상 작동중",
        loginUser: "",
        loginMsg: "",
      };
    },
    methods: {
      fnGoToTest(gotoLink) {
        const url = gotoLink;
        location.href = url;
      },
    },
    mounted() {
      "${userId}" == ""
        ? (this.loginMsg = "로그인 유저 없음.")
        : (this.loginUser = "${userId}");
    },
  });
  app.mount("#app");
</script>
