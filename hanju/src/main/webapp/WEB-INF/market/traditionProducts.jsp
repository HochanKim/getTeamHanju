<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css" />
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
              <a href="productList.do">
                  <span class="selected">전체상품</span>
              </a>
              <a href="javascript:void(0);">
                  <span>신상품</span>
              </a>
              <a href="javascript:void(0);">
                  <span>베스트</span>
              </a>
            </div>
            <!-- 
              카테고리 버튼 클릭 (2) 
              : 클릭시 전통주, 선물용 페이지로 이동 
            -->
            <div class="productsPartList">
                <a href="traditionProducts.do">
                    <span class="selected">전통주</span>
                </a>
                <a href="giftSets.do">
                    <span>선물세트</span>
                </a>
            </div>
            <!-- 선택 코드 리스트 영역 1 -->
            <div class="kindList">
              <label v-for="item in codeList">
                <input type="checkbox" v-model="selectCodes" :value="item.code" @change="fnList">
                {{item.codeName}}
              </label>
            </div>
            <!-- 선택 코드 리스트 영역 2 -->
            <select>
              <option v-model="alcohol">-- 도수 --</option>
              <option value="1">:: 10도 미만 ::</option>
              <option value="2">:: 10 ~ 19도 ::</option>
              <option value="3">:: 20 ~ 29도 ::</option>
              <option value="4">:: 30도 이상 ::</option>
            </select>
            <select>
              <option>-- 단맛 --</option>
              <option>:: 약함 ::</option>
              <option>:: 중간 ::</option>
              <option>:: 강함 ::</option>
            </select>
            <select>
              <option>-- 신맛 --</option>
              <option>:: 약함 ::</option>
              <option>:: 중간 ::</option>
              <option>:: 강함 ::</option>
            </select>
            <select>
              <option>-- 바디감 --</option>
              <option>:: 약함 ::</option>
              <option>:: 좋음 ::</option>
              <option>:: 매우좋음 ::</option>
            </select>
            <select>
              <option>-- 용량 --</option>
              <option>:: 400ml 미만 ::</option>
              <option>:: 400ml ~ 700ml ::</option>
              <option>:: 700ml 이상 ::</option>
            </select>
        </section>
        <!-- 상품 리스트 영역 -->
        <section class="productContainer">
            <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
            <ul v-for="item in products">
                <li class="productList">
                    <a href="javascript:void(0); ">
                        <div>
                            <div class="img-wrap">
                                <img :src="item.filePath" :alt="item.fileOrgName" />
                            </div>
                            <p class="productName">{{item.productName}}</p>
                            <p class="price">\ {{item.priceComma}}</p>
                            <p>{{item.alcohol}} %</p>
                            <p>평점 0.0</p>
                        </div>
                    </a>
                </li>
            </ul>
        </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products : [],
        codeList : [],
        selectCodes : [],
        alcohol : ''  // 알콜 도수
      };
    },
    methods: {
      GetCodeLists(){   // 선택 체크박스
        var self = this;
				var paramap = {};
				$.ajax({
					url:"codeList.dox",
					dataType:"json",	
					type : "POST", 
					data : paramap,
					success : function(data) {
            console.log(data); 
						self.codeList = data.list;
					}
				});
      },
      fnList() {  // 상품 리스트
        var self = this;
        var paramap = {};
        if(self.selectCodes.length > 0){
          var fCode = JSON.stringify(self.selectCodes);
          paramap = {selectCodes : fCode};
        }
        $.ajax({
            url: "traditionAlcohol.dox",
            dataType: "json",
            type: "POST",
            data: paramap,
            success: (data) => {
              console.log(data);
              self.products = data.tradList;
            },
        });
      },
    },
    mounted() {
      var self = this;
		  self.fnList();
      self.GetCodeLists();
    },
  });
  app.mount("#app");
</script>