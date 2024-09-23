<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/joinbtn.css"/>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
        <div>회원가입</div>

        <div>본인인증</div>
        <div>안전한 회원가입을 위한 본인인증 단계입니다.</div>


        <button>휴대폰 사진</button>
        <div>휴대폰 인증</div>

        <div>본인 인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</div>


    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {};
    },
    methods: {
        fnJoin() {
            var self = this;

        $.ajax({
          url: "user/joinbtn.do",
          dataType: "json",
          type: "POST",
          data: {},
          success: () => {
          
          },
        });
      },
    },



    mounted() {},
  });
  app.mount("#app");
</script>