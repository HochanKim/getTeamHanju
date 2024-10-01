<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/sellerMain.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
        <div id="app">
            <div id="container">
                <h3>사업자 대시보드</h3>
                <hr>
                <div class="cardView">
                    <img src="../../image/package.png">
                    <div class="content">
                        <div class="title">등록한 제품 개수</div>
                        <div class="count">
                            {{productCount}}
                            <span class="unit">개</span>
                        </div>
                    </div>
                </div>
                <div class="cardView">
                    <img src="../../image/package.png">
                    <div class="content">
                        <div class="title">게시된 일반 판매 개수</div>
                        <div class="count">
                            {{normalSellCount}}
                            <span class="unit">개</span>
                        </div>
                    </div>
                </div>
                <div class="cardView">
                    <img src="../../image/package.png">
                    <div class="content">
                        <div class="title">게시된 공동구매 개수</div>
                        <div class="count">
                            {{groupSellCount}}
                            <span class="unit">개</span>
                        </div>
                    </div>
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
                userId : "${sessionId}",
                userStatus : "${sessionStatus}",

                productCount : 0,
                normalSellCount : 0,
                groupSellCount : 0
            };
        },
        methods: {
            fnGetSellerMainInfo() {
                $.ajax({
					url:"getSellerMainInfo.dox",
					dataType:"json",
					type : "POST", 
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
					}
				});
            }
        },
        mounted() {

        },
    });
    app.mount("#app");
</script>