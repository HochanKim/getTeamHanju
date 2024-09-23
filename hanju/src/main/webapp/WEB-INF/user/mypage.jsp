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
        <div>
            <h2>마이페이지</h2>
        </div>
        <div>
            <ul>
                <li>
                    <strong>포인트</strong>
                    <span>0포인트</span>
                </li>
                <li>
                    <strong>배송준비중</strong>
                    <a href="">
                        <span>0</span>
                    </a>
                </li>
                <li>
                    <strong>배송중</strong>
                    <a href="">
                        <span>0</span>
                    </a>
                </li>
                <li>
                    <strong>배송완료</strong>
                    <a href="">
                        <span>0</span>
                    </a>
                </li>
            </ul>
        </div>
        <div>
            <ul>
                <li>
                    <a href="">
                        <strong>구독관리</strong>
                        <p>고객님께서 신청하신 정기배송의 신청 정보 및 내역을 확인하실 수 있습니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>리뷰</strong>
                        <p>리뷰 작성시 포인트 적립을 해드립니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>회원정보</strong>
                        <p>회원이신 고객님의 개인정보를 관리하는 공간입니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>주문내역 조회</strong>
                        <p>고객님께서 주문하신 상품의  주문내역을 확인하실 수 있습니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>장바구니</strong>
                        <p>장바구니에 담으신  상품의 목록을 보여드립니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>관심상품</strong>
                        <p>찜하신 상품의 목록을 보여드립니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>포인트</strong>
                        <p>포인트는 현금과 동일하게 상품 구매시 사용하실 수 있습니다.</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <strong>게시물 관리</strong>
                        <p>고객님께서 작성하신 게시물을 관리하는 공간입니다.</p>
                    </a>
                </li>
            </ul>
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