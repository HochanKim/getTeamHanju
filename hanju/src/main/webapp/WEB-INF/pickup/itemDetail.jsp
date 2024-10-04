<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div class="card"></div>
      <div class="productName">{{ selectedItem.productName }}</div>
      <div class="productImage">
        <img :src="img" v-for="(img, index) in productImg" :key="index" />
      </div>
      <div class="sellBox">
        <div>{{ selectedItem.price }}</div>
        <div><button>픽업지점 선택하고 구매하기</button></div>
      </div>
      <div class="detailInfo">
        <div class="col">종류</div>
        <div>{{ selectedItem.color }}</div>
        <div class="col">나라</div>
        <div>{{ selectedItem.madeBy }}</div>
        <div class="col">품종</div>
        <div>{{ selectedItem.material }}</div>
        <div class="col">당도</div>
        <div>{{ selectedItem.sweet }}</div>
        <div class="col">산도</div>
        <div>{{ selectedItem.sour }}</div>
        <div class="col">바디</div>
        <div>{{ selectedItem.body }}</div>
        <div class="col">타닌</div>
        <div>{{ selectedItem.bitter }}</div>
        <div class="col">도수</div>
        <div>{{ selectedItem.alcohol }}</div>
        <div class="col">용량</div>
        <div>{{ selectedItem.capacity }} ml</div>
      </div>
      <div class="detailImage">
        <img :src="img" v-for="(img, index) in detailImg" :key="index" />
      </div>
      <div></div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        itemId: "",
        detailImg: [],
        productImg: [],
        selectedItem: {},
      };
    },
    methods: {
      async fnView() {
        try {
          this.itemId = "${itemId}";
          const url = "itemDetailView.dox";
          const submitForm = { itemId: this.itemId };
          const { data } = await axios.get(url, { params: submitForm });
          this.detailImg = data.detailImage;
          this.productImg = data.productImage;
          this.selectedItem = data.searchItem;
          console.log(data);
        } catch (error) {
          console.log(error);
        }
      },
    },
    mounted() {
      this.fnView();
    },
  });
  app.mount("#app");
</script>
