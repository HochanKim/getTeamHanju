<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/checkGudok.css" />
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
              <div class="tit">
                <h2>구독 관리</h2>
              </div>
              <div class="tableContents">
                <table>
                    <tr>
                        <th>배송주기</th>
                        <th>배송시작일</th>
                        <th>상품정보</th>
                        <th>구독현황</th>
                    </tr>
                    <tr v-for="item in subscribeList">
                        <td class="subscribe">
                            <div>{{item.arriveDate}}</div>
                        </td>
                        <td class="subscribeStart">
                            <div>{{item.subDate}}</div>
                        </td>
                        <td class="product">
                            <div class="reviewArea">
                            <a @click="fnDetailPage(item.subscribeId)" class="thum"><img :src="item.filePath"></a>
                            <span class="reviewArea2">
                                <a @click="fnDetailPage(item.subscribeId)" class="productName">{{item.title}}</a>
                            </span>
                            </div>
                        </td>
                        <td class="subscribeState">
                            <div>{{item.nextSub == 'Y'? "구독중":"구독취소"}}</div>
                            <div>
                                <button class="subBtn" v-if="item.nextSub == 'Y'" @click="fnCancle(item.subscribeId)">구독취소</button>
                            </div>
                        </td>
                    </tr>
                </table>
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
        subscribeList : [],
      };
    },
    methods: {
       
        fngudok() {
          var self = this;

          $.ajax({
            url: "gudokCheck.dox",
            dataType: "json",
            type: "GET",

            success: function (data) {
                console.log(data);
                console.log(data.list);
                self.subscribeList = data.list;
            }
          });
        },
        fnCancle(subscribeId){
            
            var self = this;
            var asdf = {
                subscribeId : subscribeId
            }
            $.ajax({
            url: "gudokState.dox",
            dataType: "json",
            type: "POST",
            data: asdf,
            success: function (data) {
                self.fngudok();
            }
          });
        },
        fnDetailPage(id){
            location.href="/details/subscribe.do?id="+id
        }
    },

    mounted() {
        this.fngudok();
    },
  });
  app.mount("#app");
</script>