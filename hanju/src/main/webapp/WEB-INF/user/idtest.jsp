<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
        <table>
            <tr>
              <th>아이디*</th>
              <td>
                <input type="text" id="userId" v-model="userId" @input="fnIdCheck"><span>(영문소문자/숫자,4~16자)</span>
                <div v-if="idNotUse">사용 가능한 아이디입니다.</div>
                <div v-if="idUse">이미 사용중인 아이디입니다.</div>
              </td>
            </tr>
        </table>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId:"",
        idUse:false,
        idNotUse:false,
    };
    },
    methods: {
        fnIdCheck(){
                var self = this;
                var nparmap = {
                    userId:self.userId
                };
                
				$.ajax({
					url:"testjoin.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						const Id = data.result;
                        if(Id==0){
                            self.idNotUse=true;
                            self.idUse=false;
                        }else{
                            self.idUse=true;
                            self.idNotUse=false;
                            return false;
                        }
					}
				});

            },
    },
    mounted() {},
  });
  app.mount("#app");
</script>