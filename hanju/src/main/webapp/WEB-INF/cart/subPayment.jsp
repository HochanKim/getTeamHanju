<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/mainCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/payment.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div class="유저 정보">
          <div class="이름">
            <div>이름</div>
            <div>{{ userInfo.name }}</div>
          </div>
          <div>
            <div class="주소">
              <div>배송지</div>
              <div>{{ userInfo.address }}</div>
            </div>
            <button @click="fnAddrChange">주소 변경</button>
          </div>

          <div class="연락처">
            <div>연락처</div>
            <div>{{ userInfo.phone }}</div>
          </div>
        </div>
        <div class="가격정보">
          <div class="구독 정보">
            <div>구독 상품 정보</div>
            <div class="imgBox">
              <img :src="subImg" />
            </div>
            <div>
              {{ subItem.title }}
            </div>
            <div>{{ discountPrice }} / 월</div>
            <div>배송 도착일 : 매주 {{ subItem.arriveDate }}</div>
          </div>
        </div>
        <div class="결제창">
          <div>구독 결제 정보</div>
          <div>정기 결제 금액 {{ discountPrice }}원/월</div>
          <button @click="fnPayment">결제하기</button>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        subId: "",
        userId: "",
        userInfo: {},
        usePoint: 0,
        discountPrice: 0,
        subImg: "",
        subItem: {},
        itemList: [],
      };
    },
    methods: {
      fnAddrChange() {},
      async fnSubInfo() {
        const url = "/details/getSubscribeItem.dox";
        const res = await axios(url, { params: { subId: this.subId } });
        for (let i = 0; i < res.data.subImgList.length; i++) {
          if (res.data.subImgList[i].fileStatus == "T") {
            this.subImg = res.data.subImgList[i].filePath;
          }
        }
        this.subItem = res.data.subItem;
        for (let i = 0; i < res.data.productList.length; i++) {
          this.itemList.push(res.data.productList[i].productId);
        }
        this.discountPrice =
          (res.data.subItem.price * (100 - res.data.subItem.discount)) / 100;
      },
      fnPayment() {
        const itemName = this.subItem.title;
        const itemPrice = this.discountPrice;
        const userId = this.userId;
        const subId = this.subId;
        requestPay(itemName, itemPrice, () => {
          this.fnSuccessPayment(subId, userId);
        });
      },
      fnSuccessPayment(subId, userId) {
        const url = "subPayment.dox";
        const submitForm = {
          userId: userId,
          subId: subId,
        };
        axios
          .post(url, submitForm)
          .then(({ data }) => {
            alert("구독 신청이 완료 되었습니다.");
            location.href = "/";
          })
          .catch((error) => {
            alert("뭔가 잘못됨.");
          });
      },
      async fnGetUserInfo() {
        const userUrl = "/user/getUserInfo.dox";
        const res = await axios.get(userUrl, {
          params: { userId: this.userId },
        });
        const user = res.data.userInfo;
        this.userInfo = {
          point: user.point,
          address: {
            roadNum: user.zipNo,
            road: user.roadAddrPart1,
            detail: user.addrDetail,
          },
          name: user.userName,
          phone: user.phone,
        };
        console.log(this.userInfo);
        console.log(this.subId);
      },
    },
    mounted() {
      if ("${subId}" == "") {
        alert("잘못된 요청 입니다.");
        location.href = "/productBoard/subscribeBoard.do";
      } else if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
      } else {
        this.subId = "${subId}";
        this.userId = "${userId}";
      }
      this.fnGetUserInfo();
      this.fnSubInfo();
    },
  });
  app.mount("#app");
</script>
