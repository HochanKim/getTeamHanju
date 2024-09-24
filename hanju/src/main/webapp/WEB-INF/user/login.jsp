<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/userCss/login.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div id="content">
          <div class="logTit">
            <h2>로그인</h2>
          </div>
          <div id="form">
            <label
              ><input type="text" placeholder="아이디" v-model="userId"
            /></label>
            <label
              ><input
                type="password"
                placeholder="비밀번호"
                v-model="password"
                @keyup.enter="fnLogin"
            /></label>
            <div>
              <button id="loginBtn" @click="fnLogin">로그인</button>
            </div>
            <ul>
              <li>
                <a href="">아이디 찾기</a>
              </li>
              <li>
                <a href="">비밀번호 찾기</a>
              </li>
              <li>
                <a href="join.do">회원가입</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId: "",
        password: "",
      };
    },
    methods: {
      fnLogin() {
        var self = this;
        var nparmap = {
          userId: self.userId,
          password: self.password,
        };
        $.ajax({
          url: "login.dox",
          dataType: "json",
          type: "POST",
          data: nparmap,
          success: function (data) {
            console.log(data);
            if (data.code == 200) {
              location.href = "/";
            } else {
              alert(data.message);
            }
          },
        });
      },
    },
    mounted() {},
    mounted() {},
  });
  app.mount("#app");
</script>
