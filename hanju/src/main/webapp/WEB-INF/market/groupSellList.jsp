<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
        <div id="main">
            <div id="container">
                <h1 class="margin16">공동구매</h1>
                <br>
                <br>
                <div class="margin16">
                    함께 구입하면 더 저렴하게 마실 수 있어요!
                </div>
                <hr>

                <div id="cardView">
                    <div v-for="item in groupSellList" class="card" @click="fnClickCard(item.groupSellId)">
                        <div class="area1">
                            <div class="groupSellImage">
                                image
                            </div>
                        </div>
                        <div class="area2">
                            <div class="line1">
                                <div class="title">{{item.productName}}</div>
                                <hr>
                            </div>
                            <div class="line2">
                                <div>현재 목표 {{item.currentAmount}} / {{item.targetAmount}}</div>
                                <div>종료일 {{item.endDate}}</div>
                            </div>
                            <div class="line3">
                                <div class="progressBar">
                                    <div class="progress" :style="item.progress"></div>
                                </div>
                            </div>
                            <div class="line4">
                                <div>
                                    할인율 {{item.discount}}%
                                </div>
                                <div class="cell2">
                                    <div>
                                        원가 / 공구가 <del>{{item.price}}</del> / {{item.price - (item.price / 100 * item.discount)}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div id="pagination">
                    <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
                    <div v-for="index in totalPages" class="pageBtn" @click="fnClickPage(index)">{{ index }}</div>
                    <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
                </div> -->
            </div>
        </div>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
</body>

</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                groupSellList : [],
            };
        },
        methods: {
            fnClickCard(){
                var paramap = {};
                $.ajax({
                    url: "productList.dox",
                    dataType: "json",
                    type: "POST",
                    data: [],
                    success: (data) => {
                    console.log(data);
                    self.products = data.list;
                    },
                });
            }
        },
        mounted() {
            this.fnClickCard();
        },
    });
    app.mount("#app");
</script>