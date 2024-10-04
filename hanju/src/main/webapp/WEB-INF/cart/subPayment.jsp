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
    <jsp:include page="../mainPage/header.jsp" flush="false" />
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
            <div class="subsInfo">
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
          </div>
          <div class="결제창">
            <div>구독 결제 정보</div>
            <div>정기 결제 금액 {{ discountPrice }}원/월</div>
            <button @click="fnPayment">결제하기</button>
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
        subId: "",
        userId: "",
        userInfo: {},
        usePoint: 0,
        discountPrice: 0,
        subImg: "",
        subItem: {},
        itemList: [],
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
