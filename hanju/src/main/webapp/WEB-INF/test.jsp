<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="css/mainCss.css" />
    <script src="js/jquery.js"></script>
    <script src="js/axios.min.js"></script>
    <script src="js/vue.js"></script>
    <title>첫번째 페이지</title>
  </head>
  <body>
    <div id="app">
      {{ test }}
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        test: "",
      };
    },
    methods: {
      fnTest() {
        $.ajax({
          url: "test.dox",
          dataType: "json",
          type: "POST",
          data: {},
          success: (data) => {
            console.log(data.result);
            this.test = data.result;
          },
        });
      },
    },
    mounted() {
      this.fnTest();
    },
  });
  app.mount("#app");
</script>
