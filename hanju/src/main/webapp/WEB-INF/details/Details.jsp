<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/details.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
</head>
<body>
<div id="app">
    <div class="container">
        <div class="thumb">
            <div>
                <img :src="img.productImage" class="thumb-img">
            </div>
            <div class="thumb-content">
                <div>
                    <div class="font-size">{{info.productName}}</div>
                    <div>판매가격 :</div>
                    <div class="font-size">{{info.price}}원</div>
                </div>
            </div>
        </div>
        <div class="side-bar">
            <div>수량</div>
            <div class="row">
                <div>
                    <button v-on:click="decrease" class="q-control">-</button>
                </div>
                <div>
                    <input type="text" @input="inputNumber" :value="number">
                </div>
                <div>
                    <button v-on:click="increase" class="q-control">+</button>
                </div>
            </div>
            <div>총 상품가격</div>
            <div>{{sum()}}원</div>
            <div><button class="side-button">장바구니</button></div>
            <div><button class="side-button">바로 구매하기</button></div>
        </div>
        <div class="box" style="clear: both;">
            <div class="row">
                <div class="title">주종</div>
                <div class="box-content">주종 들어갈 곳~~~</div>
            </div>
            <div class="row">
                <div class="title">도수 </div>
                <div class="box-content">{{info.alcohol}}</div>
            </div>
            <div class="row">
                <div class="title">용량 </div>
                <div class="box-content">{{info.capacity}}ml</div>
            </div>
        </div>
       
        <div class="box">
            <div class="row">
                <div class="title">단맛</div>
                <div class="img-chart">
                    <div v-if="info.sweet == 0"><img src="../../image/chart0.png"></div>
                    <div v-if="info.sweet == 1"><img src="../../image/chart1.png"></div>
                    <div v-if="info.sweet == 2"><img src="../../image/chart2.png"></div>
                    <div v-if="info.sweet == 3"><img src="../../image/chart3.png"></div>
                    <div v-if="info.sweet == 4"><img src="../../image/chart4.png"></div>
                    <div v-if="info.sweet == 5"><img src="../../image/chart5.png"></div>
                </div>
            </div>
            <div class="row">
                <div class="title">산미</div>
                <div class="img-chart">
                    <div v-if="info.sour == 0"><img src="../../image/chart0.png"></div>
                    <div v-if="info.sour == 1"><img src="../../image/chart1.png"></div>
                    <div v-if="info.sour == 2"><img src="../../image/chart2.png"></div>
                    <div v-if="info.sour == 3"><img src="../../image/chart3.png"></div>
                    <div v-if="info.sour == 4"><img src="../../image/chart4.png"></div>
                    <div v-if="info.sour == 5"><img src="../../image/chart5.png"></div>
                </div>
            </div>
            <div class="row">
                <div class="title">씁쓸</div>
                <div class="img-chart">
                    <div v-if="info.bitter == 0"><img src="../../image/chart0.png"></div>
                    <div v-if="info.bitter == 1"><img src="../../image/chart1.png"></div>
                    <div v-if="info.bitter == 2"><img src="../../image/chart2.png"></div>
                    <div v-if="info.bitter == 3"><img src="../../image/chart3.png"></div>
                    <div v-if="info.bitter == 4"><img src="../../image/chart4.png"></div>
                    <div v-if="info.bitter == 5"><img src="../../image/chart5.png"></div>
                </div>
            </div>
            <div class="row">
                <div class="title">바디</div>
                <div class="img-chart">
                    <div v-if="info.body == 0"><img src="../../image/chart0.png"></div>
                    <div v-if="info.body == 1"><img src="../../image/chart1.png"></div>
                    <div v-if="info.body == 2"><img src="../../image/chart2.png"></div>
                    <div v-if="info.body == 3"><img src="../../image/chart3.png"></div>
                    <div v-if="info.body == 4"><img src="../../image/chart4.png"></div>
                    <div v-if="info.body == 5"><img src="../../image/chart5.png"></div>
                </div>
            </div>
            <div class="row">
                <div class="title">탄산</div>
                <div class="img-chart">
                    <div v-if="info.sparkling == 0"><img src="../../image/chart0.png"></div>
                    <div v-if="info.sparkling == 1"><img src="../../image/chart1.png"></div>
                    <div v-if="info.sparkling == 2"><img src="../../image/chart2.png"></div>
                    <div v-if="info.sparkling == 3"><img src="../../image/chart3.png"></div>
                    <div v-if="info.sparkling == 4"><img src="../../image/chart4.png"></div>
                    <div v-if="info.sparkling == 5"><img src="../../image/chart5.png"></div>
                </div>
            </div>
        </div>
        <div style="clear: both;">
            <img :src="img.detailImage" class="detail-img">
        </div>
    </div>
</div>
<script>
const app = Vue.createApp({
    data() {
        return {
            info: {},
            img: {},
            number: 1
        };
    },
    methods: {
        fnGetList() {
            var self = this;
            $.ajax({
                url: "details.dox",
                dataType: "json",
                type: "POST",
                success: function(data) {
                    self.info = data.info[0];
                    self.img = data.img;
                }
            });
        },
        inputNumber(event) {
            this.number = event.target.value;
        },
        decrease() {
            if (this.number > 1) {
                this.number--;
            }
        },
        increase() {
            this.number++;
        },
        sum() {
            return this.number * this.info.price;
        }
    },
    mounted() {
        this.fnGetList();
    },
    watch: {
        number(val) {
            const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z]/;
            if (reg.exec(val) !== null) {
                this.number = val.replace(/[^0-9]/g, '');
            }
        }
    }
});
app.mount("#app");
</script>
</body>
</html>
