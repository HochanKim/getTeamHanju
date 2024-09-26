<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/review.css"/>
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
                        <tr>
                            <td class="product">
                                <div class="reviewArea">
                                    <a href="" class="thum">
                                        <img>
                                    </a>
                                    <div class="text">
                                    <a href="" class=""></a>
                                    </div>
                                </div>
                            </td>
                            <td class="orderDate">
                                <div></div>
                            </td>
                            <td class="write">
                                <button class="writeBtn" @click="modalOpen">리뷰 작성</button>
                                <div class="modal-wrap" v-show="modalCheck">
                                    <div class="modal-container">
                                      <h1>리뷰작성</h1>
                                      <div class="productInfo">
                                        <span class="productName"></span>
                                        <div></div>
                                      </div>
                                      <ul>
                                        <li>
                                          <div>
                                            <span>상품은 어떠셨나요?</span>
                                            <div>
                                              <ul>
                                                <li><button>1점</button></li>
                                                <li><button>2점</button></li>
                                                <li><button>3점</button></li>
                                                <li><button>4점</button></li>
                                                <li><button>5점</button></li>
                                              </ul>
                                            </div>
                                          </div>
                                        </li>
                                        <li>
                                          <div>
                                            <div>
                                              <span>솔직한 상품 리뷰를 남겨주세요</span>
                                            </div>
                                            <div>
                                              <textarea></textarea>
                                            </div>
                                          </div>
                                        </li>
                                        <li>
                                          <div>
                                            <strong>포토</strong>
                                          </div>
                                          <div>
                                            <button><img src="../../image/photo.png"></button>
                                          </div>
                                        </li>
                                      </ul>
                                      <div class="modal-btn">
                                        <button @click="modalOpen">닫기</button>
                                        <button @click="modalOpen">리뷰 등록 하기</button>
                                      </div>
                                    </div>
                                  </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        modalCheck: false,
      };
    },
    methods: {
      modalOpen() {
      this.modalCheck = !this.modalCheck
  }
    },
    mounted() {},
  });
  app.mount("#app");
</script>