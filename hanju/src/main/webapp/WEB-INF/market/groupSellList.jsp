<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>한주</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
        <div id="main">
            <div id="container">
                <h1 class="margin16">공동구매</h1>
                <div class="margin16">
                    함께 구입하면 더 저렴하게 마실 수 있어요!
                </div>
                <hr>
                <!-- 공동구매 데이터 목록 (카드형) -->
                <div id="cardView">
                    <div v-for="item in groupSellList" class="card" @click="fnClickProduct(item.groupSellId)">
                        <div class="area1">
                            <div class="img-wrap groupSellImage" >
                                <img :src="item.filePath" :alt="item.fileOrgName" /> 
                            </div>
                        </div>
                        <div class="area2">
                            <div class="line1">
                                <div class="title">{{item.productName}}</div>
                                <hr>
                            </div>
                            <div class="line2">
                                <div>현재 목표 {{item.currentAmount}} / {{item.targetAmount}}</div>
                                <div>종료일 : {{item.endDate}}</div>
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
                <!-- 페이징 버튼 -->
                <div id="pagination">
                    <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
                    <div v-for="index in totalPages" class="pageBtn" @click="fnClickPage(index)">{{ index }}</div>
                    <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
                </div>
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
                groupSellList : [], // 공동구매 데이터 리스트
                totalPages : 0,     // 페이지 첫 인덱스
                pageSize : 3,       // 한 페이지의 호출 리스트 개수
                currentPage : 1     // 페이지 첫 호출시 시작 페이지 번호 
            };
        },
        methods: {
            fnClickProduct(sellId){    // 공동구매 상세 페이지 이동
                location.href = `/details/details.do?id=\${sellId}`;
            },
            fnGetList(start, size) {   // 공동구매 데이터 리스트 불러오기
                $.ajax({
					url:"getGroupSellList.dox",
					dataType:"json",	
					type : "POST",
					data : {
                        start : start,
                        size : size
                    },
					success : (data) => {
                        this.groupSellList = data.list;
                        this.fnSetProgressBar();
					}
				});
            },
            fnSetProgressBar() {    // 공동구매 참여현황 바
                for (item of this.groupSellList) {
                    var percent = Math.round(item.currentAmount / item.targetAmount * 100);
                    item.progress = "width:" + percent + "%";
                }
            },
            fnGetTotalGroupSell() {     // 공동구매 페이징 메소드
                $.ajax({	
					url:"getTotalGroupSell.dox",
					dataType:"json",	
					type : "POST", 
					data : {},
					success : (data) => {
                        var totalGroupSell = data.number;
                        this.totalPages = Math.ceil(totalGroupSell / this.pageSize);
					}
				});
            },
            fnClickPage(index){    // 공동구매 페이지의 페이징 숫자 버튼
                if (index < 0) return;
                if (index > this.totalPages) return;

                this.currentPage = index;

                var start = (this.currentPage - 1) * this.pageSize;
                var size  = this.pageSize;
                this.fnGetList(start, size);
            }
        },
        mounted() {
            this.fnGetList(this.totalPages, this.pageSize);
            this.fnGetTotalGroupSell();
        },
    });
    app.mount("#app");
</script>