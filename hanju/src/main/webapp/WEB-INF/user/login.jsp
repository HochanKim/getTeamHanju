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
                <form>
                    <label><input type="text" placeholder="아이디"></label>
                    <label><input type="text" placeholder="비밀번호"></label>
                    
                    <div>
                        <button id="loginBtn" @click="loginBtn">로그인</button>
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
                </form>
            </div>
        </div>
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