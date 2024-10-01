<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/favoritePage.css"/>
    <script src="/js/axios.min.js"></script>
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>favorite</title>
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
              <td class="price"><strong>{{item.price}}</strong></td>
              <td class="state">
                <p>{{ item.type == "T" ? "일반 구매 상품" : "픽업 구매 상품" }}</p>
                <button @click="fnItemDelete(item.productId)">삭제</button>
              </td>
            </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId: "",
        favoriteList: [],
      };
    },
    methods: {
      fnGetFavoriteItemList() {
        var self = this;

          var nparmap = {
            userId: self.userId
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

      fnGetFavoriteItemList() {
        var self = this;

          var nparmap = {
            userId: self.userId
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
    },
    mounted() {
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      this.userId = "${userId}";
      this.fnGetFavoriteItemList();
    },
  });
  app.mount("#app");
</script>
