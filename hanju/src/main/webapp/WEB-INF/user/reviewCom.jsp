<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/review.css"/>
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
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
                                    <a @click="fnDetailPage(item.productId)" class="thum"><img :src="item.filePath"></a>
                                    <span>
                                    <a @click="fnDetailPage(item.productId)" class="productName">{{item.productName}}</a>
                                    </span>
                                </div>
                            </td>
                            <td class="reviewInfo">
                                <div>
                                    <div>{{item.cDateTime}}</div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        orderList:[],
      };
    },
    methods: {
        fnOrder(){
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
        fnDetailPage(productId) {
            location.href = `/details/details.do?id=\${productId}`;
        }
    },
    mounted() {
        this.fnOrder();
    },
  });
  app.mount("#app");
</script>