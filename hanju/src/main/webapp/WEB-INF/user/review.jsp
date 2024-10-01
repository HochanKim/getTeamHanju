<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/review.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div id="contents">
          <div id="tit">
            <h2>리뷰</h2>
          </div>
          <div id="inside">
            <div id="stateReview">
              <div class="ing">
                <a href="../user/review.do">작성 가능한 리뷰</a>
              </div>
              <div class="com">
                <a href="../user/reviewCom.do">작성한 리뷰</a>
              </div>
            </div>
            <table>
              <tr>
                <th>상품</th>
                <th>주문일자</th>
                <th>리뷰작성</th>
              </tr>
              <tr v-for="item in orderList">
                <td class="product">
                  <div class="reviewArea">
                    <a @click="fnDetailPage(item.sellId,item.kind)" class="thum"><img :src="item.filePath"></a>
                    <span class="reviewArea2">
                      <a @click="fnDetailPage(item.sellId,item.kind)" class="productName">{{item.productName}}</a>
                    </span>
                  </div>
                </td>
                <td class="cDateTime">
                  <div>{{item.cDateTime}}</div>
                </td>
                <td class="write">
                  <button class="writeBtn" @click="modalOpen(item.sellId, item.filePath, item.productName)">리뷰 작성</button>
                </td>
              </tr>
            </table>
            <div class="modal-wrap" v-show="modalCheck">
              <div class="modal-container">
                <h1>리뷰작성</h1>
                <div class="productInfo">
                  <p class="thum"><img :src="modalFilePath" class="insideImg"></p>
                  <span>
                    <p class="productName">{{modalProductName}}</p>
                  </span>
                </div>
                <div class="write">
                  <div id="rating">
                    <div class="how">상품은 어떠셨나요?</div>
                    <div class="star">
                      <input type="radio" name="star" id="r1" v-model="1">
                      <input type="radio" name="star" id="r2" v-model="2">
                      <input type="radio" name="star" id="r3" v-model="3">
                      <input type="radio" name="star" id="r4" v-model="4">
                      <input type="radio" name="star" id="r5" v-model="5">
                      <span class="star-box">
                        <label for="r1">별</label>
                        <label for="r2">별</label>
                        <label for="r3">별</label>
                        <label for="r4">별</label>
                        <label for="r5">별</label>
                      </span>
                    </div>
                  </div>
                  <div class="txtWrapper">
                    <span class="txt">솔직한 상품 리뷰를 남겨주세요</span>
                  </div>
                  <div class="txtArea">
                    <div class="txtInner">
                      <textarea placeholder="리뷰를 작성해 보세요" v-model="reviewText"></textarea>
                    </div>
                  </div>
                  <div id="photo">
                    <div class="photoTit">
                      <strong>포토</strong>
                    </div>
                    <div class="photoRegis">
                      <div class="inputPhoto">
                        <input type="file" id="imgFile" v-model="reviewPhoto">
                        <span class="photoImgArea" onClick="document.querySelector('#imgFile').click();">
                          <img src="../../image/photo.png" class="photoImg">
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-btn">
                    <button class="modalClose" @click="modalOpen">닫기</button>
                    <button class="reviewRegis" @click="fnReview">리뷰 등록 하기</button>
                  </div>
                </div>
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
            orderList: [],
            modalCheck: false,
            selectBillId: "",
            reviewText: "",
            reviewPhoto: "",
            modalFilePath : "",
            modalProductName : "",
          };
        },
        methods: {
          modalOpen(billId, filePath, productName) {
            this.selectBillId = billId;
            this.modalCheck = !this.modalCheck

            var self = this;

            self.modalFilePath = filePath;
            self.modalProductName = productName;
          },

          fnOrder() {
            var self = this;

            $.ajax({
              url: "getOrderList.dox",
              dataType: "json",
              type: "GET",

              success: function (data) {
                console.log(data);
                console.log(self.orderList);
                for (var item of data.orderList) {
                  if (item.isComment == "N") {
                    self.orderList.push(item);
                  }
                }
              }
            });
          },


          fnDetailPage(productId, kind) {
            if (kind == 'P') {
              location.href = `/details/detailsPickup.do?id=\${productId}`;
            } else if (kind == 'N') {
              location.href = `/details/details.do?id=\${productId}`;
            }
          },

          fnReview() {
            var self = this;
            
            var nparmap = {
              reviewText: self.reviewText,
              reviewPhoto: self.reviewPhoto
            };

            var star = document.getElementById("star").value;
            var i;
            for(i=0; i<5; i++){
              $("input:radio[id="+strArray[i] + "]").attr("checked", true);
            }

            $.ajax({
              url: "user/review.dox",
              dataType: "json",
              type: "POST",
              data: nparmap,
              success: function (data) {
                console.log(data);
                $.pageChange("review.do", {});

              }
            });

          },
          
        },
        mounted() {
          this.fnOrder();
        },
      });
      app.mount("#app");
    </script>