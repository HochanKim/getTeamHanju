<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/sellerBillPage.css" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
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
                <h3>주문 내역</h3>
                <hr>
                <div v-for="item in billList" class="cardView">
                    <div class="imgBox">
                        <img :src="item.filePath">
                    </div>
                    <div class="content">
                        <table class="infoTable">
                            <tr>
                                <th>제품명</th>
                                <td>
                                    <span class="productName">{{item.productName}}</span>
                                </td>
                            </tr>
                            <tr>
                                <th>주문 개수</th>
                                <td>
                                    <span class="count">{{item.productCount}}</span>
                                    개
                                </td>
                            </tr>
                            <tr>
                                <th>주문자</th>
                                <td>{{item.userName}}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>{{item.phone}}</td>
                            </tr>
                            <tr>
                                <th>주문일</th>
                                <td>
                                    {{item.cDateTime}}
                                </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>
                                    <span class="productAddress">{{item.address}}</span>
                                </td>
                            </tr>
                        </table>
                        <div class="btnWrapper">
                            <div class="confirmBtn" @click="fnShipConfirm(item.billId)">배송 확인</div>
                            <div class="deleteBtn" @click="fnDeleteBill(item.billId)">주문 삭제</div>
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
                userstatus : "${sessionStatus}",

                billList : [],
            }
        },
        methods: {
            fnGetBillList() {
                $.ajax({
					url:"getBillList.dox",
					dataType:"json",
					type : "POST", 
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
                        this.billList = data.list;
					}
				});
            },
            fnShipConfirm(billId) {
                if (!confirm("배송 상태를 변경합니까?") ) {
                    return;
                }
                $.ajax({
					url:"shipConfirm.dox",
					dataType:"json",
					type : "POST", 
					data : { billId : billId },
					success : (data) => {
						console.log(data);
                        alert("배송 상태로 변경되었습니다!");
                        this.fnGetBillList();
					}
				});
            },
            fnDeleteBill(billId) {
                if (!confirm("주문을 삭제하시겠습니까?") ) {
                    return;
                }
                $.ajax({
					url:"deleteBill.dox",
					dataType:"json",
					type : "POST", 
					data : { billId : billId },
					success : (data) => {
						console.log(data);
                        alert("삭제되었습니다!");
                        this.fnGetBillList();
					}
				});
            }
        },
        mounted() {
            this.fnGetBillList();
        },
    });
    app.mount("#app");
</script>