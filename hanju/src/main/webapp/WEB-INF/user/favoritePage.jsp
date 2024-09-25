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
          <button @click="fnGoToDetailBoard(item.fkId,item.type)">
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
      fnGoToDetailBoard(fkId, type) {
        if (type == "T") {
          location.href = `/details/details.do?id=\${fkId}`;
        } else if (type == "W") {
          location.href = `/details/detailsPickup.do?id=\${fkId}`;
        }
      },
      async fnItemDelete(productId) {
        if (!confirm("찜목록에서 제거 하시겠습니까?")) {
          return;
        }
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
