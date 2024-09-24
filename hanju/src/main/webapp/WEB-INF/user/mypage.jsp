<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/mypage.css" />
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
        <div id="container">
            <div id="contents">
                <div class="myTit">
                    <h2>마이페이지</h2>
                </div>
                <div class="myOrder">
                    <div class="myState">
                        <ul class="orderState">
                            <li>
                                <strong>포인트</strong>
                                <a href="" class="count">
                                    <span>0</span>
                                </a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="" class="count">
                                    <span>0</span>
                                </a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="" class="count">
                                    <span>0</span>
                                </a>
                            </li>
                            <li class="arrive">
                                <strong>배송완료</strong>
                                <a href="" class="count">
                                    <span>0</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="myPage">
                    <ul>
                        <li>
                            <img src="../../image/calendar_month.png">
                            <a href="">
                                <strong>구독관리</strong>
                                <p>고객님께서 신청하신 정기배송의 신청 정보 및 내역을 확인하실 수 있습니다.</p>
                            </a>
                        </li>
                        <li>
                            <img src="../../image/review.png">
                            <a href="">
                                <strong>리뷰</strong>
                                <p>리뷰 작성시 포인트 적립을 해드립니다.</p>
                            </a>
                        </li>
                        <li>
                            <img src="../../image/profile.png">
                            <a href="../user/modifybefore.do">
                                <strong>회원정보</strong>
                                <p>회원이신 고객님의 개인정보를 관리하는 공간입니다.</p>
                            </a>
                        </li>
                        <li>
                            <img src="../../image/orderList.png">
                            <a href="">
                                <strong>주문내역 조회</strong>
                                <p>고객님께서 주문하신 상품의  주문내역을 확인하실 수 있습니다.</p>
                            </a>
                        </li>
                        <li>
                            <img src="../../image/heart_plus.png">
                            <a href="">
                                <strong>관심상품</strong>
                                <p>찜하신 상품의 목록을 보여드립니다.</p>
                            </a>
                        </li>
                        <li>
                            <img src="../../image/board.png">
                            <a href="">
                                <strong>게시물 관리</strong>
                                <p>고객님께서 작성하신 게시물을 관리하는 공간입니다.</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {};
    },
    methods: {},
    mounted() {},
  });
  app.mount("#app");
</script>