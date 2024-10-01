<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/mainPage/mainPage.css" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>Document</title>
</head>
<body>
    <jsp:include page="header.jsp" flush="false" />
    <div id="app">
        <div id="imageSlider">
            <div class="sliderLeftBtn" @click="fnSlideBtnClick('left')">
                <img src="../../image/before.png">
            </div>
            <div class="sliderRightBtn" @click="fnSlideBtnClick('right')">
                <img src="../../image/next.png">
            </div>
            <div class="pageIndexer">{{currPage}} / {{totalPage}}</div>
            <div class="imgContainer" :style="sliderStyle">
                <img src="../../image/6.png">
                <img src="../../image/1.png">
                <img src="../../image/2.png">
                <img src="../../image/3.png">
                <img src="../../image/4.png">
                <img src="../../image/5.png">
                <img src="../../image/6.png">
                <img src="../../image/1.png">
            </div>
        </div>
        
        <div id="bestNormalSell">
            <div class="viewTitle">
                <img src="../../image/best.png">
                <div>
                    <h2>베스트셀러</h2>
                    <div class="comment">최근에 가장 많이 팔린 제품들이에요!</div>
                </div>
            </div>
            <div class="leftBtn" @click="fnBNSLBtnClick('left')">
                <img src="../../image/before.png">
            </div>
            <div class="rightBtn" @click="fnBNSLBtnClick('right')">
                <img src="../../image/next.png">
            </div>
            <div class="cardViewWrapper">
                <div class="cardViewContainer" :style="BNSL_sliderStyle">
                    <div v-for="item in bestNormalSellList" class="cardView" @click="fnGoDetailPage(item.sellId)">
                        <img :src="item.filePath">
                        <div class="infoWrapper">
                            <div class="productName">{{item.productName}}</div>
                            <div v-if="item.discount == 0">
                                <span class="productPrice">{{item.priceComma}}</span>
                                <span class="won">원</span>
                            </div>
                            <div v-else>
                                <span class="originPrice"><del>{{item.priceComma}}원</del></span>
                                <br>
                                <span class="discount">{{item.discount}} %</span>
                                <span class="productPrice">{{item.discountPrice}}</span>
                                <span class="won">원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="bestWine">
            <div class="viewTitle">
                <img src="../../image/wine.png">
                <div>
                    <h2>와인 픽업 베스트</h2>
                    <div class="comment">픽업의 귀찮음을 감수해도 좋을 만큼 맛있어요!</div>
                </div>
            </div>
            <div class="leftBtn" @click="fnBWL_BtnClick('left')">
                <img src="../../image/before.png">
            </div>
            <div class="rightBtn" @click="fnBWL_BtnClick('right')">
                <img src="../../image/next.png">
            </div>
            <div class="cardViewWrapper">
                <div class="cardViewContainer" :style="BWL_sliderStyle">
                    <div v-for="item in bestWineList" class="cardView" @click="fnGoWineDetailPage(item.productId)">
                        <img :src="item.filePath">
                        <div class="infoWrapper">
                            <div class="productName">{{item.productName}}</div>
                            <div>
                                <span class="productPrice">{{item.price}}</span>
                                <span class="won">원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="bestGroupSell">
            <div class="viewTitle">
                <img src="../../image/group.png">
                <div>
                    <h2>인기 공동구매</h2>
                    <div class="comment">많은 분들이 함께 구매하길 원해요!</div>
                </div>
            </div>
            <div class="leftBtn" @click="fnBGSL_BtnClick('left')">
                <img src="../../image/before.png">
            </div>
            <div class="rightBtn" @click="fnBGSL_BtnClick('right')">
                <img src="../../image/next.png">
            </div>
            <div class="cardViewWrapper">
                <div class="cardViewContainer" :style="BGSL_sliderStyle">
                    <div v-for="item in bestGroupSellList" class="cardView" @click="fnGoGroupSellDetailPage(item.groupSellId)">
                        <img :src="item.filePath">
                        <div class="infoWrapper">
                            <div class="productName">{{item.productName}}</div>
                            <div v-if="item.discount == 0">
                                <span class="productPrice">{{item.price}}</span>
                                <span class="won">원</span>
                            </div>
                            <div v-else>
                                <span class="originPrice"><del>{{item.price}}원</del></span>
                                <br>
                                <span class="discount">{{item.discount}}% </span>
                                <span class="productPrice">{{item.price - (item.price * item.discount / 100)}}</span>
                                <span class="won">원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="newReview">
            <div class="reviewTitle">
                <img src="../../image/megaphone.png">
                <div class="titleText">
                    <h2>한 주의 리뷰</h2>
                    <div>다른 회원님들은 어떤 술로 이번 주를 보냈을까요?</div>
                </div>
            </div>
            <div class="reviewLeftBtn" @click="fnNRL_BtnClick('left')">
                <img src="../../image/before.png">
            </div>
            <div class="reviewRightBtn" @click="fnNRL_BtnClick('right')">
                <img src="../../image/next.png">
            </div>
            <div class="NRL_cardViewWrapper">
                <div class="NRL_cardViewContainer" :style="NRL_sliderStyle">
                    <div v-for="item in newReviewList" class="NRL_cardView">
                        <img class="reviewThumbnail" :src="item.filePath">
                        <div v-if="item.grade == 0"><img class="star" src="../../image/grade0.png"></div>
                        <div v-else-if="item.grade == 1"><img class="star" src="../../image/grade1.png"></div>
                        <div v-else-if="item.grade == 2"><img class="star" src="../../image/grade2.png"></div>
                        <div v-else-if="item.grade == 3"><img class="star" src="../../image/grade3.png"></div>
                        <div v-else-if="item.grade == 4"><img class="star" src="../../image/grade4.png"></div>
                        <div v-else-if="item.grade == 5"><img class="star" src="../../image/grade5.png"></div>
                        <div class="reviewContent">{{item.content}}</div>
                        <div class="reviewUserName">
                            <img src="../../image/person_orange.png">
                            <div>{{item.userName}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" flush="false" />
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                moveTime : 500,
                currPage : 1,
                totalPage : 6,
                sliderStyle : "",

                bestNormalSellList : [],
                BNSL_currPage : 1,
                BNSL_totalPage : 7,
                BNSL_sliderStyle : "",

                bestWineList : [],
                BWL_currPage : 1,
                BWL_totalPage : 7,
                BWL_sliderStyle : "",

                bestGroupSellList : [],
                BGSL_currPage : 1,
                BGSL_totalPage : 7,
                BGSL_sliderStyle : "",

                newReviewList : [],
                NRL_currPage : 1,
                NRL_totalPage : 8,
                NRL_sliderStyle : "",
            };
        },
        methods: {
            fnSliderSetUp() {
                var xIndex = this.currPage * -100;
                this.sliderStyle = "transition: none; transform: translate(" + xIndex + "%, 0px)";
            },
            fnSlideBtnClick(direction) {
                if (direction == "left") this.currPage--;
                else         /* right */ this.currPage++;
                
                var xIndex = this.currPage * -100;
                this.sliderStyle = "transition: " + this.moveTime + "ms; transform: translate(" + xIndex + "%, 0px)";

                // 왼쪽 끝으로 넘어갈 시,
                if (this.currPage < 1) {
                    this.currPage = this.totalPage;
                    setTimeout(() => {
                        var xIndex = this.currPage * -100;
                        this.sliderStyle = "transition: none; transform: translate(" + xIndex + "%, 0px)";
                    }, this.moveTime);
                
                // 오른쪽 끝으로 넘어갈 시,
                } else if (this.currPage == this.totalPage + 1) {
                    this.currPage = 1;
                    setTimeout(() => {
                        var xIndex = this.currPage * -100;
                        this.sliderStyle = "transition: none; transform: translate(" + xIndex + "%, 0px)";
                    }, this.moveTime);
                }
            },
            fnGetBestNormalSellList() {
                $.ajax({
					url:"getBestNormalSellList.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.bestNormalSellList = data.list;
					}
				});
            },
            fnBNSLBtnClick(direction) {
                if (direction == "left") this.BNSL_currPage--;
                else         /* right */ this.BNSL_currPage++;
                
                if (this.BNSL_currPage > this.BNSL_totalPage) {
                    this.BNSL_currPage = this.BNSL_totalPage;
                    return;
                }
                if (this.BNSL_currPage < 1) {
                    this.BNSL_currPage = 1;
                    return;
                }

                var xIndex = (this.BNSL_currPage - 1) * -266;
                this.BNSL_sliderStyle = "transition: " + this.moveTime + "ms; transform: translate(" + xIndex + "px, 0px)"
            },
            fnGoDetailPage(id) {
                location.href = "/details/details.do?id=" + id;
            },
            fnGoWineDetailPage(id) {
                location.href = "/details/detailsPickup.do?id=" + id;
            },
            fnGoGroupSellDetailPage(id) {
                location.href = "/details/detailsGroup.do?id=" + id;
            },
            fnGetBestWineList() {
                $.ajax({
					url:"getBestWineList.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.bestWineList = data.list;
					}
				});
            },
            fnBWL_BtnClick(direction) {
                if (direction == "left") this.BWL_currPage--;
                else         /* right */ this.BWL_currPage++;
                
                if (this.BWL_currPage > this.BWL_totalPage) {
                    this.BWL_currPage = this.BWL_totalPage;
                    return;
                }
                if (this.BWL_currPage < 1) {
                    this.BWL_currPage = 1;
                    return;
                }

                var xIndex = (this.BWL_currPage - 1) * -266;
                this.BWL_sliderStyle = "transition: " + this.moveTime + "ms; transform: translate(" + xIndex + "px, 0px)"
            },
            fnGetBestGroupSell() {
                $.ajax({
					url:"getBestGroupSell.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.bestGroupSellList = data.list;
					}
				});
            },
            fnBGSL_BtnClick(direction) {
                if (direction == "left") this.BGSL_currPage--;
                else         /* right */ this.BGSL_currPage++;
                
                if (this.BGSL_currPage > this.BGSL_totalPage) {
                    this.BGSL_currPage = this.BGSL_totalPage;
                    return;
                }
                if (this.BGSL_currPage < 1) {
                    this.BGSL_currPage = 1;
                    return;
                }

                var xIndex = (this.BGSL_currPage - 1) * -266;
                this.BGSL_sliderStyle = "transition: " + this.moveTime + "ms; transform: translate(" + xIndex + "px, 0px)"
            },
            fnGetNewReview() {
                $.ajax({
					url:"getNewReview.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.newReviewList = data.list;
					}
				});
            },
            fnNRL_BtnClick(direction) {
                if (direction == "left") this.NRL_currPage--;
                else         /* right */ this.NRL_currPage++;
                
                if (this.NRL_currPage > this.NRL_totalPage) {
                    this.NRL_currPage = this.NRL_totalPage;
                    return;
                }
                if (this.NRL_currPage < 1) {
                    this.NRL_currPage = 1;
                    return;
                }

                var xIndex = (this.NRL_currPage - 1) * -266;
                this.NRL_sliderStyle = "transition: " + this.moveTime + "ms; transform: translate(" + xIndex + "px, 0px)"
            }
        },
        mounted() {
            this.fnSliderSetUp();
            this.fnGetBestNormalSellList();
            this.fnGetBestWineList();
            this.fnGetBestGroupSell();
            this.fnGetNewReview();

            setInterval(() => {
                this.fnSlideBtnClick("right");
            }, 5000);
        }
    });
    app.mount("#app");
    </script>
