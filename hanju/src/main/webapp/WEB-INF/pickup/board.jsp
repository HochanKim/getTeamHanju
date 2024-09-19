<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div
          id="wineCard"
          v-for="(item, index) in boardList"
          @click="fnDetailPage(item.productId)"
          :key="index"
        >
          <img :src="item.filePath" :alt="item.productName" />
          <div>이름:{{ item.productName }}</div>
          <div>컬러:{{ item.color }}</div>
          <div>국가:{{ item.madeBy }}</div>
          <div>품종:{{ item.material }}</div>
          <div>가격:{{ item.price }}</div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        boardList: [],
        searchKeyword: "",
      };
    },
    methods: {
      async fnGetBoardList() {
        const url = "boardList.dox";
        const submitForm = {
          searchKeyword: this.searchKeyword,
        };
        const { data } = await axios.get(url, { params: submitForm });
        this.boardList = data.result;
      },
      fnDetailPage(itemNo) {
        location.href = `itemDetail.do?itemId=\${itemNo}`;
      },
    },
    mounted() {
      this.fnGetBoardList();
    },
  });
  app.mount("#app");
</script>
