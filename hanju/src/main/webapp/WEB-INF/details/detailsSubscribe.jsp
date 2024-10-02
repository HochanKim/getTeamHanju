<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/details.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>subscribe</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>

  <body>
    <div id="app">
      <div class="main-container">
        <div class="detail-container">
          <div class="thumb-content">
            <div class="container">
              <div class="thumb">
                <div class="image-container">
                  <img :src="productImage" class="thumb-img ">
                </div>
                <div class="thumb-content">
                  <div>
                    <div class="pad2">{{ subInfo.cDateTime }}, {{subInfo.arriveDate}} 배송</div>
                    <div class="font-size">{{ subInfo.title }}</div>
                    <div class="pad2">원가 / 판매가격</div>
                    <div class="font-size2">  <del>{{parseInt(subInfo.price).toLocaleString()}}</del> / {{parseInt(subInfo.price - (subInfo.price / 100 * subInfo.discount)).toLocaleString()}}원</div>
                  </div>
                </div>
              </div>
            </div>
            <br>
            <div style="clear: both">
              <img :src="detailImage" class="detail-img" />
            </div>
          </div>
          
        </div>
        <div class="side-bar-container">
          <div class="side-bar">
            <div class="pad font-size2">총 상품가격</div>
            <div class="font-size2">{{parseInt(subInfo.price - (subInfo.price / 100 * subInfo.discount)).toLocaleString()}}원</div>
            <div>
              <br>
              <div v-if="alreadyUser">이미 구독 중인 상품입니다.</div>
              <button v-if="!alreadyUser" @click="fnPayment" class="side-button font-size2">구독 신청하기</button>
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
          subscribeId: "",
          userId: "",
          subInfo: {},
          subItemList: [],
          subImage: [],
          alreadyUser: false,
          productImage: "",
          detailImage: ""
        };
      },
      methods: {
        async fnGetSubscribeItem() {
          console.log(this.subscribeId);
          console.log(this.userId);
          const url = "getSubscribeItem.dox";
          const res = await axios(url, { params: { subId: this.subscribeId } });
          this.subInfo = res.data.subItem;
          this.subItemList = res.data.productList;
          this.subImage = res.data.subImgList;
          for (let item of this.subImage) {
            if (item.fileStatus == "P") {
              this.productImage = item.filePath
            } else if (item.fileStatus == "D") {
              this.detailImage = item.filePath
            }
          }
          console.log(this.subInfo);
          console.log(this.subItemList);
          console.log(this.subImage);
        },
        
        async fnUserStatus() {
          const url = "userSubCheck.dox";
          const submitForm = {
            userId: this.userId,
            subId: this.subscribeId,
          };
          const res = await axios.get(url, { params: submitForm });
          console.log(res.data);
          console.log(this.alreadyUser);
          if (res.data.flg == 1) {
            this.alreadyUser = true;
          }
          console.log(this.alreadyUser);
        },
        fnPayment() {
          location.href = "/cart/subPayment.do?subId=" + this.subscribeId;
        },
      },
      mounted() {
        if ("${subscribeId}" == "") {
          alert("잘못된 요청입니다.");
          location.href = "/productBoard/subscribeBoard.do";
        }
        this.userId = "${userId}";
        this.subscribeId = "${subscribeId}";
        this.fnGetSubscribeItem();
        this.fnUserStatus();
      },
    });
    app.mount("#app");
  </script>