<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>한주</title>
  </head>
  <body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
      <section class="subscribeCont">
        <h1 class="margin16">구독 서비스</h1>
        <div v-for="(item, index) in subList" :key="index" class="subscribe">
          <div class="img-wrap subscribeImg">
            <img :src="item.filePath" />
          </div>
          <div class="subscribeInfo">
            <div class="subscribeTitle">{{ item.title }}</div>
            <div>혜택 : 한주 구독 서비스를 이용할 시 <span style="font-size:32px; margin-right:3px;">{{ item.discount }} %</span> 할인율 적용!</div>
            <div>정기 결제 : 매월 셋째주 {{ item.arriveDate }} 결제 후 2~3일뒤 배송 예정</div>
            <div>
              <del style="color:#999;">{{ item.priceComma }}</del>
              <span style="color: red; margin:0 7px 0 5px;">10%</span>
              <span style="font-size:32px;">{{ item.discountPrice }}</span>
            </div>
            <button @click="fnDetail(item.subscribeId)" class="subscribeReview">상세보기</button>
          </div>
        </div>
      </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        subList: [],
      };
    },
    methods: {
      async fnGetList() {
        const url = "getSubscribeList.dox";
        const res = await axios(url);
        this.subList = res.data.list;
        console.log(res.data);
      },
      fnDetail(id) {
        location.href = `/details/subscribe.do?id=\${id}`;
      },
    },
    mounted() {
      this.fnGetList();
    },
  });
  app.mount("#app");
</script>
