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
    <title>샘플 리스트</title>
  </head>
  <body>
    <div id="app">
      <input
        v-model="keyword"
        type="text"
        @keyup.enter="fnGetList"
        placeholder="title 검색 엔터"
      />
      <table>
        <tr>
          <th>testNo</th>
          <th>testTitle</th>
          <th>testName</th>
          <th>testDate</th>
          <th>testContents</th>
        </tr>
        <tr v-for="(item, index) in searchList" :key="index">
          <td>{{ item.testNo }}</td>
          <td>{{ item.testTitle }}</td>
          <td>{{ item.testName }}</td>
          <td>{{ item.testDate }}</td>
          <td>{{ item.testContents }}</td>
        </tr>
      </table>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        keyword: "",
        searchList: [],
      };
    },
    methods: {
      async fnGetList() {
        const url = "list.dox";
        const submitForm = {
          title: this.keyword,
        };
        const res = await axios.get(url, { params: submitForm });
        console.log(res.data);
        this.searchList = res.data.result;
      },
    },
    mounted() {
      this.fnGetList();
    },
  });
  app.mount("#app");
</script>
