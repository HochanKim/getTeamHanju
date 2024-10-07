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
            <!-- 페이징 버튼 -->
            <div id="pagination">
              <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
              <button v-for="index in totalPages" :class="{active: index == currentPage}" @click="fnClickPage(index)">{{ index }}</button>
              <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
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
        totalPages : 0,     // 페이지 첫 인덱스
        pageSize : 10,      // 한 페이지의 호출 리스트 개수
        currentPage : 1,     // 페이지 첫 호출시 시작 페이지 번호 
      };
    },
    methods: {
       
        fngudok(start, size) {
          var self = this;
          var nparmap = {
            start : start, 
            size : size
          };

          $.ajax({
            url: "gudokCheck.dox",
            dataType: "json",
            type: "POST",
            data : nparmap,
            success: function (data) {
              console.log("구독리스트");
              console.log(data);
              console.log(data.list);
              self.subscribeList = data.list;
            }
          });
        },
        fnCancle(subscribeId){ 
            var self = this;
            var nparmap = {
                subscribeId : subscribeId
            }
            $.ajax({
            url: "gudokState.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function (data) {
              self.fngudok();
            }
          });
        },
        fnDetailPage(id){
            location.href="/details/subscribe.do?id="+id
        },
        
        fnGetTotalGu() {     // 페이징 메소드
          var self = this;
          var nparmap = {
            userId:self.userId
          };
          $.ajax({	
            url:"getTotalGudok.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : (data) => {
              console.log("구독페이징");
              console.log(data);
              var totalGudok = data.number || 0;
              this.totalPages = Math.ceil(totalGudok / this.pageSize);
            }
          });
        },
        fnClickPage(index){    // 페이징 숫자 버튼
            if (index < 0) return;
            if (index > this.totalPages) return;

            this.currentPage = index;

            var start = (this.currentPage - 1) * this.pageSize;
            var size  = this.pageSize;
            this.fngudok(start, size);
        },
    },

    mounted() {
      var self = this;
      self.fngudok(self.totalPages, self.pageSize);
      self.fnGetTotalGu();
    },
  });
  app.mount("#app");
</script>