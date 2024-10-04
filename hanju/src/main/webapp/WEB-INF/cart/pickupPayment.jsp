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
    <jsp:include page="../mainPage/header.jsp" flush="false" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link
      href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div id="app">
      <div id="containerPayment">
        <h2 class="title">결제</h2>
        <div class="container">
          <div id="itemContainer">
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
                    <button class="addrButton" @click="addrChangeBtn">
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
              <div class="productItem">
                <div class="uNameCol">제품</div>
                <div class="pItem">{{ info.productName }} ({{ cnt }} ea)</div>
              </div>
            </div>
            <div class="pricePoint">
              <div class="discountPrice">
                <div class="uNameCol">총 상품 금액</div>
                <div class="pItem">
                  {{ parseInt(discountPrice).toLocaleString() }} 원
                </div>
              </div>
              <div class="point">
                <div class="uNameCol">보유 포인트</div>
                <div class="pItem">
                  {{ parseInt(userInfo.point).toLocaleString() }} Point
                </div>
              </div>
              <div class="point">
                <div class="uNameCol">포인트 사용</div>
                <div class="pItem">
                  <input
                    type="text"
                    v-model="usePoint"
                    @input="fnPointInputCheck"
                  />
                </div>
              </div>
              <div class="point">
                <div class="uNameCol">잔여 예상 포인트</div>
                <div class="pItem">
                  {{
                    (
                      parseInt(userInfo.point) - parseInt(usePoint)
                    ).toLocaleString()
                  }}
                  Point
                </div>
              </div>
              <div class="point">
                <div class="uNameCol">최종 가격</div>
                <div class="pItem">
                  {{ parseInt(discountPrice - usePoint).toLocaleString() }} 원
                </div>
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
                <div class="noDiscount">
                  <div class="priceCol">할인 금액</div>
                  <div class="priceColl">
                    {{
                      (
                        parseInt(sumPrice) - parseInt(discountPrice)
                      ).toLocaleString()
                    }}
                    원
                  </div>
                </div>
                <div class="lastDiscountPrice">
                  <div class="priceCol">사용 포인트</div>
                  <div class="priceColl">
                    {{ parseInt(usePoint).toLocaleString() }} 원
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
      <dialog ref="dialog">
        <h3>주소 변경</h3>
        <div class="zipDiv">
          <input
            class="zipNoInput"
            style="font-size: 14px"
            type="text"
            disabled
            v-model="changeAddr.first"
            :placeholder="userInfo.roadNum"
          />
          <div style="display: flex">
            <button class="zipBtn" @click="addrChange">우편 번호 찾기</button>
          </div>
        </div>
        <div class="zipDiv">
          <input
            style="font-size: 14px"
            class="roadInput"
            type="text"
            v-model="changeAddr.second"
            disabled
            :placeholder="userInfo.road"
          />
          <input
            style="font-size: 14px"
            class="kkdi"
            type="text"
            v-model="changeAddr.third"
            placeholder="상세 주소 입력"
          />
        </div>
        <div class="diBtn">
          <button @click="fnDbChange">주소 변경</button>
          <button
            style="background-color: rgb(255, 105, 105)"
            @click="closeDialog"
          >
            변경 취소
          </button>
        </div>
      </dialog>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        id: "${pId}",
        sId: "${sId}",
        date: "${date}",
        cnt: "${cnt}",
        kind: "${kind}",
        dis: "",
        info: {},
        sumPrice: "",
        discountPrice: "",
        userInfo: "",
        usePoint: 0,
        userId: "",
        changeAddr: {
          first: "",
          second: "",
          third: "",
        },
      };
    },
    methods: {
      addrChangeBtn() {
        this.$refs.dialog.showModal();
      },
      closeDialog() {
        this.$refs.dialog.close();
      },
      fnDbChange() {
        if (this.changeAddr.first == "") {
          alert("주소를 검색해주세요.");
          return;
        }
        if (this.changeAddr.third == "") {
          alert("상세주소를 입력해 주세요.");
          return;
        }
        const url = "changeAddr.dox";
        axios.post(url, this.changeAddr).then(() => {
          this.fnInit();
          this.changeAddr.first = "";
          this.changeAddr.second = "";
          this.changeAddr.third = "";
          this.$refs.dialog.close();
        });
      },
      addrChange() {
        new daum.Postcode({
          oncomplete: (data) => {
            let roadNum = "";
            let addr = "";
            let extraAddr = "";
            if (data.userSelectedType === "R") {
              addr = data.roadAddress;
            } else {
              addr = data.jibunAddress;
            }
            if (data.userSelectedType === "R") {
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? ", " + data.buildingName
                    : data.buildingName;
              }
              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }
            }
            roadNum = data.zonecode;
            addrFull = addr + extraAddr;
            this.changeAddr.first = roadNum;
            this.changeAddr.second = addrFull;
          },
        }).open();
      },
      fnPointInputCheck() {
        this.usePoint = this.usePoint.replace(/[^0-9]/g, "").replace(/^0+/, "");
        if (this.usePoint == "") {
          this.usePoint = "0";
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
      async fnInit() {
        const url = "productInfo.dox";
        const res = await axios.get(url, {
          params: { itemId: this.id },
        });
        const res2 = await axios.get("getDis.dox", {
          params: {
            pId: this.id,
            sId: this.sId,
          },
        });
        this.dis = res2.data.dis;
        console.log(this.dis);
        const item = res.data.item;
        this.info = item;
        this.sumPrice = item.price * this.cnt;
        this.discountPrice = (this.sumPrice * (100 - this.dis)) / 100;
      },
      fnPayment() {
        const itemName = this.info.productName;
        const usePoint = parseInt(this.usePoint, 10);
        const realPrice = this.discountPrice - usePoint;
        if (realPrice == 0) {
          if (confirm("포인트로 결제하시겠습니까?")) {
            this.fnSuccessPayment();
          }
          return;
        }
        requestPay(this.info.productName + `(\${this.cnt})`, realPrice, () => {
          this.fnSuccessPayment();
        });
      },
      async fnSuccessPayment() {
        const url = "directPickupPayment.dox";
        const submitForm = {
          point: this.usePoint,
          count: this.cnt,
          productId: this.id,
          date: this.date,
          kind: "P",
          sId: this.sId,
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
