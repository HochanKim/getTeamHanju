<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/groupSell.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
        <div id="header">
            header
        </div>
        <div id="main">
            <div id="container">
                <h1 class="margin16">공동구매</h1>
                <br>
                <br>
                <div class="margin16">
                    함께 구입하면 더 저렴하게 마실 수 있어요!
                </div>
                <hr>

                <div id="sortBox">
                    <select>
                        <option>test</option>
                    </select>
                </div>
                <div id="cardView">
                    <div v-for="item in groupSellList" class="card">
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
                                <div>현재 목표 0 / {{item.targetAmount}}</div>
                                <div>종료일 {{item.endDate}}</div>
                            </div>
                            <div class="line3">
                                <div class="progressBar"></div>
                            </div>
                            <div class="line4">
                                <div>
                                    할인율 {{item.discount}}%
                                </div>
                                <div class="cell2">
                                    <div>
                                        원가 / 실거래가 <del>{{item.price}}</del> / {{item.price - (item.price / 100 * item.discount)}}
                                    </div>
                                    <div>
                                        <button class="joinBtn">참여하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            footer
        </div>
    </div>
</body>

</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                groupSellList : []
            };
        },
        methods: {
            fnGetList() {
                $.ajax({
					url:"getGroupSellList.dox",
					dataType:"json",	
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.groupSellList = data.list;
					}
				});
            }
        },
        mounted() {
            this.fnGetList();
        },
    });
    app.mount("#app");
</script>