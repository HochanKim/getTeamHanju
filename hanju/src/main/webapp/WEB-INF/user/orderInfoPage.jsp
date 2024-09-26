<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div class="orderItem" v-for="(item, index) in orderList" :key="index">
          <div class="imgBox">
            <img :src="item.filePath" />
          </div>
          <div>{{ item.codeName }}</div>
          <div>{{ item.productName }}</div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        orderList: [],
      };
    },
    methods: {
      async fnGetOrderList() {
        const url = "getOrderList.dox";
        const res = await axios(url);
        this.orderList = res.data.orderList;
        console.log(res.data.orderList);
      },
    },
    mounted() {
      this.fnGetOrderList();
    },
  });
  app.mount("#app");
</script>
