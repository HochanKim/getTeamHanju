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
    <div id="app"></div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        subscribeId: "",
        userId: "",
      };
    },
    methods: {
      fnGetSubscribeItem() {
        console.log(this.subscribeId);
        console.log(this.userId);
        // const url = "getSubscribeItem.dox";
        // axios(url);
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
    },
  });
  app.mount("#app");
</script>
