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
      <div v-for="(item, index) in subList" :key="index">
        <img :src="item.filePath" style="height: 100px" />
        <div>할인율 {{ item.discount }}%</div>
        <div>제목 {{ item.title }}</div>
        <div>배송 요일 {{ item.arriveDate }}</div>
        <div>
          원래 가격 {{ item.price }}
          <span style="color: red">취소선 그어주세요</span>
        </div>
        <div>
          할인된 진짜 가격 {{ (item.price * (100 - item.discount)) / 100 }}
        </div>
        <button @click="fnDetail(item.subscribeId)">상세보기</button>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        subList: [],
      };
    },
    methods: {
      async fnGetList() {
        const url = "getSubscribeList.dox";
        const res = await axios(url);
        this.subList = res.data.list;
        console.log(res.data);
      },
      fnDetail(id) {
        location.href = "/details/subscribe.do?id=" + id;
      },
    },
    mounted() {
      this.fnGetList();
    },
  });
  app.mount("#app");
</script>
