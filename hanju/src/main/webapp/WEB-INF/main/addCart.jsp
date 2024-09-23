<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div>장바구니 담는 임시 페이지</div>
      <div>와인 종류를 담을때는 매장 보유수량 주의해서 담아야함</div>
      <div>상세페이지에서 장바구니 담는 페이지가 생기면 없어질 페이지</div>
      <div>
        <div>아이템 선택</div>
        <select v-model="product" @change="fnStockChange">
          <option :value="{productId:'select',stock:0,kind: 'Non'}" disabled>
            제품 선택
          </option>
          <option
            v-for="(item, index) in itemList"
            :key="index"
            :value="{productId:item.productId,stock:item.stock,kind:item.type}"
          >
            {{ item.productName }}
          </option>
        </select>
        <select
          v-model="store"
          @change="fnStockChange"
          v-if="product.kind=='W'"
        >
          <option :value="{storeId:'select',stock:0}" disabled>
            매장 선택
          </option>
          <option
            v-for="item in storeList"
            :value="{storeId:item.storeId,stock:item.stock}"
          >
            {{ item.storeName }}
          </option>
        </select>
      </div>
      <div>
        <div>구매자 선택</div>
        <select v-model="userId">
          <option value="select" disabled>구매자 선택</option>
          <option
            v-for="(item, index) in userList"
            :key="index"
            :value="item.userId"
          >
            {{ item.userName }}
          </option>
        </select>

        <select v-model="count">
          <option value="select" disabled>수량 선택</option>
          <option v-for="item in stock" :value="item">
            {{ item }}
          </option>
        </select>
        <select v-model="kind">
          <option value="select" disabled>구매 종류</option>
          <option v-for="item in kindList" :value="item.kind">
            {{ item.name }}
          </option>
        </select>
        <div><button @click="fnAddCart">장바구니 담기</button></div>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        kindList: [
          { kind: "P", name: "픽업구매" },
          { kind: "N", name: "일반구매" },
          { kind: "G", name: "공동구매" },
          { kind: "F", name: "펀딩구매" },
        ],
        storeList: [],
        pickupStock: 0,
        stock: 0,
        userList: [],
        itemList: [],
        product: { productId: "select", stock: 0, kind: "Non" },
        userId: "select",
        count: "select",
        kind: "select",
        store: { storeId: "select", stock: 0 },
      };
    },
    methods: {
      async fnAddCart() {
        const url = "/cart/addCart.dox";
        const submitForm = {
          userId: this.userId,
          productId: this.product.productId,
          productCount: this.count,
          kind: this.kind,
          storeId: this.store.storeId,
        };
        if (
          submitForm.userId == "select" &&
          submitForm.productCount == "select" &&
          submitForm.productId == "select" &&
          submitForm.kind == "select"
        ) {
          alert("빈 값 없이 입력바람");
          return;
        }
        const res = await axios.post(url, submitForm);
        const status = res.data.status;
        if (status == "newAddCart") {
          alert("장바구니에 추가되었습니다.");
        } else if (status == "outOfStock") {
          alert("재고가 부족합니다. 추가 가능한 개수:" + res.data.pStock);
        } else if (status == "oldAddCart") {
          alert("기존 장바구니 품목에 추가되었습니다.");
        } else {
          alert("오류입니다. 테스트 과정에서 봤다면 말해주세요.");
        }
      },
      async fnGetProductList() {
        const url = "productList.dox";
        const { data } = await axios.get(url);
        this.itemList = data.list;
      },
      async fnGetUserList() {
        const url = "/user/allUserList.dox";
        const { data } = await axios.get(url);
        this.userList = data.list;
      },
      async fnStockChange() {
        console.log(this.product.kind);
        if (this.product.kind != "W") {
          this.store = { storeId: "select", stock: 0 };
          this.stock = this.product.stock;
          this.count = "select";
          this.kind = "select";
        } else {
          this.stock = this.store.stock;
          this.count = "select";
          this.kind = "P";
          const url = "getItemStoreList.dox";
          const { data } = await axios.get(url, {
            params: { productId: this.product.productId },
          });
          this.storeList = data.list;
        }
      },
    },
    mounted() {
      this.fnGetProductList();
      this.fnGetUserList();
    },
  });
  app.mount("#app");
</script>
