<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/orderInfo.css"/>
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
            <h2>주문조회</h2>
          </div>
            <div class="list">
              <h3>주문 상품 정보</h3>
            </div>
          <table>
            <tr>
                <th>주문일자</th>
                <th>상품</th>
                <th>수량</th>
                <th>주문금액</th>
                <th>상태</th>
            </tr>
            <tr v-for="item in orderList">
              <td class="cdatetime">
                <div>{{item.cDateTime}}</div>
              </td>
                <td class="product">
                    <div class="productInfo">
                      <a @click="fnDetailPage(item.sellId,item.kind)" class="thum"><img :src="item.filePath"></a>
                      <span>
                        <a @click="fnDetailPage(item.sellId,item.kind)" class="productName">{{item.productName}}</a>
                      </span>
                    </div>
                </td>
                <td class="cnt">
                    <div>{{item.productCount}}</div>
                </td>
                <td class="price">
                   <div>{{parseInt(item.price - (item.price / 100 * item.discount)).toLocaleString()}}원</div>
                    <div>
                       
                    </div>
              </td>
              <td class="state">
                <div v-if="item.status == 'B'">결제완료</div>
                <div v-else-if="item.status == 'S'">배송중</div>
                <div v-else-if="item.status == 'C'">배송완료</div>
                <div v-else>조회불가</div>
            </td>
            </tr>
          </table>
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
        orderList:[],
        totalPages : 2,     // 페이지 첫 인덱스
        pageSize : 10,      // 한 페이지의 호출 리스트 개수
        currentPage : 1,     // 페이지 첫 호출시 시작 페이지 번호  
      };
    },
    methods: {
      fnOrder(currentPage, pageSize){
        var self = this;
			

				$.ajax({
					url:"getOrderList.dox", 
					dataType:"json",	
					type : "GET", 
				
					success : function(data) {  
						console.log(data);
						self.orderList = data.orderList;
            console.log(self.orderList);
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

      fnGetTotalOrder() {     // 페이징 메소드
          
          $.ajax({	
            url:"getTotalOrder.dox",
            dataType:"json",	
            type : "POST", 
            data : {},
            success : (data) => {
              console.log(data);
              var totalOrder = data.number || 0;
              this.totalPages = (Math.ceil(totalOrder / this.pageSize), 1);
            }
          });
        },
        fnClickPage(index){    // 페이징 숫자 버튼
            if (index < 0) return;
            if (index > this.totalPages) return;

            this.currentPage = index;

            var currentPage = (this.currentPage - 1) * this.pageSize;
            var pageSize  = this.pageSize;
            this.fnOrder(start, size);
        },
    },
    mounted() {
      var self = this;
      self.fnOrder(self.totalPages, self.pageSize);
      self.fnGetTotalOrder();
    },
  });
  app.mount("#app");
</script>