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
                        {{groupSellInfo.productName}}
                        <hr>
                    </div>
                    <div class="line2">
                        {{groupSellInfo.description}}
                    </div>
                    <div class="line3">
                        <div class="info1">
                            <div>
                                현재/목표 {{groupSellInfo.currentAmount}} / {{groupSellInfo.targetAmount}}
                            </div>
                            <div>
                                종료일 {{groupSellInfo.endDate}}
                            </div>
                        </div>
                        <div class="progressBar">
                            <div class="progress" :style="groupSellInfo.progress"></div>
                        </div>
                        <div class="info2">
                            <div>
                                할인율 {{groupSellInfo.discount}}%
                            </div>
                            <div>
                                원가 / 공구가 <del>{{groupSellInfo.price}}</del> / {{groupSellInfo.price - (groupSellInfo.price / 100 * groupSellInfo.discount)}}
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
                <div>제품 리뷰 ({{totalReview}})</div>
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
                <div>제품 리뷰 ({{totalReview}})</div>
            </div>
            <hr>
            <div id="review">
                <div v-for="item in reviewList" class="reviewItem">
                    <div class="title">
                        <div>
                            {{item.userName}} 님
                        </div>
                        <div class="rightSide">
                            <div      v-if="item.grade == 1">★☆☆☆☆</div>
                            <div v-else-if="item.grade == 2">★★☆☆☆</div>
                            <div v-else-if="item.grade == 3">★★★☆☆</div>
                            <div v-else-if="item.grade == 4">★★★★☆</div>
                            <div v-else-if="item.grade == 5">★★★★★</div>
                            <div class="cDateTime">{{item.cDateTime}}</div> 
                        </div>
                    </div>
                    <div class="content">
                        <div class="imageView">
                            <div class="testImg">
                                img
                            </div>
                        </div>
                        <div class="reviewContent">
                            {{item.content}}
                        </div>
                    </div>
                </div>
                <div id="pagination">
                    <div class="pageBtn" @click="fnClickPage(currentPage-1)">이전</div>
                    <div v-for="index in totalPage" class="pageBtn" @click="fnClickPage(index)">{{ index }}</div>
                    <div class="pageBtn" @click="fnClickPage(currentPage+1)">다음</div>
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
                groupSellId : '${groupSellId}',
                groupSellInfo : {},
                reviewList : [],
                totalPage : 0,
                totalReview : 0,
                currentPage : 1,
                pageSize : 5
            };
        },
        methods: {
            fnGetGroupSellInfo() {
                $.ajax({
					url:"getGroupSellInfo.dox",
					dataType:"json",	
					type : "POST", 
					data : {
                        groupSellId : this.groupSellId
                    },
					success : (data) => {
						console.log(data);
                        this.groupSellInfo = data.result;
                        this.fnSetProgressBar();
					}
				});
            },
            fnSetProgressBar() {
                var percent = Math.round(this.groupSellInfo.currentAmount / this.groupSellInfo.targetAmount * 100);
                this.groupSellInfo.progress = "width:" + percent + "%";
            },
            fnGetReview(start, size) {
                $.ajax({
					url:"getReview.dox",
					dataType:"json",	
					type : "POST", 
					data : {
                        groupSellId : this.groupSellId,
                        start : start,
                        size : size
                    },
					success : (data) => {
						console.log(data);
                        this.reviewList = data.list;
					}
				});
            },
            fnGetTotalReviewCount() {
                $.ajax({
					url:"getTotalReviewCount.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        groupSellId : this.groupSellId
                    },
					success : (data) => {
						console.log(data);
                        this.totalReview = data.count;
                        this.totalPage = Math.ceil(this.totalReview / this.pageSize);
					}
				});
            },
            fnClickPage(index) {
                if (index < 0) return;
                if (index > this.totalPage) return;

                this.currentPage = index;

                var start = (this.currentPage - 1) * this.pageSize;
                var size  = this.pageSize;
                this.fnGetReview(start, size);
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
            this.fnGetGroupSellInfo();
            this.fnGetReview(0, this.pageSize);
            this.fnGetTotalReviewCount();
        },
    });
    app.mount("#app");
</script>