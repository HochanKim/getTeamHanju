<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                <span class="selected">전체보기</span>
            </a>
            <a href="newPickUpProducts.do">
                <span>신상품</span>
            </a>
            <a href="bestPickUp.do">
                <span>베스트</span>
            </a>
        </div>
        <!-- 선택 코드 리스트 영역 1 -->
        <div class="kindList">
          <label v-for="item in codeList">
            <input type="checkbox" v-model="selectCodes" :value="item.code" @change="PickUpList">
            {{item.codeName}}
          </label>
        </div>
        <!-- 선택 코드 리스트 영역 2 -->
        <select v-model="alcohol" @change="PickUpList">
          <option value="">-- 도수 --</option>
          <option value="1">:: 10도 미만 ::</option>
          <option value="2">:: 10도 이상 ::</option>
        </select>
        <select v-model="sweet" @change="PickUpList">
          <option value="">-- 단맛 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 중간 ::</option>
          <option value="3">:: 강함 ::</option>
        </select>
        <select v-model="sour" @change="PickUpList">
          <option value="">-- 신맛 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 중간 ::</option>
          <option value="3">:: 강함 ::</option>
        </select>
        <select v-model="sparkling" @change="PickUpList">
          <option value="">-- 탄산유무 --</option>
          <option value="1">:: 없음 ::</option>
          <option value="2">:: 있음 ::</option>
        </select>
        <select v-model="body" @change="PickUpList">
          <option value="">-- 바디감 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 좋음 ::</option>
          <option value="3">:: 매우좋음 ::</option>
        </select>
        <select v-model="capacity" @change="PickUpList">
          <option value="">-- 용량 --</option>
          <option value="1">:: 400ml 미만 ::</option>
          <option value="2">:: 400ml ~ 700ml ::</option>
          <option value="3">:: 700ml 이상 ::</option>
        </select>
        <select v-model="material" @change="PickUpList">
          <option value="">-- 품종 --</option>
          <option v-for="item in materialList" :value="item.material">:: {{ item.material }} ::</option>
        </select>

        <select v-model="madeBy" @change="PickUpList">
          <option value="">-- 원산지 --</option>
          <option v-for="item in MadeByList" :value="item.madeBy">:: {{ item.madeBy }} ::</option>
        </select>
      </section>
      <!-- 상품 리스트 영역 -->
      <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
        <ul v-for="item in products"> 
          <li class="productList">
            <a @click="fnDetailPage(item.productId)">
              <div>
                <div class="img-wrap">
                  <img :src="item.filePath" :alt="item.fileOrgName" />
                </div>
                <p class="productName">{{ item.productName }}</p>
                <p class="price">
                  {{ item.priceComma }} <span class="mini">원</span>
                </p>
                <span class="mini made">원산지 {{ item.madeBy }}</span>
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
        products: [],
        materialList : [],
        MadeByList : [],
        codeList : [],
        selectCodes : [],
        alcohol : "",     // 알콜 도수
        sweet : "",       // 당도
        sour : "",        // 산미
        sparkling : "",   // 탄산 유무
        body : "",        // 바디감
        capacity : "",    // 용량
        material : "",    // 품종
        madeBy : ""       // 원산지
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
      PickUpList() {  // 와인 픽업 리스트
          var self = this;
          var paramap = {};
          if(self.selectCodes.length > 0){
            var fCode = JSON.stringify(self.selectCodes);
            paramap = {
              selectCodes : fCode,
              alcohol : self.alcohol,
              sweet : self.sweet,
              sour : self.sour,
              sparkling : self.sparkling,
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
              sparkling : self.sparkling,
              body : self.body,
              capacity : self.capacity,
              material : self.material,
              madeBy : self.madeBy
            };
        }
        $.ajax({
            url: "pickUpLists.dox",
            dataType: "json",
            type: "POST",
            data: paramap,
            success: (data) => {
              self.products = data.pickup;
            },
        });
        $.ajax({  // 품종 리스트 데이터
            url: "material.dox",
            dataType: "json",
            type: "POST",
            data: [],
            success: (data) => {
              self.materialList = data.material;
            },
        });
        $.ajax({  // 원산지 리스트 데이터
            url: "madeBy.dox",
            dataType: "json",
            type: "POST",
            data: [],
            success: (data) => {
              self.MadeByList = data.madeBy;
            },
        });
      },
      fnDetailPage(productId) {
        location.href = `/details/detailsPickup.do?id=\${productId}`;
      }
    },
    mounted() {
      var self = this;
      self.PickUpList();
      self.GetCodeLists();
    },
  });
  app.mount("#app");
</script>