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
              <a href="newProducts.do">
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
            <select v-model="alcohol" @change="fnList">
              <option value="">-- 도수 --</option>
              <option value="1">:: 10도 미만 ::</option>
              <option value="2">:: 10 ~ 19도 ::</option>
              <option value="3">:: 20 ~ 29도 ::</option>
              <option value="4">:: 30도 이상 ::</option>
            </select>
            <select v-model="sweet" @change="fnList">
              <option value="">-- 단맛 --</option>
              <option value="1">:: 약함 ::</option>
              <option value="2">:: 중간 ::</option>
              <option value="3">:: 강함 ::</option>
            </select>
            <select v-model="sour" @change="fnList">
              <option value="">-- 신맛 --</option>
              <option value="1">:: 약함 ::</option>
              <option value="2">:: 중간 ::</option>
              <option value="3">:: 강함 ::</option>
            </select>
            <select v-model="body" @change="fnList">
              <option value="">-- 바디감 --</option>
              <option value="1">:: 약함 ::</option>
              <option value="2">:: 좋음 ::</option>
              <option value="3">:: 매우좋음 ::</option>
            </select>
            <select v-model="capacity" @change="fnList">
              <option value="">-- 용량 --</option>
              <option value="1">:: 400ml 미만 ::</option>
              <option value="2">:: 400ml ~ 700ml ::</option>
              <option value="3">:: 700ml 이상 ::</option> 
            </select>
            <select v-model="material" @change="fnList" class="materialList">
              <option value="">-- 원료(과채류) --</option>
              <option value="1">:: 사과 ::</option>
              <option value="2">:: 배 ::</option>
              <option value="3">:: 고구마 ::</option>
              <option value="4">:: 유자 ::</option>
              <option value="5">:: 베리류 ::</option>
              <option value="6">:: 무화과 ::</option>
              <option value="7">:: 레몬 ::</option>
              <option value="8">:: 복숭아 ::</option>
              <option value="9">:: 단호박 ::</option>
              <option value="10">:: 기타 ::</option>
            </select>
            <select v-model="madeBy" @change="fnList">
              <option value="">-- 생산지 --</option>
              <option v-for="item in madeByList" :value="item.madeBy">:: {{item.madeBy}} ::</option>
            </select>
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
        madeByList : [],
        products : [],
        codeList : [],
        selectCodes : [],
        alcohol : "",     // 알콜 도수
        sweet : "",       // 당도
        sour : "",        // 산미
        body : "",        // 바디감
        capacity : "",    // 용량
        material : "",    // 원료
        madeBy : ""       // 생산지
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
						self.codeList = data.list;
					}
				});
      },
      fnList() {  // 상품 리스트
        var self = this;
        var paramap = {};
        if(self.selectCodes.length > 0){
          var fCode = JSON.stringify(self.selectCodes);
          paramap = {
            selectCodes : fCode,
            alcohol : self.alcohol,
            sweet : self.sweet,
            sour : self.sour,
            body : self.body,
            capacity : self.capacity,
            material : self.material,
            madeBy : self.madeBy
          };
        } else {
          paramap = {
            alcohol : self.alcohol,
            sweet : self.sweet,
            sour : self.sour,
            body : self.body,
            capacity : self.capacity,
            material : self.material,
            madeBy : self.madeBy
          };
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
        $.ajax({  // 생산지 데이터
            url: "madeBy.dox",
            dataType: "json",
            type: "POST",
            data: [],
            success: (data) => {
              console.log(data);
              self.madeByList = data.madeBy;
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
      self.GetCodeLists();
    },
  });
  app.mount("#app");
</script>