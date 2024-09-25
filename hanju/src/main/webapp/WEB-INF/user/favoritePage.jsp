<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>favorite</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div>찜목록</div>
        <div class="item" v-for="(item, index) in favoriteList" :key="index">
          <div class="imgBox">
            <img :src="item.filePath" />
          </div>
          <div>
            {{ item.type == "T" ? "일반 구매 상품" : "픽업 구매 상품" }}
          </div>
          <div>{{ item.productName }}</div>
          <div>{{ item.price }}</div>
          <div>찜한 날짜: {{ item.cDateTime }}</div>
          <button @click="fnGoToDetailBoard(item.fkId)">
            상세 페이지 가기
          </button>
          <button @click="fnItemDelete(item.productId)">찜목록에서 제거</button>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId: "",
        favoriteList: [],
      };
    },
    methods: {
      async fnGetFavoriteItemList() {
        const url = "getFavoriteItemList.dox";
        const submitForm = {
          userId: this.userId,
        };
        const res = await axios.get(url, { params: submitForm });
        this.favoriteList = res.data.list;
        console.log(res.data);
      },
      fnGoToDetailBoard(fkId) {
        alert(
          "상세페이지에 제품 넘버 or 게시판 넘버를 넘기며 이동 넘버는 : " + fkId
        );
      },
      async fnItemDelete(productId) {
        const url = "deleteFavoriteItem.dox";
        const submitForm = {
          userId: this.userId,
          productId: productId,
        };
        const res = await axios.post(url, submitForm);
        if (res.data.status == "success") {
          this.fnGetFavoriteItemList();
        }
      },
    },
    mounted() {
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      this.userId = "${userId}";
      this.fnGetFavoriteItemList();
    },
  });
  app.mount("#app");
</script>
