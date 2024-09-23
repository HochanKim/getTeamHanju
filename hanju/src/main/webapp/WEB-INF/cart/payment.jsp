<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/payment.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <button @click="fn">ddd</button>
      카카오 페이로 결제하기
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        sumPrice: "",
        discountPrice: "",
      };
    },
    methods: {
      fnInit() {
        const itemList = ${cartItem};
        if(itemList.length==0){
          alert("구매 상품이 없습니다.");
          window.history.back();
        }else{

        }

      },
      fn() {
        requestPay("장바구니 전부", 35000, () => {
          console.log("데이터베이스에 결제 완료라고 쓰기");
        });
      },
    },
    mounted() {
      this.fnInit();
    },
  });
  app.mount("#app");
</script>
