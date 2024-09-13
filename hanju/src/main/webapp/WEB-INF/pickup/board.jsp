<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/testCss.css"
    />
    <script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div id="card" v-for="(item, index) in boardList" :key="index">
          <div>이름:{{ item.productName }}</div>
        </div>
      </div>
      <img src="upload/샘플.jpg" />
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
        console.log(data);
      },
    },
    mounted() {
      this.fnGetBoardList();
    },
  });
  app.mount("#app");
</script>
