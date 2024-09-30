<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>subscribe</title>
  </head>
  <body>
    <div id="app">
      <div v-if="alreadyUser">이미 구독 중인 상품입니다.</div>
      <button v-if="!alreadyUser" @click="fnPayment">구독 신청하기</button>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        subscribeId: "",
        userId: "",
        subInfo: {},
        subItemList: [],
        subImage: [],
        alreadyUser: false,
      };
    },
    methods: {
      async fnGetSubscribeItem() {
        console.log(this.subscribeId);
        console.log(this.userId);
        const url = "getSubscribeItem.dox";
        const res = await axios(url, { params: { subId: this.subscribeId } });
        this.subInfo = res.data.subItem;
        this.subItemList = res.data.productList;
        this.subImage = res.data.subImgList;
        console.log(this.subInfo);
        console.log(this.subItemList);
        console.log(this.subImage);
      },
      async fnUserStatus() {
        const url = "userSubCheck.dox";
        const submitForm = {
          userId: this.userId,
          subId: this.subscribeId,
        };
        const res = await axios.get(url, { params: submitForm });
        console.log(res.data);
        console.log(this.alreadyUser);
        if (res.data.flg == 1) {
          this.alreadyUser = true;
        }
        console.log(this.alreadyUser);
      },
      fnPayment() {
        location.href = "/cart/subPayment.do?subId=" + this.subscribeId;
      },
    },
    mounted() {
      if ("${subscribeId}" == "") {
        alert("잘못된 요청입니다.");
        location.href = "/productBoard/subscribeBoard.do";
      }
      this.userId = "${userId}";
      this.subscribeId = "${subscribeId}";
      this.fnGetSubscribeItem();
      this.fnUserStatus();
    },
  });
  app.mount("#app");
</script>
