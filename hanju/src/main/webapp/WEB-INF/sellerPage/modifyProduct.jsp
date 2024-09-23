<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/modifyProduct.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
        <jsp:include page="../mainPage/header.jsp"></jsp:include>
        <div id="main">
            <jsp:include page="sellerSideBar.jsp"></jsp:include>
            <div id="container">
                <h3>제품 수정</h3>
                <hr>
                <input id="searchBox" type="text" placeholder="검색">
                <div id="cardView">
                    <div v-for="item in productList" class="card">
                        <img class="productImg" :src="item.filePath">
                        <div class="infoSection">
                            <h3>{{item.productName}}</h3>
                            <hr>
                            <table>
                                <tr>
                                    <th rowspan="2">특징</th>
                                    <th>종류</th>
                                    <th>도수</th>
                                    <th>원재료</th>
                                    <th>원산지</th>
                                    <th>용량</th>
                                </tr>
                                <tr>
                                    <td>{{item.codeName}}</td>
                                    <td>{{item.alcohol}}도</td>
                                    <td>{{item.material}}</td>
                                    <td>{{item.madeBy}}</td>
                                    <td>{{item.capacity}}ml</td>
                                </tr>
                                <tr>
                                    <th rowspan="2">맛</th>
                                    <th>탄산</th>
                                    <th>단 맛</th>
                                    <th>신 맛</th>
                                    <th>쓴 맛</th>
                                    <th>바디감</th>
                                </tr>
                                <tr>
                                    <td>{{item.sparkling}}</td>
                                    <td>{{item.sweet}}</td>
                                    <td>{{item.sour}}</td>
                                    <td>{{item.bitter}}</td>
                                    <td>{{item.body}}</td>
                                </tr>
                                <tr>
                                    <th rowspan="2">사업</th>
                                    <th>가격</th>
                                    <th>재고</th>
                                </tr>
                                <tr>
                                    <td>{{item.price}}</td>
                                    <td>{{item.stock}}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="pagination">
                        <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
                        <div v-for="index in totalPages" class="pageBtn" @click="fnClickPage(index)">{{ index }}</div>
                        <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../mainPage/footer.jsp"></jsp:include>
    </div>
</body>

</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                // 세션으로 교체해야함
                userId : "ADMIN",
                productList : [],
                currentPage : 1,
                totalPages : 0,
                pageSize : 5
            };
        },
        methods: {
            fnGetTotalProductCount() {
                $.ajax({
					url:"getTotalProductCount.dox",
					dataType:"json",
					type : "POST", 
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
                        this.fnComputePage(data.count);
					}
				});
            },
            fnComputePage(totalCount) {
                this.totalPages = Math.ceil(totalCount / this.pageSize);
            },
            fnClickPage(index) {
                if (index < 0) {
                    this.currentPage = 1;
                } else if (index > this.totalPages) {
                    this.currentPage = this.totalPages;
                } else {
                    this.currentPage = index;
                }
                this.fnGetProductList(this.currentPage, this.pageSize);
            },
            fnGetProductList(page, size) {
                $.ajax({
					url:"getProductList.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        userId : this.userId,
                        start : (page - 1) * this.pageSize,
                        size : size
                    },
					success : (data) => {
						console.log(data);
                        this.productList = data.list;
					}
				});
            }
        },
        mounted() {
            this.fnGetTotalProductCount();
            this.fnGetProductList(this.currentPage, this.pageSize);
        },
    });
    app.mount("#app");
</script>