<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주</title>
    <style>
		#app {
			
		}
        /* 카테고리 영역 */
        .selected {
            font-weight: bold;
        }

        /* 상품 리스트 영역 */
		ul {
			display: inline-block;
			width:400px;
			height:600px;
		}
		.productList {
			list-style:none;
		}
       	.productList > div { 
            box-sizing: border-box;
        }

        /* 이미지 */
        img {
            width:400px;
            height:400px;
        }
    </style>
  </head>
  <body>
    <div id="app">
        <!-- 카테고리 버튼 클릭 (1) -->
        <div class="productsList">
            <a href="javascript::">
                <span class="selected">전체상품</span>
            </a>
            <a href="javascript::">
                <span>신상품</span>
            </a>
            <a href="javascript::">
                <span>베스트</span>
            </a>
        </div>
        <!-- 
            카테고리 버튼 클릭 (2) 
            : 클릭시 전통주, 굿즈, 선물용 페이지로 이동 
        -->
        <div class="productsPartList">
            <a href="javascript::">
                <span>전통주</span>
            </a>
            <a href="javascript::">
                <span>선물용</span>
            </a>
            <!-- <a href="javascript::">
                <span>굿즈</span>
            </a> -->
        </div>
        <!-- 상품 리스트 영역 -->
        <!-- 상품 리스트 : 해당 리스트를 클릭시 '상세페이지'로 이동 -->
        <ul v-for="item in products">
            <li class="productList">
                <div style="border:1px solid black;">
                    <img src="../../image/01_barrack.png" alt="병영소주">
                    <p>{{item.productName}}</p>
                    <p>{{item.price}}</p>
                    <p>{{item.price}}</p>
                    <p>{{item.alcohol}}</p>
                </div>
            </li>
        </ul>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products : [],
      };
    },
    methods: {
        fnList() {
            $.ajax({
                url: "allProducts.dox",
                dataType: "json",
                type: "POST",
                data: {},
                success: (data) => {
                    console.log(data);
                    this.products = data.list;
                },
            });
        },
    },
    mounted() {
		this.fnList();
    },
  });
  app.mount("#app");
</script>