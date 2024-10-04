<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/details.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/axios.min.js"></script>
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>

  <body>
    <div id="app">
      <div class="main-container">

        <div class="detail-container">
          <div class="container">
            <div class="thumb">
              <div class="image-container">
                <img :src="img.productImage[currentImageIndex]" class="thumb-img" />
                <div class="dots">
                  <span v-for="(image, index) in img.productImage" :key="index" class="dot"
                    :class="{ active: currentImageIndex === index }" @click="setCurrentImage(index)"></span>
                </div>
              </div>
              <div class="thumb-content">
                <div>
                  <div class="pad2">{{ info.description }}</div>
                  <div class="font-size">{{ info.productName }}</div>
                  <div class="pad2">판매가격 :</div>
                  <div class="font-size2"> 원가 / 공구가 <br><del>{{parseInt(info.price).toLocaleString()}}</del> / {{parseInt(info.price - (info.price / 100 * info.discount)).toLocaleString()}}</div>
                  
                </div>
              </div>
            </div>
            <div class="box-container">
              <div class="box" style="clear: both">
                <div class="row">
                  <div class="title">주종</div>
                  <div class="box-content">{{ info.codeName }}</div>
                </div>
                <div class="row">
                  <div class="title">도수</div>
                  <div class="box-content">{{ info.alcohol }}%</div>
                </div>
                <div class="row">
                  <div class="title">용량</div>
                  <div class="box-content">{{ info.capacity }}ml</div>
                </div>
                <div class="row">
                  <div class="title">생산지</div>
                  <div class="box-content">{{ info.madeBy }}</div>
                </div>
                <div class="row">
                  <div class="title">주재료</div>
                  <div class="box-content">{{ info.material }}</div>
                </div>
              </div>

              <div class="box2">
                <div class="row">
                  <div class="title">단맛</div>
                  <div class="img-chart">
                    <div v-if="info.sweet == 0">
                      <img src="../../image/chart0.png" />
                    </div>
                    <div v-if="info.sweet == 1">
                      <img src="../../image/chart1.png" />
                    </div>
                    <div v-if="info.sweet == 2">
                      <img src="../../image/chart2.png" />
                    </div>
                    <div v-if="info.sweet == 3">
                      <img src="../../image/chart3.png" />
                    </div>
                    <div v-if="info.sweet == 4">
                      <img src="../../image/chart4.png" />
                    </div>
                    <div v-if="info.sweet == 5">
                      <img src="../../image/chart5.png" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="title">산미</div>
                  <div class="img-chart">
                    <div v-if="info.sour == 0">
                      <img src="../../image/chart0.png" />
                    </div>
                    <div v-if="info.sour == 1">
                      <img src="../../image/chart1.png" />
                    </div>
                    <div v-if="info.sour == 2">
                      <img src="../../image/chart2.png" />
                    </div>
                    <div v-if="info.sour == 3">
                      <img src="../../image/chart3.png" />
                    </div>
                    <div v-if="info.sour == 4">
                      <img src="../../image/chart4.png" />
                    </div>
                    <div v-if="info.sour == 5">
                      <img src="../../image/chart5.png" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="title">씁쓸</div>
                  <div class="img-chart">
                    <div v-if="info.bitter == 0">
                      <img src="../../image/chart0.png" />
                    </div>
                    <div v-if="info.bitter == 1">
                      <img src="../../image/chart1.png" />
                    </div>
                    <div v-if="info.bitter == 2">
                      <img src="../../image/chart2.png" />
                    </div>
                    <div v-if="info.bitter == 3">
                      <img src="../../image/chart3.png" />
                    </div>
                    <div v-if="info.bitter == 4">
                      <img src="../../image/chart4.png" />
                    </div>
                    <div v-if="info.bitter == 5">
                      <img src="../../image/chart5.png" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="title">바디</div>
                  <div class="img-chart">
                    <div v-if="info.body == 0">
                      <img src="../../image/chart0.png" />
                    </div>
                    <div v-if="info.body == 1">
                      <img src="../../image/chart1.png" />
                    </div>
                    <div v-if="info.body == 2">
                      <img src="../../image/chart2.png" />
                    </div>
                    <div v-if="info.body == 3">
                      <img src="../../image/chart3.png" />
                    </div>
                    <div v-if="info.body == 4">
                      <img src="../../image/chart4.png" />
                    </div>
                    <div v-if="info.body == 5">
                      <img src="../../image/chart5.png" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="title">탄산</div>
                  <div class="img-chart">
                    <div v-if="info.sparkling == 0">
                      <img src="../../image/chart0.png" />
                    </div>
                    <div v-if="info.sparkling == 1">
                      <img src="../../image/chart1.png" />
                    </div>
                    <div v-if="info.sparkling == 2">
                      <img src="../../image/chart2.png" />
                    </div>
                    <div v-if="info.sparkling == 3">
                      <img src="../../image/chart3.png" />
                    </div>
                    <div v-if="info.sparkling == 4">
                      <img src="../../image/chart4.png" />
                    </div>
                    <div v-if="info.sparkling == 5">
                      <img src="../../image/chart5.png" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div style="clear: both">
              <img :src="img.detailImage" class="detail-img" />
            </div>

            <!-- 리뷰 -->
            <div>
              <div v-for="list in comment">
                <div class="review-box">
                  <div class="review-name">{{ list.userName }}</div>
                  <div style="
                  display: flex;
                  justify-content: flex-end;
                  margin-right: 10px;
                ">
                    <div class="review">{{ info.productName }}</div>
                    <div class="img-grade review">
                      <div v-if="list.grade == 0">
                        <img src="../../image/grade0.png" />
                      </div>
                      <div v-if="list.grade == 1">
                        <img src="../../image/grade1.png" />
                      </div>
                      <div v-if="list.grade == 2">
                        <img src="../../image/grade2.png" />
                      </div>
                      <div v-if="list.grade == 3">
                        <img src="../../image/grade3.png" />
                      </div>
                      <div v-if="list.grade == 4">
                        <img src="../../image/grade4.png" />
                      </div>
                      <div v-if="list.grade == 5">
                        <img src="../../image/grade5.png" />
                      </div>
                    </div>
                    <div>{{ list.cDateTime }}</div>
                  </div>
                </div>
                <div class="review-box4">
                  <div class="review-box2">{{ list.content }}</div>
                  <div class="review-box3">
                    <img :src="list.filePath" class="review-img" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="side-bar-container">
          <div class="side-bar">
            <div class="font-size2">수량</div>
            <div class="row pad">
              <div>
                <button @click="decrease" class="q-control font-size2">-</button>
              </div>
              <div>
                <input type="text" class="input-box font-size2" @input="inputNumber" v-model="cnt" />
              </div>
              <div>
                <button @click="increase" class="q-control font-size2">+</button>
              </div>
            </div>

            <div class="line3">
              <div class="info1">
                <div>
                  현재/목표 <br> {{cntGroup.currentAmount}} / {{info.targetAmount}}
                </div>
                <div class="progressBarWrapper">
                  <div class="progressBar">
                    <div class="progress" :style="groupSellInfo.progress"></div>
                  </div>
                </div>
                <br>
                <br>
                <div>
                  종료일 {{info.endDate}}
                </div>
                <br>
              </div>
              <div class="info2">
                <div>
                  할인율 {{info.discount}}%
                </div>
                <br>
                <div>
                  원가 / 공구가 <br>
                  <del>{{parseInt(info.price).toLocaleString()}}</del> / {{parseInt(info.price - (info.price / 100 * info.discount)).toLocaleString()}}
                </div>
              </div>
            </div>

            <div class="pad font-size2">총 상품가격</div>
            <div class="font-size2">{{parseInt(sum()).toLocaleString()}}원</div>
            <div>
              <button class="side-button font-size2" @click="fnJoin">공동구매 참여하기</button>
            </div>
          </div>

        </div>
      </div>
      <jsp:include page="../mainPage/footer.jsp" flush="false" />
      <!-- 토스트 메시지 요소 추가 -->
      <div id="login_message">로그인을 해주세요!</div>
      <div id="jago_message">재고가 부족합니다. 재고 : {{ pStock }}</div>
    </div>

    <script>
      const app = Vue.createApp({
        data() {
          return {
            info: {},
            img: {},
            number: 1,
            userId: "",
            cnt: 1,
            pStock: "",
            comment: [],
            groupId: "",
            contents: "",
            pickupId: "",
            group: "",
            sellId: "",
            cntGroup: "",
            img: { productImage: [] },
            currentImageIndex: 0,
            groupSellInfo: {
              currentAmount: 0, // 초기값 설정
              targetAmount: 0,  // 초기값 설정
              progress: "width: 0%", // 초기값 설정
            },
          };
        },
        methods: {
          fnGetList() {
            var self = this;
            const submitForm = {
              groupId: this.groupId,
              pickupId: "",
              sellId: "",
            };
            console.log(submitForm);
            $.ajax({
              url: "detailsGroup.dox",
              dataType: "json",
              type: "POST",
              data: submitForm,
              success: function (data) {
                self.info = data.group[0];
                self.cntGroup = data.cntGroup[0];
                console.log(self.cntGroup);
                self.img = data.img;;
                self.comment = data.comment;
                self.fnSetProgressBar();
              },
            });
          },
          fnSetProgressBar() {
            const percent = Math.round((this.cntGroup.currentAmount / this.info.targetAmount) * 100);
            this.groupSellInfo.progress = "width: " + percent + "%";
          },
          nextImage() {
            if (this.currentImageIndex < this.img.productImage.length - 1) {
              this.currentImageIndex++;
            } else {
              this.currentImageIndex = 0; // 처음으로 돌아가기
            }
          },
          prevImage() {
            if (this.currentImageIndex > 0) {
              this.currentImageIndex--;
            } else {
              this.currentImageIndex = this.img.productImage.length - 1; // 마지막으로 돌아가기
            }
          },
          setCurrentImage(index) {
            this.currentImageIndex = index;
          },
          inputNumber(event) {
            this.number = event.target.value;
          },
          decrease() {
            if (this.cnt > 1) {
              this.cnt--;
            }
          },
          increase() {
            this.cnt++;
          },
          sum() {
            return this.cnt * (this.info.price - (this.info.price / 100 * this.info.discount))
          },
          fnJoin() {
            if (this.userId == "") {
              const tostMessage = document.getElementById("login_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
              return;
            }
            const isAdult = confirm("공동구매 참여하시겠습니까?");
            if(isAdult==false){
              return;
            }
            $.ajax({
              url: "joinGroupSell.dox",
              dataType: "json",
              type: "POST",
              data: {
                groupId: this.groupId,
                userId: this.userId
              },
              success: (data) => {
                console.log(data);
                location.href = "/market/groupSellList.do";
              }
            });
          },
          async showToastMessage() {
            if (this.userId == "") {
              const tostMessage = document.getElementById("login_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
              return;
            }

            var self = this;
            const cart = {
              productId: self.info.productId,
              userId: self.userId,
              productCount: self.cnt,
              kind: "N",
            };
            const url = "/cart/addCart.dox";
            const res = await axios.post(url, cart);
            const susses = res.data;
            console.log(susses);
            if (
              susses.status == "newAddCart" ||
              susses.status == "oldAddCart"
            ) {
              const tostMessage = document.getElementById("tost_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
            } else if (susses.status == "outOfStock") {
              this.pStock = susses.pStock;
              const tostMessage = document.getElementById("jago_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
            } else {
              alert("서버 오류");
            }
          },
        },
        mounted() {
          this.userId = "${userId}";
          this.groupId = "${groupId}";
          console.log("그룹 아이디 " + this.groupId);
          this.fnGetList();
        },
        watch: {
          number(val) {
            const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z]/;
            if (reg.exec(val) !== null) {
              this.number = val.replace(/[^0-9]/g, "");
            }
          },
        },
      });
      app.mount("#app");
    </script>
  </body>

  </html>