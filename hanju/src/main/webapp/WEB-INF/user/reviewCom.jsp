<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/review.css"/>
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
                <div id="tit">
                    <h2>리뷰</h2>
                </div>
                <div id="inside">
                    <div id="stateReview">
                        <div class="ing">
                            <a href="../user/review.do">작성 가능한 리뷰</a>
                        </div>
                        <div class="com">
                            <a href="../user/reviewCom.do">작성한 리뷰</a>
                        </div>
                    </div>
                    <table>
                        <tr>
                            <th>상품</th>
                            <th>리뷰</th>
                        </tr>
                        <tr v-for="item in orderList">
                            <td class="product">
                                <div class="reviewArea2">
                                    <a @click="fnDetailPage(item.sellId,item.kind)" class="thum"><img :src="item.filePath"></a>
                                    <span>
                                    <a @click="fnDetailPage(item.sellId,item.kind)" class="productName">{{item.productName}}</a>
                                    </span>
                                </div>
                            </td>
                            <td class="reviewInfo">
                                <div>
                                    <div>{{item.content}}</div>
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
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId: "${sessionId}",
        orderList:[],
        totalPages : 0,     // 페이지 첫 인덱스
        pageSize : 10,      // 한 페이지의 호출 리스트 개수
        currentPage : 1,     // 페이지 첫 호출시 시작 페이지 번호
      };
    },
    methods: {
        fnOrder(start, size){
            var self = this;
            var nparmap = {
              start : start, 
              size : size
          };
				
			$.ajax({
				url:"getOrderList.dox", 
				dataType:"json",	
				type : "GET", 
				data : nparmap,
				success : function(data) {  
					console.log(data);
          console.log(self.orderList);
          for(var item of data.orderList){
            if(item.isComment == 'Y'){
            self.orderList.push(item);
             }
          }
					}
				});
        },
        
      fnDetailPage(productId,kind) {
        if(kind == 'P'){
        location.href = `/details/detailsPickup.do?id=\${productId}`;
      }else if(kind == 'N'){
          location.href = `/details/details.do?id=\${productId}`;
        }
      },

      fnGetTotalReview() {     // 페이징 메소드
        var self = this;
        var nparmap = {
          userId:self.userId
        };
          $.ajax({	
            url:"getTotalReview.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : (data) => {
              console.log("페이징");
              console.log(data);
              var totalReview = data.number || 0;
              this.totalPages = Math.ceil(totalReview / this.pageSize);
            }
          });
        },
        fnClickPage(index){    // 페이징 숫자 버튼
            if (index < 0) return;
            if (index > this.totalPages) return;

            this.currentPage = index;

            var start = (this.currentPage - 1) * this.pageSize;
            var size  = this.pageSize;
            this.fnOrder(start, size);
        },
    },
    mounted() {
      var self = this;
      self.fnOrder(self.totalPages, self.pageSize);
      self.fnGetTotalReview();
    },
  });
  app.mount("#app");
</script>