<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://unpkg.com/vue@latest"></script>
    <script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
    <link
      rel="stylesheet"
      href="https://unpkg.com/@vuepic/vue-datepicker@latest/dist/main.css"
    />
    <title>view 기본 세팅 파일</title>
  </head>
  <style></style>
  <body>
    <div id="app">
      <select v-model="select" @change="fnTest">
        <option value="">전체선택</option>
        <option v-for="item in list" :value="item.code">
          {{ item.codeName }}
        </option>
      </select>
      <div>여기 선택한 코드 : {{ select }}</div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        select: "",
        list: [
          {
            codeName: "전통주 선물세트",
            code: "G",
          },
          {
            codeName: "탁주",
            code: "TJ",
          },
          {
            codeName: "청주",
            code: "CJ",
          },
          {
            codeName: "증류주",
            code: "SJ",
          },
          {
            codeName: "과실주",
            code: "FJ",
          },
          {
            codeName: "전통주와인",
            code: "TW",
          },
        ],
        boardList: [],
      };
    },
    methods: {
      fnTest() {
        alert(this.select);
        //ajax 실행 결과 data
        this.boardList = data.list;
      },
    },
    mounted() {},
  });
  app.mount("#app");
</script>
