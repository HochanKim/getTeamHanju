<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/cart/cartStyle.css" />
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
              <div class="userName">
                <div>이름</div>
                <div>{{ userInfo.name }}</div>
              </div>
              <div>
                <div class="주소">
                  <div>배송지</div>
                  <div>{{ userInfo.address }}</div>
                </div>
                <button @click="addrChange">주소 변경</button>
              </div>
              <div class="phone">
                <div>연락처</div>
                <div>{{ userInfo.phone }}</div>
              </div>
            </div>
            <div class="paymentInfo">
              <div>제품들</div>
              <span
                class="제품항목"
                v-for="(item, index) in cartNameList"
                :key="index"
                >{{ item }}</span
              >
              <div class="price">
                <div>원래가격</div>
                <div>{{ sumPrice }}</div>
              </div>
              <div class="discountPrice">
                <div>할인된 진짜 가격</div>
                <div>{{ discountPrice }}</div>
              </div>
              <div class="point">
                <div>보유 포인트</div>
                <div>{{ userInfo.point }}</div>
                <div>포인트 사용</div>
                <div>
                  <input v-model="usePoint" @input="fnPointInputCheck" />
                </div>
                <div>잔여 예상 포인트</div>
                <div>{{ parseInt(userInfo.point) - parseInt(usePoint) }}</div>
              </div>
              <div class="최종가격">
                <div>최종 가격</div>
                <div>{{ discountPrice - usePoint }}</div>
              </div>
            </div>
          </div>
          <div id="priceContainer">
            <div class="priceInfo">
              <div class="priceTitle">결제 예정 금액</div>
              <div class="priceEtc">
                <div class="noDiscount">
                  <div class="priceCol">상품 금액</div>
                  <div class="priceColl">
                    {{ parseInt(sumPrice).toLocaleString() }} 원
                  </div>
                </div>
                <div class="lastDiscountPrice">
                  <div class="priceCol">상품 할인 금액</div>
                  <div class="priceColl">
                    {{ parseInt(discountPrice).toLocaleString() }} 원
                  </div>
                </div>
              </div>

              <div class="lastPrice">
                <div>
                  {{
                    (
                      parseInt(discountPrice) - parseInt(usePoint)
                    ).toLocaleString()
                  }}원
                </div>
              </div>
            </div>
            <div class="paymentBtn">
              <button class="paymentButton" @click="fnPayment">결제하기</button>
            </div>
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
        sumPrice: "",
        discountPrice: "",
        userInfo: "",
        usePoint: "0",
        cartNameList: [],
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
        if(this.usePoint == ""){
          this.usePoint = '0';
        }
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
      fnInit() {
        const itemList = ${cartItem};
        const userId = "${userId}";
        if (itemList.length == 0) {
          alert("구매 상품이 없습니다.");
          window.history.back();
          return;
        }
        const userUrl = "/user/getUserInfo.dox";
        axios
          .get(userUrl, { params: { userId: userId } })
          .then(({ data }) => {
            const user = data.userInfo;
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
          })
          .catch((error) => {
            console.log("유저정보 받아오기 오류");
            console.log(error);
          });
        const url = "sumPrice.dox";
        axios
          .post(url, itemList)
          .then(({ data }) => {
            this.sumPrice = data.sum;
            this.discountPrice = data.discountSum;
          })
          .catch((error) => {
            alert("서버이상");
            console.log(error);
          });
        const nameUrl = "getCartName.dox";
        axios.post(nameUrl, itemList).then(({ data }) => {
          this.cartNameList = data.nameList;
        });
      },
      fnPayment() {
        const itemList = ${cartItem};
        axios
          .post("sumPrice.dox", itemList)
          .then(({ data }) => {
            const userId = this.userId;
            const sumPrice = data.sum;
            const discountPrice = data.discountSum;
            const point = this.usePoint;
            const realPrice = discountPrice - point;
            console.log(itemList);
            console.log(point);
            console.log(userId);
            if (realPrice == 0) {
              if (confirm("포인트로 결제하시겠습니까?")) {
                this.fnSuccessPayment(itemList, point, userId);
              }
              return;
            }
            const item = `\${this.cartNameList[0]} 외 \${this.cartNameList.length-1}품목`;
            requestPay(item, realPrice, () => {
              this.fnSuccessPayment(itemList, point, userId);
            });
          })
          .catch((error) => {
            alert("서버이상");
            console.log(error);
          });
      },
      async fnSuccessPayment(list, point, userId) {
        const submitForm = {
          list: list,
          userId: userId,
          point: point,
        };
        console.log(submitForm);
        const url = "cartPayment.dox";
        const res = await axios.post(url, submitForm);
        console.log(res.data);
        console.log("보내준 cartIdList : " + list);
        console.log("list.length : " + list.length);
        alert("결제완료");
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
    },
  });
  app.mount("#app");
</script>
