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
                      <input type="radio" name="star" id="r1" value="1" v-model="starRating">
                      <input type="radio" name="star" id="r2" value="2" v-model="starRating">
                      <input type="radio" name="star" id="r3" value="3" v-model="starRating">
                      <input type="radio" name="star" id="r4" value="4" v-model="starRating">
                      <input type="radio" name="star" id="r5" value="5" v-model="starRating">
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
                        <input type="file" id="imgFile" v-model="reviewPhoto" name="imgFile" @change="previewImage"> 
                        <span class="photoImgArea" onClick="document.querySelector('#imgFile').click();">
                          <img src="../../image/photo.png" class="photoImg"> 
                          <img v-if="thumbnail" :src="thumbnail" class="photoImg"> <!-- 썸네일 이미지 -->
                          <img v-else src="../../image/photo.png" class="photoImg"> <!-- 기본 아이콘 -->
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
            starRating: '0',
            selectBillId: "",
            reviewText: "",
            reviewPhoto: "",
            modalFilePath : "",
            modalProductName : "",
            thumbnail: null // 썸네일 URL을 저장할 변수
          };
        },
        methods: {
          modalOpen(billId, filePath, productName) {
            this.selectBillId = billId;
            this.modalCheck = !this.modalCheck

            var self = this;

            self.modalFilePath = filePath;
            self.modalProductName = productName;
            this.thumbnail = null; // 모달 열 때 썸네일 초기화
          },

          previewImage(event) {
      const file = event.target.files[0]; // 선택된 파일 가져오기
      if (file) {
        const reader = new FileReader(); // FileReader 객체 생성
        reader.onload = (e) => {
          this.thumbnail = e.target.result; // 썸네일 URL 설정
        };
        reader.readAsDataURL(file); // 파일을 Data URL로 읽기
      }
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
              reviewPhoto: self.reviewPhoto,
              starRating: self.starRating
            };

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