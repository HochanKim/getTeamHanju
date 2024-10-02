<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/payment.css" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/payment.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="containerPayment">
        <h2 class="title">결제</h2>
        <div class="container">
          <div class="itemContainer">
            <div class="userInfo">
              <div class="boxHead"><h3>배송 정보</h3></div>
              <div class="infoBox2">
                <div class="userName">
                  <div class="uNameCol">받는분</div>
                  <div class="addrCol">{{ userInfo.name }}</div>
                  <div class="addrBtn"></div>
                </div>
                <div class="addr">
                  <div class="uNameCol">배송지</div>
                  <div class="addrCol">
                    [{{ userInfo.roadNum }}]{{ userInfo.road }}
                    {{ userInfo.detail }}
                  </div>
                  <div class="addrBtn">
                    <button class="addrButton" @click="addrChange">
                      주소 변경
                    </button>
                  </div>
                </div>
                <div class="phone">
                  <div class="uNameCol">연락처</div>
                  <div class="addrCol">{{ userInfo.phone }}</div>
                  <div class="addrBtn"></div>
                </div>
              </div>
            </div>
            <div class="paymentInfo">
              <div class="제품 이름">
                <div>제품이름</div>
                <div>{{ info.productName }}</div>
                <div>수량</div>
                <div>{{ cnt }}</div>
              </div>
              <div class="원래가격">
                <div>원래가격</div>
                <div>{{ sumPrice }}</div>
              </div>
              <div class="할인율">
                <div>할인율</div>
                <div>{{ dis }}%</div>
              </div>
              <div class="할인된 가격">
                <div>할인된 진짜 가격</div>
                <div>{{ discountPrice }}</div>
              </div>
              <div class="포인트">
                <div>보유 포인트</div>
                <div>{{ userInfo.point }}</div>
                <div>사용 포인트</div>
                <div>
                  <input v-model="usePoint" @input="fnPointInputCheck" />
                </div>
                <div>잔여 예상 포인트</div>
                <div>{{ userInfo.point - parseInt(usePoint) }}</div>
              </div>
              <div class="최종가격">
                <div>최종 가격</div>
                <div>{{ discountPrice - usePoint }}</div>
              </div>
            </div>
          </div>
          <div class="결제창">
            <div>{{ discountPrice - usePoint }}원</div>
            <button @click="fnPayment">결제하기</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        id: "${id}",
        cnt: "${cnt}",
        kind: "${kind}",
        dis: "${dis}",
        info: {},
        sumPrice: "",
        discountPrice: "",
        userInfo: "",
        usePoint: 0,
        userId: "",
      };
    },
    methods: {
      addrChange() {
        console.log(this.userId);
        console.log(this.userInfo.address);
      },
      fnPointInputCheck() {
        this.usePoint = this.usePoint.replace(/[^0-9]/g, "").replace(/^0+/, "");
        const price = parseInt(this.discountPrice);
        const use = parseInt(this.usePoint, 10);
        const full = parseInt(this.userInfo.point, 10);
        console.log(use > price);
        if (use > this.discountPrice) {
          this.usePoint = this.discountPrice;
          console.log(this.usePoint);
          console.log(use);
          console.log(this.discountPrice);
          return;
        }
        if (use > this.userInfo.point) {
          this.usePoint = this.userInfo.point;
        }
      },
      async fnInit() {
        const url = "productInfo.dox";
        const res = await axios.get(url, { params: { itemId: this.id } });
        const item = res.data.item;
        this.info = item;
        this.sumPrice = item.price * this.cnt;
        this.discountPrice = (this.sumPrice * (100 - this.dis)) / 100;
      },
      fnPayment() {
        const itemName = this.info.productName;
        const usePoint = parseInt(this.usePoint, 10);
        const realPrice = this.discountPrice - usePoint;
        requestPay(this.info.productName + `(\${this.cnt})`, realPrice, () => {
          this.fnSuccessPayment();
        });
      },
      async fnSuccessPayment() {
        const url = "directPayment.dox";
        const submitForm = {
          point: this.usePoint,
          userId: this.userId,
          count: this.cnt,
          productId: this.id,
          kind: "N",
        };
        const res = await axios.post(url, submitForm);
        if (res.data.status == "success") {
          ("결제가 완료 되었습니다.");
          location.href = "/user/orderInfo.do";
        }
      },
      async fnGetUserInfo() {
        const userUrl = "/user/getUserInfo.dox";
        const res = await axios.get(userUrl, {
          params: { userId: this.userId },
        });
        const user = res.data.userInfo;
        this.userInfo = {
          point: user.point,
          roadNum: user.zipNo,
          road: user.roadAddrPart1,
          detail: user.addrDetail,
          name: user.userName,
          phone: user.phone,
        };
        console.log(this.userInfo);
        console.log(this.subId);
      },
    },
    mounted() {
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      this.userId = "${userId}";
      this.fnInit();
      this.fnGetUserInfo();
    },
  });
  app.mount("#app");
</script>
