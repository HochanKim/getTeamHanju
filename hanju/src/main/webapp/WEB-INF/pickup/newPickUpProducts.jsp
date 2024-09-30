<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mainCss.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/productList/lists.css"
    />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주</title>
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
              <span class="selected">신상품</span>
          </a>
          <a href="bestPickUp.do">
              <span>베스트</span>
          </a>
        </div>
      </section>
      <!-- 상품 리스트 영역 -->
      <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
        <ul v-for="item in newProducts">
          <li class="productList">
            <a @click="fnDetailPage(item.sellId)">
              <div>
                <div class="img-wrap">
                  <img :src="item.filePath" :alt="item.fileOrgName" />
                </div>
                <p class="productName.wine">{{ item.productName }}</p>
                <p class="price">\ {{ item.priceComma }}</p>
                <span class="mini">원산지 {{ item.madeBy }}</span>
                <p class="material">
                  <span class="mini title">품종</span> {{ item.material }}
                </p>
                <p>평점 0.0</p>
              </div>
            </a>
          </li>
        </ul>
      </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        newProducts : [],
      };
    },
    methods: {
        fnList() {
            var self = this;
            var paramap = {};
            $.ajax({
                url: "newPickUpProducts.dox",
                dataType: "json",
                type: "POST",
                data: [],
                success: (data) => {
                  self.newProducts = data.newList;
                },
            });
        },
        fnDetailPage(sellId) {
          location.href = `/details/details.do?id=\${sellId}`;
        }
    },
    mounted() {
      var self = this;
      self.fnList();
    },
  });
  app.mount("#app");
</script>
