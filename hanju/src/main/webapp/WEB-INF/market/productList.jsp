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
        <!-- 카테고리 버튼 클릭 (1) -->
        <div class="productsListSelect">
          <a href="productList.do">
              <span class="selected">전체상품</span>
          </a>
          <a href="newProducts.do">
              <span>신상품</span>
          </a>
          <a href="bestSeller.do">
              <span>베스트</span>
          </a>
        </div>
        <!-- 
                카테고리 버튼 클릭 (2) 
                : 클릭시 전통주, 굿즈, 선물용 페이지로 이동 
            -->
        <div class="productsPartList">
          <a href="traditionProducts.do">
            <span>전통주</span>
          </a>
          <a href="giftSets.do">
            <span>선물세트</span>
          </a>
        </div>
      </section>
      <!-- 상품 리스트 영역 -->
      <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
        <ul v-for="item in products"> 
          <li class="productList">
            <a @click="fnDetailPage(item.sellId)">
              <div>
                <div class="img-wrap">
                  <img :src="item.filePath" :alt="item.fileOrgName" />
                </div>
                <p class="productName">{{ item.productName }}</p>
                <p class="price">\ {{ item.priceComma }}</p>
                <span class="mini">생산지 {{ item.madeBy }}</span>
                <p class="alcohol">
                  <span class="mini title">알코올 도수</span> {{ item.alcohol }} %</p>
                <p>
                  평점 <span :value="item.productId">{{}}</span>
                </p>
              </div>
            </a>
          </li>
        </ul>
        <!-- 페이징 버튼 -->
        <div id="pagination">
          <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
          <button v-for="index in totalPages" :class="{active: index == currentPage}" @click="fnClickPage(index)">{{ index }}</button>
          <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
        </div>
      </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products: [],
        totalPages : 0,     // 페이지 첫 인덱스
        pageSize : 16,      // 한 페이지의 호출 리스트 개수
        currentPage : 1,     // 페이지 첫 호출시 시작 페이지 번호 
        number : [],
      };
    },
    methods: {
        fnList(start, size) {
            var self = this;
            var paramap = {
              start : start, 
              size : size
            };
            $.ajax({
                url: "productList.dox",
                dataType: "json",
                type: "POST",
                data: paramap,
                success: (data) => {
                  self.products = data.list;
                },
            });
        },
        fnDetailPage(sellId) {
          location.href = `/details/details.do?id=\${sellId}`;
        },
        fnGetTotalGroupSell() {     // 페이징 메소드
          $.ajax({	
            url:"getTotalNormalSell.dox",
            dataType:"json",	
            type : "POST", 
            data : {},
            success : (data) => {
              var totalGroupSell = data.number;
              this.totalPages = Math.ceil(totalGroupSell / this.pageSize);
            }
          });
        },
        fnClickPage(index){    // 페이징 숫자 버튼
            if (index < 0) return;
            if (index > this.totalPages) return;

            this.currentPage = index;

            var start = (this.currentPage - 1) * this.pageSize;
            var size  = this.pageSize;
            this.fnList(start, size);
        },
    },
    mounted() {
      var self = this;
      self.fnList(this.totalPages, this.pageSize);
      self.fnGetTotalGroupSell();
    },
  });
  app.mount("#app");
</script>
