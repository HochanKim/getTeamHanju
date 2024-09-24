<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <script src="https://unpkg.com/v-calendar"></script>
    <title>\</title>
  </head>
  <body>
    <div id="app">
      테스트
      <div>
        <VCalendar />
        <VDatePicker v-model="selectedDate" />
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        selectedDate: null,
      };
    },
    methods: {},
    mounted() {},
  });
  app.mount("#app");
</script>
