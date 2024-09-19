<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/groupSell/groupSellView.css" />
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
            <div id="summary">
                <div id="imageView">
                    <div id="imageBox">
                        image
                    </div>
                    <div id="imageNav">
                        <div class="circle"></div>
                        <div class="circle"></div>
                        <div class="circle"></div>
                    </div>
                </div>
                <div id="summaryContent">
                    <div class="line1">
                        제품명
                        <hr>
                    </div>
                    <div class="line2">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                    <div class="line3">
                        <div class="info1">
                            <div>
                                현재 / 목표 5 / 60
                            </div>
                            <div>
                                종료일 10월 1일
                            </div>
                        </div>
                        <div class="progressBar">
                            <div class="progress"></div>
                        </div>
                        <div class="info2">
                            <div>
                                할인율 20%
                            </div>
                            <div>
                                원가 / 실거래가 <del>10000</del> / 8000
                            </div>
                        </div>
                    </div>
                    <div class="line4">
                        <div class="joinBtn" @click="fnJoin">
                            참여하기
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div id="contentNav">
                <div>제품 설명</div>
                <div class="separator"> | </div>
                <div>제품 리뷰</div>
            </div>
            <hr>
            <div id="content">
                <div class="testImg">testImg</div>
                <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
                
                <div class="testImg">testImg</div>
                <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
            
                <div class="testImg">testImg</div>
                <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
            </div>
            <hr>
            <div id="reviewTitle">
                <div>제품 리뷰</div>
            </div>
            <hr>
            <div id="review">
                <div v-for="i in 5" class="reviewItem">
                    <div class="title">
                        <div>
                            하*수 님
                        </div>
                        <div>
                            ★★★★★ (5.0) 2024/09/18
                        </div>
                    </div>
                    <div class="content">
                        <div class="imageView">
                            <div class="testImg">
                                img
                            </div>
                        </div>
                        <div class="reviewContent">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
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
                groupSellId : '${groupSellId}'
            };
        },
        methods: {
            fnTest() {
                console.log(this.groupSellId);
            },
            fnJoin() {
                $.ajax({
					url:"joinGroupSell.dox",
					dataType:"json",	
					type : "POST", 
					data : {
                        groupSellId : this.groupSellId,
                        userId : "user1"
                    },
					success : (data) => {
						console.log(data);
                        location.href = "groupSell.do";
					}
				});
            }
        },
        mounted() {
            this.fnTest();
        },
    });
    app.mount("#app");
</script>