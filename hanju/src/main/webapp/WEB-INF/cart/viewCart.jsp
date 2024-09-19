<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>장바구니</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div class="normal" v-if="normal.length>0">
          일반구매 있으면 이거 보여야함.
        </div>
        <div class="group" v-if="group.length>0">
          공동구매 있으면 이거 보여야함.
        </div>
        <div class="funding" v-if="funding.length>0">
          펀딩구매 있으면 이거 보여야함.
        </div>
        <div class="pickup" v-if="pickup.length>0">
          <div class="boxHead">
            <input type="checkbox" v-model="pickupAllCheck" /> 픽업구매 전체선택
          </div>
          <div class="boxmid" v-for="(item, index) in pickup" :key="index">
            <input
              type="checkbox"
              :value="{count:item.productCount,price:item.price}"
              v-model="selectPickup"
            />
            <div class="cartImgbox">
              <img :src="item.filePath" />
            </div>
            <div class="info">
              <div>{{ item.productName }}</div>
            </div>
          </div>
        </div>
      </div>
      <button @click="fnConsole">실험용 버튼</button>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        normal: [],
        group: [],
        funding: [],
        pickup: [],
        pickupAllCheck: true,
        selectPickup: [],
      };
    },
    methods: {
      fnConsole() {
        console.log(this.selectPickup);
      },
      async fnViewCart() {
        const url = "viewCart.dox";
        const res = await axios.get(url);
        console.log(res.data);
        if (!res.data.status) {
          alert("장바구니에 아무것도 없음! 그 없다는 페이지 만들어야함!");
        } else {
          this.normal = res.data.normal;
          this.group = res.data.group;
          this.funding = res.data.funding;
          this.pickup = res.data.pickup;
        }
      },
    },
    mounted() {
      this.fnViewCart();
    },
  });
  app.mount("#app");
</script>
