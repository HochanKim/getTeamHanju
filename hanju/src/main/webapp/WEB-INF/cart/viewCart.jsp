<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <link rel="stylesheet" href="/css/cartStyle.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>장바구니</title>
  </head>
  <body>
    <div id="app">
      <div id="container">
        <div id="itemContainer">
          <div class="empty" v-if="emptyPage">
            장바구니에 담긴 상품이 없습니다.
          </div>
          <div class="normal" v-if="normal.length>0">
            일반구매 있으면 이거 보여야함.
          </div>
          <div class="group" v-if="group.length>0">
            공동구매 있으면 이거 보여야함.
          </div>
          <div class="funding" v-if="funding.length>0">
            펀딩구매 있으면 이거 보여야함.
          </div>
          <div class="pickup" v-if="pickup.length>0">
            <div class="boxHead">
              <input type="checkbox" v-model="pickupAllCheck" /> 픽업구매
              전체선택
            </div>
            <div class="itemBox" v-for="(item, index) in pickup" :key="index">
              <button class="x" @click="fnCartDelete(item.cartId)">X</button>

              <div class="itemCheck">
                <input
                  type="checkbox"
                  :value="{count:item.productCount,price:item.price}"
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
                    @click="fnPickupCountChange('minus',item.storeId,item.productId,item.productCount)"
                  >
                    -
                  </button>
                  <div>{{ item.productCount }}</div>
                  <button
                    @click="fnPickupCountChange('plus',item.storeId,item.productId,item.productCount)"
                  >
                    +
                  </button>
                </div>
              </div>
              <div class="priceBox">{{ item.price }}원</div>
            </div>
          </div>
        </div>
        <div id="priceContainer">
          <div class="priceInfo">{{ sumPrice }} 원</div>
          <div class="paymentBtn"><button>결제하기</button></div>
        </div>
      </div>
    </div>
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
        pickupAllCheck: true,
        selectItem: [],
        sumPrice: 0,
        emptyPage: false,
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
        console.log(res.data);
      },
      async fnPickupCountChange(ha, store, id, cnt) {
        const url = "cartCountChange.dox";
        const submitForm = {
          value: ha,
          storeId: store,
          productId: id,
          count: cnt,
        };
        if (cnt == 1 && ha == "minus") {
          alert("1이하로 줄일수 없습니다.");
          return;
        }
        const res = await axios.post(url, submitForm);
        if (res.data.status == "max") {
          alert("현재 매장이 보유한 최대 수량입니다.");
          return;
        }
        if (res.data.status == "error") {
          alert("뭔가 잘못됨 에러처리 할것");
          return;
        } else {
          this.fnViewCart();
        }
      },
      fnSumPrice() {
        console.log(this.selectItem);
        let sum = 0;
        for (let select of this.selectItem) {
          console.log(select);
          sum += select.count * select.price;
        }
        this.sumPrice = sum;
      },
      async fnViewCart() {
        const url = "viewCart.dox";
        const res = await axios.get(url);
        console.log(res.data);
        if (!res.data.status) {
          this.emptyPage = true;
        } else {
          this.emptyPage = false;
          this.normal = res.data.normal;
          this.group = res.data.group;
          this.funding = res.data.funding;
          this.pickup = res.data.pickup;
        }
      },
    },
    mounted() {
      this.fnViewCart();
    },
  });
  app.mount("#app");
</script>
