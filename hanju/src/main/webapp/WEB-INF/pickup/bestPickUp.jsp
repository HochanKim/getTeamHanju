<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주 와인픽업</title>
  </head>
  <body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
      <section class="selectSection">
        <!-- 카테고리 버튼 클릭 (1) -->
        <div class="productsListSelect">
          <a href="pickUpLists.do">
              <span>전체보기</span>
          </a>
          <a href="newPickUpProducts.do">
              <span>신상품</span>
          </a>
          <a href="bestPickUp.do">
              <span class="selected">베스트</span>
          </a>
        </div>
      </section>
      <!-- 상품 리스트 영역 -->
      <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
          <div v-for="item in bestProducts" class="productList">
            <a @click="fnDetailPage(item.productId)">
              <div class="wineProduct">
                <div class="img-wrap">
                  <img :src="item.filePath" :alt="item.fileOrgName" />
                </div>
                <p class="productName">{{ item.productName }}</p>
                <p class="price" v-if="item.discount == 0"> <!-- 할인율 0일 경우 -->
                  {{ item.priceComma }} 
                  <span class="mini">원</span>
                </p>
                <p class="price" v-else> <!-- 할인율 존재할 경우 -->
                  <del style="font-size:14px; font-weight: 400; margin-right:8px;">{{ item.priceComma }} 원</del>
                  <p v-if="item.discount != 0">
                    <span class="discount">{{item.discount}} % </span>
                    <span class="price productPrice">
                      {{item.discountPrice}} <span class="mini">원</span>
                    </span>
                  </p>
                  <p v-else>
                    <br>
                  </p>
                </p>
                <p class="made">
                  <span class="mini madeBy">원산지</span> {{ item.madeBy }}
                </p>
                <p class="material">
                  <img src="../../image/grape.png" alt="포도" />
                  <span class="mini title">품종</span> {{ item.material }}
                </p>
                <p class="productGrade">
                  <img src="../../image/star_icon.png" alt="별표" />
                  <span class="mini grade">평점</span> 
                  <span :value="item.productId" class="avg" v-if="item.average > 0">
                    {{ item.average }}
                    <span class="mini count">({{ item.comentCnt }})</span>
                  </span>
                  <span :value="item.productId" class="avg" v-if="item.average == 0">평점 없음</span>
                </p>
              </div>
            </a>
          </div>
      </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        bestProducts : [],
      };
    },
    methods: {
        fnList() {
            var self = this;
            var paramap = {};
            $.ajax({
                url: "bestSellerPickUp.dox",
                dataType: "json",
                type: "POST",
                data: [],
                success: (data) => {
                  self.bestProducts = data.best;
                },
            });
        },
        fnDetailPage(productId) {
          location.href = `/details/detailsPickup.do?id=\${productId}`;
        }
    },
    mounted() {
      var self = this;
      self.fnList();
    },
  });
  app.mount("#app");
</script>
