<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/details.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/axios.min.js"></script>
    <link
      href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
      rel="stylesheet"
    />
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
                <img
                  :src="img.productImage[currentImageIndex]"
                  class="thumb-img"
                />
                <div class="dots">
                  <span
                    v-for="(image, index) in img.productImage"
                    :key="index"
                    class="dot"
                    :class="{ active: currentImageIndex === index }"
                    @click="setCurrentImage(index)"
                  ></span>
                </div>
              </div>
              <div class="thumb-content">
                <div>
                  <div class="pad2">{{ info.description }}</div>

                  <div class="font-size">{{ info.productName }}</div>
                  <div class="favor">
                    <svg
                      @click="fnFav"
                      v-if="fav==1"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                    >
                      <title>heart</title>
                      <path
                        d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"
                      />
                    </svg>

                    <svg
                      @click="fnFav"
                      v-if="fav==-1"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                    >
                      <title>heart-outline</title>
                      <path
                        d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z"
                      />
                    </svg>
                  </div>
                  <div class="pad2">판매가격 :</div>
                  <div v-if="info.discount ==0">
                    <div class="font-size2">
                      {{ parseInt(info.price).toLocaleString() }}원
                    </div>
                  </div>
                  <div v-else> 
                  <div class="font-size2"> 
					<p>원가 / 할인가</p> 
					<p style="margin-top:10px;">
						<del>{{parseInt(info.price).toLocaleString()}}</del> /
						{{parseInt(info.price - (info.price / 100 * info.discount)).toLocaleString()}}
					</p>
				  </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="box-container">
              <div class="box" style="clear: both">
                <table>
                  <tr>
                    <td>
                      <div class="row2">
                        <div class="title">주종</div>
                      </div>
                    </td>
                    <td>
                      <div class="box-content">{{ info.codeName }}</div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="row2">
                        <div class="title">도수</div>
                      </div>
                    </td>
                    <td>
                      <div class="box-content">{{ info.alcohol }}%</div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="row2">
                        <div class="title">용량</div>
                      </div>
                    </td>
                    <td>
                      <div class="box-content">{{ info.capacity }}ml</div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="row2">
                        <div class="title">생산지</div>
                      </div>
                    </td>
                    <td>
                      <div class="box-content">{{ info.madeBy }}</div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="row2">
                        <div class="title">주재료</div>
                      </div>
                    </td>
                    <td>
                      <div class="box-content">{{ info.material }}</div>
                    </td>
                  </tr>
                </table>
              </div>

              <div class="box2">
                <div class="row" v-for="item in taste">
                  <div class="title">{{ item.name }}</div>
                  <div class="img-chart">
                    <div>
                      <img :src="item.image" />
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
                  <div
                    style="
                      display: flex;
                      justify-content: flex-end;
                      margin-right: 10px;
                    "
                  >
                    <div class="review">{{ info.productName }}</div>
                    <div class="img-grade review">
                      <div><img :src=`/image/grade\${list.grade}.png` /></div>
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
                <button
                  @click="cntChange('minus')"
                  class="q-control font-size2"
                >
                  -
                </button>
              </div>
              <div>
                <input
                  type="text"
                  class="input-box font-size2"
                  @input="inputNumber"
                  v-model="cnt"
                />
              </div>
              <div>
                <button @click="cntChange('plus')" class="q-control font-size2">
                  +
                </button>
              </div>
            </div>
            <div class="pad font-size2">총 상품가격</div>
            <div class="font-size2">
              {{ parseInt(sum()).toLocaleString() }}원
            </div>
            <div>
              <button @click="showToastMessage" class="side-button font-size2">
                장바구니
              </button>
            </div>
            <div>
              <button class="side-button font-size2" @click="fnPayment">
                바로 구매하기
              </button>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../mainPage/footer.jsp" flush="false" />
      <!-- 토스트 메시지 요소 추가 -->
      <div id="tost_message">장바구니에 추가되었습니다!</div>
      <div id="login_message">로그인을 해주세요!</div>
      <div id="defav">찜목록에서 삭제 되었습니다.</div>
      <div id="addfav">찜목록에 추가 되었습니다.</div>
      <div id="jago_message">재고가 부족합니다. 재고 : {{ pStock }}</div>
    </div>
    <script>
      const app = Vue.createApp({
        data() {
          return {
            taste: [],
            info: {},
            img: {},
            number: 1,
            userId: "",
            cnt: 1,
            pStock: "",
            comment: [],
            boardId: "",
            contents: "",
            pickupId: "",
            groupId: "",
            img: { productImage: [] },
            currentImageIndex: 0,
            fav: 0,
          };
        },
        methods: {
          fnFav() {
            let url;
            let tost;
            if (this.fav == 1) {
              url = "deleteFavorite.dox";
              tost = document.getElementById("defav");
            } else {
              url = "addFavorite.dox";
              tost = document.getElementById("addfav");
            }
            const subData = { id: this.info.productId };
            $.ajax({
              url: url,
              dataType: "json",
              type: "POST",
              data: subData,
              success: () => {
                this.fnGetList();
                tost.classList.add("active"); // 토스트 메시지 표시
                setTimeout(() => {
                  tost.classList.remove("active"); // 1초 후에 숨김
                }, 2000);
              },
            });
          },
          fnGetFav() {
            const url = "getFavorite.dox";
            const subData = { id: this.info.productId };
            $.ajax({
              url: url,
              dataType: "json",
              type: "POST",
              data: subData,
              success: (data) => {
                console.log(data);
                this.fav = data.res;
              },
            });
          },
          async fnGetList() {
            var self = this;
            const submitForm = {
              sellId: this.boardId,
              pickupId: "",
              groupId: "",
            };
            console.log(submitForm);
            await $.ajax({
              url: "details.dox",
              dataType: "json",
              type: "POST",
              data: submitForm,
              success: function (data) {
                const info = data.info[0];
                self.info = info;
                self.img = data.img;
                self.comment = data.comment;
                self.fnGetFav();
                self.taste = [
                  { name: "단맛", image: `/image/chart\${info.sweet}.png` },
                  { name: "산미", image: `/image/chart\${info.sour}.png` },
                  { name: "씁쓸", image: `/image/chart\${info.bitter}.png` },
                  { name: "바디", image: `/image/chart\${info.body}.png` },
                  { name: "탄산", image: `/image/chart\${info.sparkling}.png` },
                ];
              },
            });
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
            this.cnt = +this.cnt.replace(/[^0-9]/g, "").replace(/^0+/, 1);
            if (this.cnt == "") {
              this.cnt = 1;
            }
            this.number = event.target.value;
          },
          cntChange(value) {
            if (value == "minus" && this.cnt > 1) {
              this.cnt--;
            }
            if (value == "plus") {
              this.cnt++;
            }
          },
          sum() {
            var priceSum;
            if (this.info.discount == 0) {
              priceSum = this.info.price * this.cnt;
            } else {
              priceSum =
                (this.info.price -
                  (this.info.price / 100) * this.info.discount) *
                this.cnt;
            }
            return priceSum;
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
          fnPayment() {
            location.href = `/cart/directPayment.do?id=\${this.info.productId}&cnt=\${this.cnt}&kind=N&dis=\${this.info.discount}`;
          },
        },
        mounted() {
          this.userId = "${userId}";
          this.boardId = "${boardId}";
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
