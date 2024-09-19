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
            margin:0 auto;
		}
        
        /* 카테고리 영역 */
        .productsListSelect a, .productsPartList a {
            text-decoration: none;
            color:#000;
            display: inline-block;
        }
        .productsListSelect a {
            margin-right:20px;
            margin-bottom:12px;
            font-size:24px;
        }
        .productsPartList a {
            margin-right:14px;
            font-size: 18px;
        }
        .selected {
            font-weight: bold;
        }

        /* 상품 리스트 영역 */
		ul {
			display: inline-block;
			width:20%;
            margin:30px;
            padding:0;
		}
		.productList {
			list-style:none;
		}
        .productList > a {
            text-decoration: none;
            color:#000;
        }
       	.productList > div { 
            box-sizing: border-box;
            width:100%;
            height:100%;
        }
        .productName {
            font-size:24px;
            font-weight: 500;
        }
        .price {
            font-size:18px;
            font-weight: bold;
        }

        /* 이미지 */
        .img-wrap {
            height:400px;
            overflow: hidden;
        }
        .img-wrap img {
            width:100%;
            height:100%;
        }
        img:hover {
            transform: scale(1.1, 1.1); 
            transition-duration: 0.5s;
        }

        /* 페이징 버튼 */
		.pagination {
			justify-content: center;
			align-items: center;
			margin: 20px;
		}

		.pagination button {
			background-color: #f8f9fa;
			border: 1px solid #dee2e6;
			color: #007bff;
			padding: 8px 12px;
			margin: 0 2px;
			cursor: pointer;
			transition: background-color 0.3s, color 0.3s;
			border-radius: 4px;
		}

		.pagination button:hover {
			background-color: #007bff;
			color: white;
		}

		.pagination button.active {
			background-color: #007bff;
			color: white;
			cursor: default;
		}

		.pagination button:disabled {
			background-color: #e9ecef;
			color: #6c757d;
			cursor: not-allowed;
			border: 1px solid #dee2e6;
		}

		.pagination button:not(.active):not(:disabled):hover {
			background-color: #0056b3;
			color: white;
		}
    </style>
  </head>
  <body>
    <div id="app">
        <section>
            <!-- 카테고리 버튼 클릭 (1) -->
            <div class="productsListSelect">
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
        </section>
        <!-- 상품 리스트 영역 -->
        <section class="productContainer">
            <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
            <ul v-for="item in products">
                <li class="productList">
                    <a href="javascript::">
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
        <!-- 페이지 버튼 영역 -->
        <div class="pagination">
		    <button v-if="currentPage > 1">이전</button>
		    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnList(page)">
		        {{page}}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products : [],
        currentPage: 1, 	// 현재 위치 페이지     
        pageSize: 12,        // 한 페이지의 글 호출 개수
        selectSize : 12,		// 한 페이지의 글 호출 개수 (option 값)
        totalPages: "",  	// 총 페이징 버튼 수
      };
    },
    methods: {
        fnList(page) {
            var self = this;
            var startIndexNum = (page - 1) * self.pageSize;
            self.currentPage = page;
            self.pageSize = self.selectSize;
            var nparmap = {
                startIndexNum : startIndexNum,
                pageSize : self.pageSize
			};

            $.ajax({
                url: "allProducts.dox",
                dataType: "json",
                type: "POST",
                data: {},
                success: (data) => {
                    self.products = data.list;
                    self.totalPages = Math.ceil(data.page / self.pageSize);
                },
            });
        },
    },
    mounted() {
		this.fnList(self.currentPage);
    },
  });
  app.mount("#app");
</script>