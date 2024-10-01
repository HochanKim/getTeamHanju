<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/cart/cartStyle.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>cart</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
      <div id="containerCart">
        <h2 class="title">장바구니</h2>
        <div class="container">
          <div id="itemContainer">
            <div class="empty" v-if="emptyPage">
              장바구니에 담긴 상품이 없습니다.
            </div>
            <div class="flex-column pd-0 cartBox" v-if="normal.length>0">
              <div class="boxHead">일반 구매 상품</div>
              <div class="itemBox" v-for="(item, index) in normal" :key="index">
                <button class="deleteBtn" @click="fnCartDelete(item.cartId)">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <title>close</title>
                    <path
                      class="close"
                      d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"
                    />
                  </svg>
                </button>
                <div class="itemCheck">
                  <input
                    type="checkbox"
                    :value="item.cartId"
                    v-model="selectItem"
                  />
                </div>
                <div class="ImageBox">
                  <img :src="item.filePath" />
                </div>
                <div class="infoBox">
                  <div>{{ item.productName }}</div>
                </div>
                <div class="countBox">
                  <div class="itemCount">
                    <button
                      class="countBtn minus"
                      @click="fnPickupCountChange('minus',item.cartId,item.productCount)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                      >
                        <title>minus</title>
                        <path d="M19,13H5V11H19V13Z" />
                      </svg>
                    </button>
                    <div class="countNum">
                      {{ item.productCount.toLocaleString() }}
                    </div>
                    <button
                      class="countBtn plus"
                      @click="fnPickupCountChange('plus',item.cartId,item.productCount)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                      >
                        <title>plus</title>
                        <path d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                      </svg>
                    </button>
                  </div>
                </div>
                <div class="priceBox">
                  <div :class="item.discount != 0?'price':'discountPrice'">
                    {{ (item.price * item.productCount).toLocaleString() }}원
                  </div>
                  <div v-if="item.discount != 0" class="discount">
                    {{ item.discount }}%
                  </div>
                  <div class="discountPrice" v-if="item.discount != 0">
                    {{
                      Math.floor(
                        ((item.price *
                          item.productCount *
                          (1 - item.discount / 100)) /
                          10) *
                          10
                      ).toLocaleString()
                    }}원
                  </div>
                </div>
              </div>
            </div>
            <div class="flex-column pd-0 cartBox" v-if="pickup.length>0">
              <div class="boxHead">픽업 구매 상품</div>
              <div class="itemBox" v-for="(item, index) in pickup" :key="index">
                <button class="deleteBtn" @click="fnCartDelete(item.cartId)">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <title>close</title>
                    <path
                      class="close"
                      d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"
                    />
                  </svg>
                </button>
                <div class="itemCheck">
                  <input
                    type="checkbox"
                    :value="item.cartId"
                    v-model="selectItem"
                  />
                </div>
                <div class="ImageBox">
                  <img :src="item.filePath" />
                </div>
                <div class="infoBox">
                  <div>{{ item.productName }}</div>
                </div>
                <div class="countBox">
                  <div class="itemCount">
                    <button
                      class="countBtn minus"
                      @click="fnPickupCountChange('minus',item.cartId,item.productCount)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                      >
                        <title>minus</title>
                        <path d="M19,13H5V11H19V13Z" />
                      </svg>
                    </button>
                    <div class="countNum">{{ item.productCount }}</div>
                    <button
                      class="countBtn plus"
                      @click="fnPickupCountChange('plus',item.cartId,item.productCount)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                      >
                        <title>plus</title>
                        <path d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                      </svg>
                    </button>
                  </div>
                </div>
                <div class="priceBox">
                  <div :class="item.discount != 0?'price':'discountPrice'">
                    {{ (item.price * item.productCount).toLocaleString() }}원
                  </div>
                  <div v-if="item.discount != 0" class="discount">
                    {{ item.discount }}%
                  </div>
                  <div class="discountPrice" v-if="item.discount != 0">
                    {{
                      (
                        Math.floor(
                          (item.price *
                            item.productCount *
                            (1 - item.discount / 100)) /
                            10
                        ) * 10
                      ).toLocaleString()
                    }}원
                  </div>
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
                    {{ sumPrice.toLocaleString() }} 원
                  </div>
                </div>
                <div class="lastDiscountPrice">
                  <div class="priceCol">상품 할인 금액</div>
                  <div class="priceColl">
                    {{ discount.toLocaleString() }} 원
                  </div>
                </div>
              </div>

              <div class="lastPrice">
                <div>{{ discountSum.toLocaleString() }}원</div>
              </div>
            </div>
            <div class="paymentBtn">
              <form action="cartPayment.do" method="post">
                <input type="hidden" name="cartItem" :value="selectItem" />
                <button type="submit" class="paymentButton">주문하기</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        normal: [],
        group: [],
        funding: [],
        pickup: [],
        pickupAllCheck: [],
        normalAllCheck: [],
        selectItem: [],
        sumPrice: 0,
        emptyPage: false,
        discountSum: 0,
        discount: 0,
      };
    },
    watch: {
      selectItem(newValue) {
        this.fnSumPrice();
      },
    },

    methods: {
      async fnCartDelete(id) {
        if (!confirm("장바구니에서 삭제하시겠습니까?")) {
          return;
        }
        const url = "cartItemDelete.dox";
        const res = await axios.post(url, { cartId: id });
        this.fnAllCartInit();
      },
      async fnPickupCountChange(value, id, cnt) {
        const url = "cartCountChange.dox";
        const submitForm = {
          value: value,
          cartId: id,
          count: cnt,
        };
        if (cnt == 1 && value == "minus") {
          alert("1이하로 줄일수 없습니다.");
          return;
        }
        const res = await axios.post(url, submitForm);
        if (res.data.status == "max") {
          alert("현재 매장이 보유한 최대 수량입니다.");
          return;
        }
        if (res.data.status == "error") {
          alert("뭔가 잘못됨");
          return;
        } else {
          this.fnViewCart();
          this.fnSumPrice();
        }
      },
      async fnSumPrice() {
        const url = "sumPrice.dox";
        const submitForm = this.selectItem;
        const { data } = await axios.post(url, submitForm);
        console.log(data);
        this.sumPrice = data.sum;
        this.discountSum = data.discountSum || 0;
        this.discount = data.sum - data.discountSum || 0;
      },
      async fnViewCart() {
        const url = "viewCart.dox";
        const res = await axios.get(url);
        console.log(res.data);
        if (res.data.status == "notLogin") {
          alert("로그인 해주세요.");
          location.href = "/user/login.do";
          return;
        }
        if (!res.data.status) {
          this.emptyPage = true;
        } else {
          this.emptyPage = false;
          this.normal = res.data.normal;
          this.pickup = res.data.pickup;
        }
      },
      fnCheckAll(value) {
        if (type === "normal") {
          this.selectItem = this.normalAllCheck
            ? this.normal.map((item) => item.cartId)
            : [];
        } else if (type === "pickup") {
          this.selectItem = this.pickupAllCheck
            ? this.pickup.map((item) => item.cartId)
            : [];
        }
      },
      async fnAllCartInit() {
        await this.fnViewCart();
        for (let i = 0; i < this.normal.length; i++) {
          this.selectItem.push(this.normal[i].cartId);
        }
        for (let i = 0; i < this.pickup.length; i++) {
          this.selectItem.push(this.pickup[i].cartId);
        }
        this.fnSumPrice();
      },
      goToPayment() {
        const url = "payment.do";
        const submitForm = {
          price: this.sumPrice,
          cartItem: this.selectItem,
        };
        axios
          .post(url, submitForm)
          .then((res) => {
            console.log(res.data);
          })
          .catch((error) => {
            alert("서버 이상.");
          });
      },
    },
    mounted() {
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      this.fnAllCartInit();
    },
  });
  app.mount("#app");
</script>
