<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/modifyBefore.css"/>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
        <div id="container">
            <div id="contents">
                <div>
                    <p class="titTop">회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</p>
                    <p class="titBot">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
                </div>
                <div class="pwdCheck">
                    <input type="password" v-model="password" placeholder="비밀번호를 입력해주세요.">
                </div>
                <div class="pwdBtn">
                    <button @click="fnBackBtn" class="backBtn">취소</button>
                    <button @click="fnComBtn" class="comBtn">확인</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId: "${sessionId}",
        password: "",
      };
    },
    methods: {
      fnBackBtn(){
        $.pageChange("myPage.do", {});
      },

      fnComBtn(){
				var self = this;
				var nparmap = {
					userId : self.userId,
					password :  self.password	
				};
				$.ajax({
					url:"login.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {  
						console.log(data);
						if(data.code == 200){
							location.href="/user/modify.do";
						}else{
							alert(data.message);
						}
					}
				});
			},

    },
    
    mounted() {},
  });
  app.mount("#app");
</script>