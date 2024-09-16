<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">

    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {};
    },

    methods: {

    },

    mounted() {
        
    },
  });
  app.mount("#app");
</script>