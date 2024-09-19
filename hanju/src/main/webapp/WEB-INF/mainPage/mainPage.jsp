<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/mainCss.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>Document</title>
</head>
<body>
<div id="app">
    <header>
        <jsp:include page="header.jsp" flush="false" />
    </header>
    <div class="slider">
        <button @click="prevSlide" class="prevSlide">이전</button> 
        <button @click="nextSlide" class="nextSlide">다음</button> 
        <div class="slide" v-for="(image, index) in images" :key="index" v-show="currentSlide === index">
          <img :src="image" :alt="'이미지 ' + (index + 1)">
        </div>
    </div>
    <h4 style="text-align: center;">약주</h4>
    <div class="main-center">
        <div class="InLine">
            <img class="img" src="../../image/01_barrack.png">
            <div>
                병영소주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        
        </div>
        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>
    </div>

    <h4 style="text-align: center;">약주</h4>
    <div class="main-center">
        <div class="InLine">
            <img class="img" src="../../image/01_barrack.png">
            <div>
                병영소주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        
        </div>
        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>
    </div>

    <h4 style="text-align: center;">약주</h4>
    <div class="main-center">
        <div class="InLine">
            <img class="img" src="../../image/01_barrack.png">
            <div>
                병영소주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        
        </div>
        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>

        <div class="InLine">
            <img class="img" src="../../image/02_beobju.jpg">
            <div>
                교동법주
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="bottom.jsp" flush="false" />
    </footer>
   
</div>

<script>
const app = Vue.createApp({
    data() {
        return {
            currentSlide: 0,
            images: ['/upload/1.JPG', '/upload/2.JPG', '/upload/3.JPG']
        };
    },
    methods: {
        nextSlide() {
            this.currentSlide = (this.currentSlide + 1) % this.images.length;
        },
        prevSlide() {
            this.currentSlide = (this.currentSlide - 1 + this.images.length) % this.images.length;
        },
        fnTest() {
        }
    },
    mounted() {
        setInterval(this.nextSlide, 3000); // 3초마다 자동 슬라이드
    }
});
app.mount("#app");
</script>
</body>
</html>
