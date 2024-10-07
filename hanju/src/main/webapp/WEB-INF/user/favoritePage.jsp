<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/favoritePage.css"/>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="/js/axios.min.js"></script>
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>favorite</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div id="contents">
          <div class="tit">
            <h2>찜목록</h2>
          </div>
          <div class="inside">
            <table class="item">
            <tr>
              <th>상품정보</th>
              <th>판매가</th>
              <th>선택</th>
            </tr>
            <tr v-for="item in favoriteList">
              <td class="product">
                <div class="productInfo">
                  <a @click="fnDetailPage(item.sellId,item.productId)" class="thum"><img :src="item.filePath"></a>
                  <span>
                    <a @click="fnDetailPage(item.sellId,item.productId)" class="productName">{{item.productName}}</a>
                  </span>
                </div>
              </td>
              <td class="price"><strong>{{parseInt(item.price).toLocaleString()}}원</strong></td>
              <td class="state">
                <p>{{ item.type == "T" ? "일반 구매 상품" : "픽업 구매 상품" }}</p>
                <button class="delBtn" @click="fnItemDelete(item.productId)">삭제</button>
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
        userId: "",
        favoriteList: [],
        totalPages : 0,     // 페이지 첫 인덱스
        pageSize : 10,      // 한 페이지의 호출 리스트 개수
        currentPage : 1,     // 페이지 첫 호출시 시작 페이지 번호  
      };
    },
    methods: {
      fnGetFavoriteItemList(start, size) {
        var self = this;

          var nparmap = {
            userId: self.userId,
            start : start, 
            size : size
          };
        
          $.ajax({
            url: "getFavoriteItemList.dox",
            dataType: "json",
            type: "GET",
            data: nparmap,
            success: function (data) {
              console.log(data);
              self.favoriteList = data.list;
              
            }
          });
      },

      fnDetailPage(sellId,productId) {
        console.log(productId);
      
        if(!sellId){
        location.href = `/details/detailsPickup.do?id=\${productId}`;
      }else {
          location.href = `/details/details.do?id=\${sellId}`;
        }
      },

      fnItemDelete(productId) {
        var self = this;

        var nparmap = {
          userId: self.userId,
          productId: productId
        };

        if (!confirm("찜 상품을 삭제하시겠습니까?")) {
          return;
        }

        $.ajax({
            url: "deleteFavoriteItem.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function (data) {
              console.log(data);
              alert("삭제되었습니다.")
              self.fnGetFavoriteItemList();
            }
          });
      },

      fnGetTotalfavorite() {     // 페이징 메소드
        var self = this;
        var nparmap = {
          userId:self.userId
        };
          $.ajax({	
            url:"getTotalFavorite.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : (data) => {
              console.log(data);
              var totalFavorite = data.number || 0;
              this.totalPages = Math.ceil(totalFavorite / this.pageSize);
            }
          });
        },
        fnClickPage(index){    // 페이징 숫자 버튼
            if (index < 0) return;
            if (index > this.totalPages) return;

            this.currentPage = index;

            var start = (this.currentPage - 1) * this.pageSize;
            var size  = this.pageSize;
            this.fnGetFavoriteItemList(start, size);
        },
    },
    mounted() {
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      this.userId = "${userId}";
      this.fnGetFavoriteItemList(this.totalPages, this.pageSize);
      this.fnGetTotalfavorite();
    },
  });
  app.mount("#app");
</script>
